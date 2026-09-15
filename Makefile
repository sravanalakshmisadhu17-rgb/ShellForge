CC = gcc
CFLAGS = -Wall -Wextra -g -Iinclude

SRC = src/main.c
TARGET = bin/shellforge

PROG2_SRC = src/prog2.c
PROG2_TARGET = bin/prog2

all: $(TARGET) $(PROG2_TARGET)

$(TARGET): $(SRC)
	mkdir -p bin
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET)

$(PROG2_TARGET): $(PROG2_SRC)
	mkdir -p bin
	$(CC) $(CFLAGS) $(PROG2_SRC) -o $(PROG2_TARGET)

run:
	./$(TARGET)

run-prog2:
	./$(PROG2_TARGET) src/input.txt src/output.txt

clean:
	rm -rf bin/*
