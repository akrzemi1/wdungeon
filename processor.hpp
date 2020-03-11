#pragma once
#include "plot.hpp"
#include "state.hpp"

State initialState(plot2::GamePlot const& plot);
State transition(plot2::GamePlot const& plot, State state, std::string choice);
