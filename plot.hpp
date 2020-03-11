#pragma once
#include <boost/variant.hpp>
#include <map>
#include <vector>
#include <string>
#include <boost/optional.hpp>


namespace plot {

struct SetVariable
{
  std::string name;
  int value;
};

struct Variable
{
  std::string name;
};

struct Label
{
  std::string name;
};

struct MapUpdate
{
  std::string name;
};

struct Redirection
{
  std::vector<SetVariable> setVariables;
  MapUpdate mapUpdate;
  std::string narration;
  Label nextState;
};

struct Option
{
  std::string description;
  Redirection redirection;

};

struct Choice
{
  std::string prompt;
  std::vector<Option> options;
};

struct End
{
  std::string text;
  bool good;
};

struct Transition
{
  std::string narration;
  boost::variant<Redirection, Choice, End> action;
};

struct GamePlot
{
  Label initial;struct Variable
{
  std::string name;
  int value;
};

  std::map<Label, Transition> transitions;
};

}

namespace plot2 {

struct Variable
{
  std::string name;
  int value;
};


struct MapStep
{
  boost::optional<char> direction;
  boost::optional<std::string> modifications;
};


struct SingleRedirection
{
  std::vector<Variable> cond;
  boost::optional<std::vector<MapStep>> map;
  std::string next_state;
  std::vector<Variable> set_vars;
};

struct Option
{
  std::vector<Variable> cond;
  std::string decision;
  boost::optional<std::vector<MapStep>> map;
  std::string nextState;
  boost::optional<std::string> narration;
  std::vector<Variable> set_vars;
};


struct Choice{
  std::string prompt;
  std::vector<Option> options;
};


using Redirection = std::vector<SingleRedirection>;
using Alternative = boost::variant<Redirection, char, Choice>;

struct Transition
{
  std::string label;
  boost::optional<std::vector<MapStep>> map;
  boost::optional<std::string> text;
  Alternative redirection;
};

using GamePlot = std::vector<Transition>;

}
