all: main

main: heron.o triangle.o get_sides.o compute_area.o show_results.o
	g++ -o main heron.o triangle.o get_sides.o compute_area.o show_results.o -lm

heron.o: heron.cpp
	g++ -c heron.cpp

triangle.o: triangle.asm
	nasm -f elf64 triangle.asm -o triangle.o

get_sides.o: get_sides.c
	gcc -c get_sides.c fPIC

compute_area.o: compute_area.asm
	nasm -f elf64 -o compute_area.o compute_area.asm

show_results.o: show_results.cpp
	g++ -c show_results.cpp

clean:
	rm *.o main
