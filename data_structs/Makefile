CC=gcc
CFLAGS=-Wall -g

main: main.o list.o
	$(CC) $(CFLAGS) -o main main.o list.o

test: list.o test.o
	$(CC) $(CFLAGS) -o test list.o test.o

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

list.o: list.c list.h
	$(CC) $(CFLAGS) -c list.c

test.o: test.c
	$(CC) $(CFLAGS) -c test.c

runtest: test
	./test

clean:
	rm -f *.o main test

