CC = gcc
CFLAGS = -Wall -Wextra -g -Iinclude

SRC = src/main.c
TARGET = bin/shellforge

.PHONY: all build run clean

# ==============================
# Default ShellForge Build
# ==============================

all: build

build: $(TARGET)

$(TARGET): $(SRC) include/shell.h
	mkdir -p bin
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET)

run: build
	./$(TARGET)

# ==============================
# Practical 2 - File Copy
# ==============================

prog2: src/prog2.c
	$(CC) $(CFLAGS) src/prog2.c -o bin/prog2

run-prog2: prog2
	./bin/prog2

# ==============================
# Practical 3 - wait / waitpid
# ==============================

wait_waitpid_demo: src/wait_waitpid_demo.c
	$(CC) $(CFLAGS) src/wait_waitpid_demo.c -o bin/wait_waitpid_demo

run-wait: wait_waitpid_demo
	./bin/wait_waitpid_demo

# ==============================
# Practical 4 - Zombie Process
# ==============================

zombie_process: src/zombie_process.c
	$(CC) $(CFLAGS) src/zombie_process.c -o bin/zombie_process

run-zombie: zombie_process
	./bin/zombie_process

# ==============================
# Practical 5 - Pipes
# ==============================

prog5: src/prog5.c
	$(CC) $(CFLAGS) src/prog5.c -o bin/prog5

run-prog5: prog5
	./bin/prog5

# ==============================
# Practical 6 - FIFO
# ==============================

prog6_fifo_server: src/prog6_fifo_server.c
	$(CC) $(CFLAGS) src/prog6_fifo_server.c -o bin/prog6_fifo_server

prog6_fifo_client: src/prog6_fifo_client.c
	$(CC) $(CFLAGS) src/prog6_fifo_client.c -o bin/prog6_fifo_client

run-fifo-server: prog6_fifo_server
	./bin/prog6_fifo_server

run-fifo-client: prog6_fifo_client
	./bin/prog6_fifo_client

# ==============================
# Practical 7 - Memory Management
# ==============================

memory_demo: src/memory_demo.c
	$(CC) $(CFLAGS) src/memory_demo.c -o bin/memory_demo

prog7_linuxaddr: src/prog7_linuxaddr.c
	$(CC) $(CFLAGS) src/prog7_linuxaddr.c -o bin/prog7_linuxaddr

run-memory: memory_demo
	./bin/memory_demo

run-linuxaddr: prog7_linuxaddr
	./bin/prog7_linuxaddr

# ==============================
# Practical 8 - Dynamic Memory
# ==============================

dynamic_memory: src/dynamic_memory.c
	$(CC) $(CFLAGS) src/dynamic_memory.c -o bin/dynamic_memory

cow_demo: src/cow_demo.c
	$(CC) $(CFLAGS) src/cow_demo.c -o bin/cow_demo

run-dynamic-memory: dynamic_memory
	./bin/dynamic_memory

run-cow: cow_demo
	./bin/cow_demo

# ==============================
# Practical 9 - File I/O
# ==============================

copy_lowlevel: src/copy_lowlevel.c
	$(CC) -Wall -Wextra -O2 src/copy_lowlevel.c -o bin/copy_lowlevel

copy_stdio: src/copy_stdio.c
	$(CC) -Wall -Wextra -O2 src/copy_stdio.c -o bin/copy_stdio

redirect_output: src/redirect_output.c
	$(CC) -Wall -Wextra -g src/redirect_output.c -o bin/redirect_output

redirect_input: src/redirect_input.c
	$(CC) -Wall -Wextra -g src/redirect_input.c -o bin/redirect_input

practical9: copy_lowlevel copy_stdio redirect_output redirect_input
	@echo "Practical 9 programs compiled successfully."

run-copy-lowlevel: copy_lowlevel
	./bin/copy_lowlevel src/input_practical9.txt src/output_low.txt

run-copy-stdio: copy_stdio
	./bin/copy_stdio src/input_practical9.txt src/output_stdio.txt

run-redirect-output: redirect_output
	./bin/redirect_output

run-redirect-input: redirect_input
	./bin/redirect_input

# ==============================
# Clean
# ==============================

clean:
	rm -f bin/shellforge
	rm -f bin/prog2
	rm -f bin/wait_waitpid_demo
	rm -f bin/zombie_process
	rm -f bin/prog5
	rm -f bin/prog6_fifo_server
	rm -f bin/prog6_fifo_client
	rm -f bin/memory_demo
	rm -f bin/prog7_linuxaddr
	rm -f bin/dynamic_memory
	rm -f bin/cow_demo
	rm -f bin/copy_lowlevel
	rm -f bin/copy_stdio
	rm -f bin/redirect_output
	rm -f bin/redirect_input
