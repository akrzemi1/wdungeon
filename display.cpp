#include "display.hpp"
#include <sys/ioctl.h>
#include <unistd.h>
#include <stdlib.h>

Extent Display::size() const
{
  struct winsize w;
  ioctl(STDOUT_FILENO, TIOCGWINSZ, &w);

  return {.height = w.ws_row, .width = w.ws_col};
}

void Display::clear()
{
  system("clear");
}
