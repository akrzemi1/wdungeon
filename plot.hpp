#pragma once
#include <boost/variant.hpp>
#include <map>
#include <vector>
#include <string>

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
  Label initial;
  std::map<Label, Transition> transitions;
};
