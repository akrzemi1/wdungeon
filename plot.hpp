#pragma once

struct SetVariable
{
};

struct Variable
{
  std::string name;
};

struct Label
{
  std::string name;
}

struct MapUpdate
{
  std::string name;
}

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

struct Transition
{
  std::string narration;
  boost::variant<Redirection, Choice> action;
};

struct GamePlot
{
  Label initial;
  std::map<Label, Transition> transitions;
};
