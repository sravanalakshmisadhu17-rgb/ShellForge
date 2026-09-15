CC = gcc
CFLAGS = -Wall -Wextra -g -Iinclude

# ShellForge main program
SRC = src/main.c
TARGET = bin/shellforge

# Practical 2 - File Copy using System Calls
PROG2_SRC = src/prog2.c
PROG2_TARGET = bin/prog2

# Practical 3 - Process Creation using fork()
PROG3_SRC = src/process.c
PROG3_TARGET = bin/process

# Practical 4A - wait() and waitpid()
PROG4A_SRC = src/wait_waitpid_demo.c
PROG4A_TARGET = bin/wait_waitpid_demo

# Practical 4B - Zombie Process
PROG4B_SRC = src/zombie_process.c
PROG4B_TARGET = bin/zombie_process


# Build all programs
all: $(TARGET) $(PROG2_TARGET) $(PROG3_TARGET) $(PROG4A_TARGET) $(PROG4B_TARGET)


# Build ShellForge
$(TARGET): $(SRC)
	mkdir -p bin
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET)


# Build Practical 2
$(PROG2_TARGET): $(PROG2_SRC)
	mkdir -p bin
	$(CC) $(CFLAGS) $(PROG2_SRC) -o $(PROG2_TARGET)


# Build Practical 3
$(PROG3_TARGET): $(PROG3_SRC)
	mkdir -p bin
	$(CC) $(CFLAGS) $(PROG3_SRC) -o $(PROG3_TARGET)


# Build Practical 4A
$(PROG4A_TARGET): $(PROG4A_SRC)
	mkdir -p bin
	$(CC) $(CFLAGS) $(PROG4A_SRC) -o $(PROG4A_TARGET)


# Build Practical 4B
$(PROG4B_TARGET): $(PROG4B_SRC)
	mkdir -p bin
	$(CC) $(CFLAGS) $(PROG4B_SRC) -o $(PROG4B_TARGET)


# Run ShellForge
run:
	./$(TARGET)


# Run Practical 2
run-prog2:
	./$(PROG2_TARGET) src/input.txt src/output.txt


# Run Practical 3
run-prog3:
	./$(PROG3_TARGET)


# Run Practical 4A
run-prog4a:
	./$(PROG4A_TARGET)


# Run Practical 4B
run-prog4b:
	./$(PROG4B_TARGET)


# Clean compiled files
clean:
	rm -rf bin/*
