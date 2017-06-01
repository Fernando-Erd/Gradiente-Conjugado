CC = gcc
CFLAGS = -I/home/soft/likwid/include -llikwid -L/usr/lib -L/home/soft/likwid/lib  -O3 -mavx -march=native -Wall
LDFLAGS = -lm
FILES = ./files
INCLUDE = ./include
LIKWID_LIBS=-L/home/soft/likwid/lib -llikwid
LIKWID_INCLUDE=-I/home/soft/likwid/include

all: cgSolver

aritmetica.o: $(INCLUDE)/aritmetica.h $(FILES)/aritmetica.c $(INCLUDE)/generate.h $(FILES)/generate.c
	$(CC) -c $(FILES)/aritmetica.c $(CFLAGS) $(LDFLAGS)

entrada.o: $(INCLUDE)/entrada.h $(FILES)/entrada.c
	$(CC) -c $(FILES)/entrada.c $(CFLAGS)

generate.o: $(INCLUDE)/generate.h $(FILES)/generate.c
	$(CC) -c $(FILES)/generate.c $(CFLAGS) $(LDFLAGS)

gradiente.o: $(INCLUDE)/gradiente.h $(FILES)/gradiente.c $(INCLUDE)/aritmetica.h $(FILES)/aritmetica.c
	$(CC) -c $(FILES)/gradiente.c $(CFLAGS) $(LDFLAGS)

main.o: $(INCLUDE)/entrada.h $(FILES)/entrada.c $(INCLUDE)/generate.h $(FILES)/generate.c $(INCLUDE)/gradiente.h $(FILES)/gradiente.c $(FILES)/main.c
	$(CC) -c $(FILES)/main.c $(CFLAGS) $(LDFLAGS) 

cgSolver: aritmetica.o entrada.o generate.o gradiente.o main.o
	$(CC) aritmetica.o entrada.o generate.o gradiente.o main.o -o cgSolver $(CFLAGS) $(LDFLAGS)

clean:
	rm cgSolver *.o
