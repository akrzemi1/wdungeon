#include "types.hpp"
#include "display.hpp"
#include "plot.hpp"
#include "parser.hpp"
#include <stdio.h>
#include <iostream>
#include <string>
#include <vector>

Extent map_extent {.height = 16, .width = 32};

class Map
{
public:
  const Extent extent;
  std::vector<char> pixels = std::vector<char>(extent.height * extent.width);
};

void print_screen()
{
  Extent screen = Display{}.size();
  for (int h = 0, H = screen.height - 1; h < H; h++)
  {
    for (int w = 0, W = screen.width; w < W; w++)
    {
      if (h < map_extent.height +2  && w < map_extent.width +2)
      {
        // if (h > 0 && w > 0 && h < map_extent.height +1 &&  map_extent.width +1)
        if (h > 0 && w > 0 && h < map_extent.height +1 && w < map_extent.width +1)
          std::cout << "\e[1;40m"" ""\e[0m";
        else
          std::cout << " ";
      }
      else {
        std::cout << "a";
      }
    }
    std::cout << "\n";
  }
}

void test(std::string input);
void test_file(std::string file_name);

int main()
{
  printf("width %d\n", Display{}.size().width);
  printf("height %d\n", Display{}.size().height);


  for (bool playing = true; playing;)
  {
    test_file("./test.plot");
    break;
//    print_screen();
    std::string input;
    getline(std::cin, input);
    if (input == "q")
      playing = false;

    test(input); std::cout <<"\n";
  }

  return 0;
}

/*
Black       0;30     Dark Gray     1;30
Blue        0;34     Light Blue    1;34
Green       0;32     Light Green   1;32
Cyan        0;36     Light Cyan    1;36
Red         0;31     Light Red     1;31
Purple      0;35     Light Purple  1;35
Brown       0;33     Yellow        1;33
Light Gray  0;37     White         1;37
*/
