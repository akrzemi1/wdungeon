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
  explicit Map(Extent e) : extent(e), pixels(e.height * e.width) {}
  const Extent extent;
  std::vector<char> pixels;
};


std::string::const_iterator skip_white(std::string::const_iterator it, std::string::const_iterator end)
{
  while (it != end && std::isspace(*it) )
    ++it;

  return it;
}

std::string select(std::string::const_iterator& it, std::string::const_iterator end, int width)
{
  int d = std::distance(it, end);
  if (d < width)
  {
    std::string ans(it, end);
    it = end;
    return ans + std::string(width - d, ' ');
  }

  std::string ans (it, it + width);
  it += width;
  return ans;
}

std::string map_char(char)
{
  return "\e[1;40m"" ""\e[0m";
}

std::string select_map(Map const& map, int row)
{
  if (row == 0 || row == map.extent.height)
    return std::string(map.extent.width + 2, ' ');

  std::string ans(1, ' ');

  for (int i = 0; i < map.extent.width; ++i)
    ans += map_char(map.pixels[row * map.extent.width + i]);

  ans.push_back(' ');
  return ans;
}

void print_screen(std::string const& text, Map const& map)
{
  Display{}.clear();
  const Extent screen = Display{}.size();
  std::string::const_iterator it = skip_white(text.begin(), text.end());

  for(int row = 0; it != text.end() || row < map.extent.height + 1; ++row)
  {
    bool map_line = row < map.extent.height + 2;
    int space_in_line = map_line ? screen.width - map.extent.width - 2 : screen.width;

    std::string text = select(it, text.end(), space_in_line);
    if (map_line)
      text += select_map(map, row);

    std::cout << text << "\n";
  }
}

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
//  printf("width %d\n", Display{}.size().width);
//  printf("height %d\n", Display{}.size().height);

  Map map(map_extent);

  for (bool playing = true; playing;)
  {
    print_screen("dupa dupa", map);
    //test_file("./test.plot");
    //break;
//    print_screen();
    std::string input;
    getline(std::cin, input);
    if (input == "q")
      playing = false;


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
