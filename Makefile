test: test.cpp display.cpp display.hpp types.hpp plot.hpp
	g++ -std=c++2a test.cpp display.cpp -Wall -Wpedantic -Wextra -o test
