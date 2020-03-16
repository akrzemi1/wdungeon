#pragma once
#include <string>

struct State;

void save(State const&, std::string file_name);
State load(std::string file_name);
