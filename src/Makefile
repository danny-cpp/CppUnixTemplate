all: main

main: calculator.o hello.o
	g++ -o main calculator.o hello.o

calculator.o: calculator.cpp calculator.h
	g++ -c calculator.cpp

hello.o: hello.cpp
	g++ -c hello.cpp

clean:
	rm -f *.o main