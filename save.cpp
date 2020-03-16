#include "save.hpp"
#include "state.hpp"
#include <boost/archive/text_oarchive.hpp>
#include <boost/archive/text_iarchive.hpp>
#include <boost/serialization/string.hpp>
#include <boost/serialization/vector.hpp>
#include <boost/serialization/map.hpp>
#include <fstream>

namespace boost {
namespace serialization {

  template<class Archive>
  void serialize(Archive & ar, Extent & v, const unsigned int /*version*/)
  {
      ar & v.height;
      ar & v.width;
  }

  template<class Archive>
  void serialize(Archive & ar, Coordinate & v, const unsigned int /*version*/)
  {
      ar & v.i;
      ar & v.j;
  }

  template<class Archive>
  void serialize(Archive & ar, Map & m, const unsigned int /*version*/)
  {
      ar & m.extent;
      ar & m.pixels;
      ar & m.cursor;
  }

  template<class Archive>
  void serialize(Archive & ar, Directions & s, const unsigned int /*version*/)
  {
      ar & s.N;
      ar & s.E;
      ar & s.S;
      ar & s.W;
  }

template<class Archive>
void serialize(Archive & ar, State & s, const unsigned int /*version*/)
{
    ar & s.map;
    ar & s.directions;
    ar & s.text;
    ar & s.variables;
    ar & s.transition_name;
    ar & s.options;
    ar & s.finished;
}

} // namespace serialization
} // namespace boost


void save(State const& state, std::string file_name)
{
  std::ofstream ofs(file_name.c_str());
  boost::archive::text_oarchive oa(ofs);
  oa << state;
}

State load(std::string file_name)
{
  std::ifstream ifs(file_name.c_str());
  boost::archive::text_iarchive ia(ifs);

  State result{map_extent};
  ia >> result;
  return result;
}
