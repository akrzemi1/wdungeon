test: test.cpp display.cpp display.hpp types.hpp plot.hpp render.cpp render.hpp state.hpp parser.o
	g++ -g -std=c++2a test.cpp display.cpp render.cpp -Wall -Wextra -o test parser.o

parser.o: parser.cpp parser.hpp plot.hpp
	g++ -g -std=c++2a parser.cpp -Wall -Wextra -c
