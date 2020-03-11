test: test.cpp display.cpp display.hpp types.hpp plot.hpp render.cpp render.hpp state.hpp processor.hpp processor.cpp parser.o
	g++ -g -std=c++2a test.cpp display.cpp render.cpp processor.cpp -Wall -Wextra -o test parser.o

parser.o: parser.cpp parser.hpp plot.hpp
	g++ -g -std=c++2a parser.cpp -Wall -Wextra -c
