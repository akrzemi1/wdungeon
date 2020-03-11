#include "processor.hpp"
#include <cassert>

using namespace plot2;

namespace {

Transition const* getNode(std::string name, plot2::GamePlot const& plot)
{
  auto by_name = [name](Transition const& t) { return t.label == name; };
  auto it = std::find_if(plot.begin(), plot.end(), by_name);
  if (it == plot.end())
    throw std::runtime_error("PLOT: missing state: " + name);

  return &*it;
}


struct VisitRedirection : boost::static_visitor<Transition const*>
{
  State& state;
  GamePlot const& plot;
  Transition const& transition;

  VisitRedirection(State& s, GamePlot const& p, Transition const& t)
   : state(s), plot(p), transition(t) {}

  //bool satisfied(Variable const& v) const { return state.variables[v.name] == v.value; }

  result_type operator()(Redirection const& redirs) const {
    for (SingleRedirection const& r : redirs)
    {
      auto satisfied = [&](Variable const& v) { return state.variables[v.name] == v.value; };
      if (std::all_of(r.cond.begin(), r.cond.end(), satisfied))
      {
        for (Variable const& v: r.set_vars)
          state.variables[v.name] = v.value;

        return getNode(r.next_state, plot);
      }
    }
    throw std::runtime_error("PLOT: missing redirection in state: " + transition.label);
  }

  result_type operator()(Choice const& choice) const {
    auto satisfied = [&](Variable const& v) { return state.variables[v.name] == v.value; };
    state.text.emplace_back();
    state.text.emplace_back(choice.prompt);

    for (int i = 1; Option const& opt : choice.options)
    {
      if (std::all_of(opt.cond.begin(), opt.cond.end(), satisfied))
      {
        std::string key {char(i + '0')};
        state.text.emplace_back(key+ ". " + opt.decision);
        state.options[key] = std::distance(choice.options.data(), &opt);
        ++i;
      }
    }
    state.transition_name = transition.label;
    // TODO: shortcut when only one option
    return nullptr;
  }

  result_type operator()(char c) const {
    state.text.emplace_back();
    std::string final = (c == '!') ? " G R A T U L A C J E" : "K O N I E C";
    state.text.emplace_back(final);
    state.finished = true;
    return nullptr;
  }
};

void split_text(std::string const& text, std::vector<std::string> & out)
{
  for (char ch : text)
  {
    if (ch != '/')
      out.back().push_back(ch);
    else
      out.emplace_back();
  }
}

}

void advance_game(Transition const* t, State & state, plot2::GamePlot const& plot)
{
  assert(t);
  do {
    if (t->text)
      split_text(*t->text, state.text);

    t = boost::apply_visitor(VisitRedirection{state, plot, *t}, t->redirection);
  } while (t != nullptr);
}

State initialState(plot2::GamePlot const& plot)
{
  assert(!plot.empty());
  State state(map_extent);

  Transition const* t = &plot.front();
  state.text.emplace_back();

  advance_game(t, state, plot);

  return state;
}

State transition(plot2::GamePlot const& plot, State state, std::string choice)
{
  Transition const* t = getNode(state.transition_name, plot);
  auto* c = get<Choice>(&t->redirection);
  assert(c);
  state.text.clear();
  state.text.emplace_back();

  auto it = state.options.find(choice);
  assert(it != state.options.end());

  assert(it->second < int(c->options.size()));
  Option const& opt = c->options[it->second];

  if (opt.narration)
    split_text(*opt.narration, state.text);

  for (Variable const& v: opt.set_vars)
    state.variables[v.name] = v.value;

  t = getNode(opt.nextState, plot);

  advance_game(t, state, plot);
  return state;
}
