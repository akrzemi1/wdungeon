#pragma once

#include <string>
#include <vector>
#include "state.hpp"

void render(std::string const& text, State const& state);
void render(std::vector<std::string> const& text, State const& state, std::string const& status);
std::string select_text(std::string::const_iterator& it, std::string::const_iterator const end, int width);
