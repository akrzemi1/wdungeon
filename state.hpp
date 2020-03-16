#pragma once
#include <vector>
#include <string>
#include <map>
#include "types.hpp"

#include <boost/serialization/access.hpp>

constexpr Extent map_extent {.height = 18, .width = 32};

class Map
{
  friend class boost::serialization::access;
public:
  using pixel_type = std::string;
  explicit Map(Extent e) :
    extent(e), pixels(e.height * e.width) {}
  /*const*/ Extent extent;
  std::vector<pixel_type> pixels;
  Coordinate cursor {12, 16};

  pixel_type& pixel(Coordinate c) { return pixels[c.i * extent.width + c.j]; }
  pixel_type const& pixel(Coordinate c) const { return pixels[c.i * extent.width + c.j]; }
};

struct Directions
{
  bool N, E, S, W;
};

struct State
{
  explicit State(Extent ext) : map(ext) {}

  Map map;
  Directions directions {};
  std::vector<std::string> text;
  std::map<std::string, int> variables;
  std::string transition_name;
  std::map<std::string, int> options;
  bool finished = false;
};
