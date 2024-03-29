#include "render.hpp"
#include <iostream>
#include <cassert>
#include <algorithm>
#include "display.hpp"

namespace {

  //printf("\e[97;47m""XXX""\e[0m");
  const std::string cMapBorder = "\e[30;47m";
  const std::string cMapFill = "\e[30;47m";
  const std::string cMapInvert = "\e[31;107m";
  const std::string cReset = "\e[0m";
  const std::string cActiveDir = "\e[31;47m";
  const std::string cInactiveDir = "\e[30;47m";

  std::string map_char(Map::pixel_type p, bool invert)
  {
    //const std::string cBlackOverGray = "\e[30;47m";
    std::string ans = invert ? cMapInvert : cMapFill;

    if (p == "TV")
      ans += "\u2503";
    else if (p == "TH")
      ans += "\u2501";
    else if (p == "TTL")
      ans += "\u252B";
    else if (p == "TTR")
      ans += "\u2523";
    else if (p == "TTU")
      ans += "\u253B";
    else if (p == "TTD")
      ans += "\u2533";
    else if (p == "TX")
      ans += "\u254B";
    else if (p == "TLL")
      ans += "\u2517";
    else if (p == "TLR")
      ans += "\u251B";
    else if (p == "TCV")
      ans += "\u2588";
    else if (p == "THU")
      ans += "\u2580";
    else if (p == "SPC")
      ans += "\u2592";  // "opuścić podziemia"
    else if (p == "#")
      ans += "#";
    else
      ans += " ";

    return ans;
  }

  std::string repeated(int r, std::string str)
  {
    std::string ans;
    for (int i = 0; i < r; ++i)
      ans += str;

    return ans;
  }


  std::string::const_iterator skip_white(std::string::const_iterator it, std::string::const_iterator end)
  {
    while (it != end && std::isspace(*it) )
      ++it;

    return it;
  }

  using iter = std::string::const_iterator;

  auto is_white = [](char c){ return std::isspace(c); };
  auto is_break = [](char c){ return c == '/'; };
  auto is_special = [](char c){ return is_white(c) || is_break(c); };


  std::string select(iter& it, iter const end, int width)
  {
    auto resized = [width] (std::string s) {
      assert(int(s.size()) <= width);
      s.resize(width, ' ');
      return s;
    };

    std::string ans;

LOOP:
    if (it == end)
    {
      return resized(ans);
    }
    else if (is_break(*it))
    {
      ++it;
      return resized(ans);
    }
    else if (is_white(*it))
    {
      it = std::find_if_not(it, end, is_white);
      goto LOOP;
    }
    else
    {
      assert(it != end && !is_special(*it));
      iter p = std::find_if(it, end, is_special);
      bool needs_space = !ans.empty();
      int dist = std::distance(it, p) + int(needs_space);

      if (dist <= width)
      {
        ans += std::string(int(needs_space), ' ') + std::string(it, p);
        it = p;
        width -= dist;
        assert (width >= 0);
        goto LOOP;
      }
      else if (!ans.empty())
      {
        return resized(ans);
      }
      else
      {
        assert(!needs_space);
        ans = std::string(it, it + dist);
        it += dist;
        return resized(ans);
      }
    }

    assert(false);
    /*
    int d = std::distance(it, end);
    if (d < width)
    {
      std::string ans(it, end);
      it = end;
      return ans + std::string(width - d, ' ');
    }

    std::string ans (it, it + width);
    it += width;
    return ans;*/
  }

std::string bottom_map_border(int map_width, std::string const& status)
{
  assert(int(status.size()) + 2 <= map_width);
  std::string result = " " + cMapBorder + "\u2514";

  if (status.empty())
  {
    result += repeated(map_width, "\u2500");
  }
  else
  {
    result += " " + status + " " + repeated(map_width - 2 - status.size(), "\u2500");
  }

  result += "\u2518" + cReset;
  return result;
}

std::string select_map(State const& state, int row, std::string const& status)
{
  if (row == 0)
    return " " + cMapBorder + "\u250c" + repeated(state.map.extent.width, "\u2500") + "\u2510" + cReset;
  if (row == state.map.extent.height + 2)
    return std::string(state.map.extent.width + 3, ' ');

  if (row == state.map.extent.height + 1)
    return bottom_map_border(state.map.extent.width, status); //" " + cMapBorder + "\u2514" + repeated(state.map.extent.width, "\u2500") + "\u2518" + cReset;

  std::string ans = " " + cMapBorder + "\u2502" + cReset;
  int i = row - 1;

  for (int j = 0; j < state.map.extent.width; ++j)
  {
    if (i == 0 && j == 1)
      ans += (state.directions.N ? cActiveDir : cInactiveDir) + "N";
    else if (i == 1 && j == 0)
      ans += (state.directions.W ? cActiveDir : cInactiveDir) + "W";
    else if (i == 1 && j == 1)
      ans += cInactiveDir + "\u253c";
    else if (i == 1 && j == 2)
      ans += (state.directions.E ? cActiveDir : cInactiveDir) + "E";
    else if (i == 2 && j == 1)
      ans += (state.directions.S ? cActiveDir : cInactiveDir) + "S";
    else {
      bool invert = i == state.map.cursor.i && j == state.map.cursor.j;
      ans += map_char(state.map.pixel({i, j}), invert);
    }
  }
  ans += cMapBorder + "\u2502" + cReset;

  return ans;
}

}

std::string select_text(iter& it, iter const end, int width)
{
  return select(it, end, width);
}

void render(std::string const& text, State const& state)
{
  Display{}.clear();
  const Extent screen = Display{}.size();
  std::string::const_iterator it = skip_white(text.begin(), text.end());

  for(int row = 0; it != text.end() || row < state.map.extent.height +2; ++row)
  {
    bool map_line = row < state.map.extent.height +3;
    int space_in_line = map_line ? screen.width - state.map.extent.width - 3 : screen.width;

    std::string text_line = select(it, text.end(), space_in_line);
    if (map_line)
      text_line += select_map(state, row, "");

    std::cout << text_line << "\n";
  }
}

void render(std::vector<std::string> const& text, State const& state, std::string const& status)
{
  assert (!text.empty());
  int i = 0;
  std::cout << std::endl;
  Display{}.clear();
  const Extent screen = Display{}.size();
  std::string::const_iterator it = skip_white(text[i].begin(), text[i].end());

  for(int row = 0; i < int(text.size()) /*|| it != text[i].end()*/ || row < state.map.extent.height +2; ++row)
  {
    bool map_line = row < state.map.extent.height +3;
    int space_in_line = map_line ? screen.width - state.map.extent.width - 3 : screen.width;

    std::string text_line (space_in_line, ' ');

    if (i < int(text.size()))
    {
      text_line = select(it, text[i].end(), space_in_line);
      if (it == text[i].end())
      {
        ++i;
        if (i < int(text.size()))
          it = skip_white(text[i].begin(), text[i].end());
      }
    }

    if (map_line)
      text_line += select_map(state, row, status);

    std::cout << text_line << "\n";
  }
}
