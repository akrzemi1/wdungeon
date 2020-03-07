test: test.cpp display.cpp display.hpp types.hpp plot.hpp parser.hpp parser.cpp
	g++ -std=c++2a test.cpp display.cpp parser.cpp -Wall -Wextra -o test
