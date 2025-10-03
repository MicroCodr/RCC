# Define the compiler and assembler
CC = g++
CFLAGS = -Wall -std=c++11 -no-pie
ASM = nasm
ASMFLAGS = -f elf64 
# Define the targets
TARGET = resistance_calculator
OBJS = ohm.o resistance.o get_resistance.o compute_resistance.o show_resistance.o

# Default target
all: $(TARGET)

# Linking the target
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

# Compiling each source file
ohm.o: ohm.cpp
	$(CC) $(CFLAGS) -c ohm.cpp

resistance.o: resistance.asm
	$(ASM) $(ASMFLAGS) resistance.asm

get_resistance.o: get_resistance.c
	$(CC) $(CFLAGS) -c get_resistance.c

compute_resistance.o: compute_resistance.cpp
	$(CC) $(CFLAGS) -c compute_resistance.cpp

show_resistance.o: show_resistance.cpp
	$(CC) $(CFLAGS) -c show_resistance.cpp

# Running the program
run: $(TARGET)
	./$(TARGET)

# Cleaning up
clean:
	rm -f $(OBJS) $(TARGET)

