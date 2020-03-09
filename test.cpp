#include "types.hpp"
#include "display.hpp"
#include "plot.hpp"
#include "parser.hpp"
#include <stdio.h>
#include <iostream>
#include <string>
#include <vector>

Extent map_extent {.height = 18, .width = 32};

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
  return "\e[1;40m""\u2524""\e[0m";
}

std::string repeated(int r, std::string str)
{
  std::string ans;
  for (int i = 0; i < r; ++i)
    ans += str;

  return ans;
}

std::string select_map(Map const& map, int row)
{
  if (row == 0)
    return " \e[1;40m""\u250c" + repeated(map.extent.width, "\u2500") + "\u2510""\e[0m";
  if (row == map.extent.height + 2)
    return std::string(map.extent.width + 3, ' ');

  if (row == map.extent.height + 1)
    return " \e[1;40m""\u2514" + repeated(map.extent.width, "\u2500") + "\u2518""\e[0m";

  std::string ans = " \e[1;40m""\u2502""\e[0m";

  for (int i = 0; i < map.extent.width; ++i)
  {
    ans += map_char(map.pixels[row * map.extent.width + i]);
  }
  ans += "\e[1;40m""\u2502""\e[0m";

  return ans;
}

void print_screen(std::string const& text, Map const& map)
{
  Display{}.clear();
  const Extent screen = Display{}.size();
  std::string::const_iterator it = skip_white(text.begin(), text.end());

  for(int row = 0; it != text.end() || row < map.extent.height +2; ++row)
  {
    bool map_line = row < map.extent.height +3;
    int space_in_line = map_line ? screen.width - map.extent.width - 3 : screen.width;

    std::string text_line = select(it, text.end(), space_in_line);
    if (map_line)
      text_line += select_map(map, row);

    std::cout << text_line << "\n";
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

std::string long_text = "wef fwefwe fwefew fwe fwe fwe wef we fwef we fwefwefwefwefwe fwefwefwefwe fwefwef wefwe fwef we fwe f wef we fwe fwe f"
"fwefwef nf nrweinu ruwn weuiweuf nenwe fwfiu fui wf wefn ewfiunwef f wefnwe fnwei nfwenf wefi e ifwefweinwei nfwenfiwefn efweui fn"
"fwefwefjweioj  fwefjief owefj weiojfowe fwej fwej fio weio fweiofjweiofiowefwejfjwefjweiofjio  jfweif w ofweio  fjiowejfwe fo wejf";

int main()
{
//  printf("width %d\n", Display{}.size().width);
//  printf("height %d\n", Display{}.size().height);

  Map map(map_extent);

  for (bool playing = true; playing;)
  {
    print_screen(long_text, map);
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



https://jrgraphix.net/r/Unicode/2500-257F

        #define RB "\e(0\x6a\e(B" // 188 Right Bottom corner
        #define RT "\e(0\x6b\e(B" // 187 Right Top corner
        #define LT "\e(0\x6c\e(B" // 201 Left Top cornet
        #define LB "\e(0\x6d\e(B" // 200 Left Bottom corner
        #define MC "\e(0\x6e\e(B" // 206 Midle Cross
        #define HL "\e(0\x71\e(B" // 205 Horizontal Line
        #define LC "\e(0\x74\e(B" // 204 Left Cross
        #define RC "\e(0\x75\e(B" // 185 Right Cross
        #define BC "\e(0\x76\e(B" // 202 Bottom Cross
        #define TC "\e(0\x77\e(B" // 203 Top Cross
        #define VL "\e(0\x78\e(B" // 186 Vertical Line
        #define SP " "            // space string
*/
