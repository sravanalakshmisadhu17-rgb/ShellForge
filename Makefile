CC = gcc
CFLAGS = -Wall -Wextra -g -Iinclude

BIN = bin

.PHONY: all run clean \
        run-prog2 run-process run-wait run-zombie \
        run-prog5 run-ls-grep \
        run-fifo-server run-fifo-client run-signal


# ============================================================
# ALL
# ============================================================

all: $(BIN)/shellforge \
     $(BIN)/prog2 \
     $(BIN)/process \
     $(BIN)/wait_waitpid_demo \
     $(BIN)/zombie_process \
     $(BIN)/prog5 \
     $(BIN)/ls_grep_pipe \
     $(BIN)/prog6_fifo_server \
     $(BIN)/prog6_fifo_client \
     $(BIN)/signal_handler


# ============================================================
# WEEK 1 - SHELLFORGE REPL
# ============================================================

$(BIN)/shellforge: src/main.c include/shell.h
	mkdir -p $(BIN)
	$(CC) $(CFLAGS) -o $(BIN)/shellforge src/main.c


run: $(BIN)/shellforge
	./$(BIN)/shellforge


# ============================================================
# PRACTICAL 2 - FILE COPY
# ============================================================

$(BIN)/prog2: src/prog2.c
	mkdir -p $(BIN)
	$(CC) $(CFLAGS) -o $(BIN)/prog2 src/prog2.c


run-prog2: $(BIN)/prog2
	./$(BIN)/prog2


# ============================================================
# PRACTICAL 3 - FORK / PROCESS
# ============================================================

$(BIN)/process: src/process.c
	mkdir -p $(BIN)
	$(CC) $(CFLAGS) -o $(BIN)/process src/process.c


run-process: $(BIN)/process
	./$(BIN)/process


# ============================================================
# PRACTICAL 4 - WAIT / WAITPID
# ============================================================

$(BIN)/wait_waitpid_demo: src/wait_waitpid_demo.c
	mkdir -p $(BIN)
	$(CC) $(CFLAGS) -o $(BIN)/wait_waitpid_demo src/wait_waitpid_demo.c


run-wait: $(BIN)/wait_waitpid_demo
	./$(BIN)/wait_waitpid_demo


# ============================================================
# PRACTICAL 4 - ZOMBIE PROCESS
# ============================================================

$(BIN)/zombie_process: src/zombie_process.c
	mkdir -p $(BIN)
	$(CC) $(CFLAGS) -o $(BIN)/zombie_process src/zombie_process.c


run-zombie: $(BIN)/zombie_process
	./$(BIN)/zombie_process


# ============================================================
# PRACTICAL 5 - ANONYMOUS PIPE PRODUCER / CONSUMER
# ============================================================

$(BIN)/prog5: src/prog5.c
	mkdir -p $(BIN)
	$(CC) $(CFLAGS) -o $(BIN)/prog5 src/prog5.c


run-prog5: $(BIN)/prog5
	./$(BIN)/prog5


# ============================================================
# PRACTICAL 5 - ls | grep PIPELINE
# ============================================================

$(BIN)/ls_grep_pipe: src/ls_grep_pipe.c
	mkdir -p $(BIN)
	$(CC) $(CFLAGS) -o $(BIN)/ls_grep_pipe src/ls_grep_pipe.c


run-ls-grep: $(BIN)/ls_grep_pipe
	./$(BIN)/ls_grep_pipe


# ============================================================
# PRACTICAL 6 - FIFO SERVER
# ============================================================

$(BIN)/prog6_fifo_server: src/prog6_fifo_server.c
	mkdir -p $(BIN)
	$(CC) $(CFLAGS) -o $(BIN)/prog6_fifo_server src/prog6_fifo_server.c


run-fifo-server: $(BIN)/prog6_fifo_server
	./$(BIN)/prog6_fifo_server


# ============================================================
# PRACTICAL 6 - FIFO CLIENT
# ============================================================

$(BIN)/prog6_fifo_client: src/prog6_fifo_client.c
	mkdir -p $(BIN)
	$(CC) $(CFLAGS) -o $(BIN)/prog6_fifo_client src/prog6_fifo_client.c


run-fifo-client: $(BIN)/prog6_fifo_client
	./$(BIN)/prog6_fifo_client


# ============================================================
# PRACTICAL 6 - POSIX SIGNAL HANDLING
# ============================================================

$(BIN)/signal_handler: src/signal_handler.c
	mkdir -p $(BIN)
	$(CC) $(CFLAGS) -o $(BIN)/signal_handler src/signal_handler.c


run-signal: $(BIN)/signal_handler
	./$(BIN)/signal_handler


# ============================================================
# CLEAN
# ============================================================

clean:
	rm -f $(BIN)/shellforge
	rm -f $(BIN)/prog2
	rm -f $(BIN)/process
	rm -f $(BIN)/wait_waitpid_demo
	rm -f $(BIN)/zombie_process
	rm -f $(BIN)/prog5
	rm -f $(BIN)/ls_grep_pipe
	rm -f $(BIN)/prog6_fifo_server
	rm -f $(BIN)/prog6_fifo_client
	rm -f $(BIN)/signal_handler

	rm -f /tmp/server_fifo
	rm -f /tmp/client_*_fifo
