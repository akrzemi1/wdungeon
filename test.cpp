#include "types.hpp"
#include "display.hpp"
#include "plot.hpp"
#include "parser.hpp"
#include <stdio.h>
#include <iostream>
#include <string>
#include <vector>
#include  <boost/core/lightweight_test.hpp>

#include "state.hpp"
#include "render.hpp"
#include "processor.hpp"
#include "save.hpp"




void print_screen()
{
  Extent screen = Display{}.size();
  for (int h = 0, H = screen.height - 1; h < H; h++)
  {
    for (int w = 0, W = screen.width; w < W; w++)
    {
      if (h < map_extent.height +2  && w < map_extent.width +2)
      {
        // if (h > 0 && w > 0 && h < map_extent.height +1 &&  map_extent.width +1)
        if (h > 0 && w > 0 && h < map_extent.height +1 && w < map_extent.width +1)
          std::cout << "\e[1;40m"" ""\e[0m";
        else
          std::cout << " ";
      }
      else {
        std::cout << "a";
      }
    }
    std::cout << "\n";
  }
}

void test(std::string input);
void test_file(std::string file_name);

std::string long_text = "wef fwefwe fwefew fwe fwe fwe wef we fwef we fwefwefwefwefwe fwefwefwefwe fwefwef wefwe fwef we fwe f wef we fwe fwe f"
"fwefwef nf nrweinu ruwn weuiweuf nenwe fwfiu fui wf wefn ewfiunwef f wefnwe fnwei nfwenf wefi e ifwefweinwei nfwenfiwefn efweui fn"
"fwefwefjweioj  fwefjief owefj weiojfowe fwej fwej fio weio fweiofjweiofiowefwejfjwefjweiofjio  jfweif w ofweio  fjiowejfwe fo wejf";



void test_line_break(std::string input, int width, int offset, std::string expected, int expected_offset)
{
  std::string::const_iterator it = input.begin() + offset;
  std::string ans = select_text(it, input.end(), width);
  BOOST_TEST_EQ(ans, expected);

  std::string::const_iterator old_it = input.begin() + offset;
  BOOST_TEST_EQ(std::distance(old_it, it) + offset, expected_offset);

  BOOST_TEST_EQ(width, ans.size());
};

int perform_tests()
{
  using namespace std::string_literals;

  test_line_break("wef fwefwe fwefew", 16, 0, "wef fwefwe      ", 11);
  test_line_break("AA BB", 4, 0, "AA  "s, 3);
  test_line_break("AA BB", 3, 0, "AA "s, 3);
  test_line_break("AA BB", 2, 0, "AA"s, 3);
  test_line_break("AA ", 2, 0, "AA"s, 3);

  test_line_break("AA  BB", 2, 0, "AA"s, 4);
  test_line_break("AA  BB", 3, 0, "AA "s, 4);
  test_line_break("AA  BB", 4, 0, "AA  "s, 4);
  test_line_break("AA  BB", 5, 0, "AA BB"s, 6);

  test_line_break("AA BB", 5, 0, "AA BB"s, 5);
  test_line_break("AA BB CC", 5, 0, "AA BB"s, 6);

  test_line_break("AA BB.", 10, 0, "AA BB.    "s, 6);
  test_line_break(" AA", 10, 0, "AA        "s, 3);

  test_line_break("AAAA BBBB.", 6, 0, "AAAA  "s, 5);
  test_line_break("AAAA BBBB.", 6, 5, "BBBB. "s, 5 + 5);

  test_line_break("AA", 2, 0, "AA"s, 2);
  test_line_break(" AA", 2, 0, "AA"s, 3);

  test_line_break("-AA / -BB", 12, 0, "-AA         "s, 5);
  test_line_break("-AA / -BB", 12, 5, "-BB         "s, 9);
  test_line_break("-AA / -BB", 12, 9, "            "s, 9);

  return boost::report_errors();
}

bool is_management_input(std::string const& input)
{
  return input == "load" || input == "save";
}


std::string process_management_input(std::string const& input, State& state)
{
  if (input == "save")
  {
    save(state, "saved_game.txt");
    return "Game saved";
  }
  else if(input == "load")
  {
    state = load("saved_game.txt");
    return "Game loaded";
  }

  return {};
}

boost::optional<std::string> get_input(State const& state)
{
  std::string input;
  getline(std::cin, input);
  if (input == "q" || is_management_input(input))
    return input;

  for (auto [str, _] : state.options) {
    if (str == input)
      return input;
  }

  return boost::none;
}

void game(std::string plotfile = "./wdungeon.plot")
{
  const plot2::GamePlot plot_ = read_plot(plotfile);
  State state = initialState(plot_);
  std::string management_status;

  for (;;)
  {
    render(state.text, state, management_status);
    management_status.clear();

    if (state.finished)
      break;

    boost::optional<std::string> choice = get_input(state);
    if (choice == boost::none)
      continue;

    if (is_management_input(*choice))
    {
      management_status = process_management_input(*choice, state);
      continue;
    }

    if (*choice == "q")
      break;

    state = transition(plot_, state, *choice);
  }
}

int main()
{
  test_file("./wdungeon.plot"); //return 0;

  game("./wdungeon.plot");  return 0;



  std::vector<std::string> ttt = {
    "cvc vczv vccz vzcz vczv czvcz vcz vcz czv czv czv czv cz vzc vcz vcz ",
    "fdsafd fas faf daf daf df da fda fda fda fa fda fdafgda gda gda gda gda gda g"
  };
//  printf("width %d\n", Display{}.size().width);
//  printf("height %d\n", Display{}.size().height);


   perform_tests();
   const plot2::GamePlot plot_ = read_plot("./wdungeon.plot");
  State state = initialState(plot_);

  for (bool playing = true; playing;)
  {
    //auto const& r =  get<plot2::Choice const&>(plot_[0].redirection);
  //  render(*plot_[0].text, state);
  render(state.text, state, "Test");
  //  test_file("./test.plot");
    //break;
//    print_screen();
    std::string input;
  //render(*plot_[0].text, state);
    getline(std::cin, input);
    if (input == "q")
      playing = false;


  }

  return 0;
}

/*

TV = tunel Vertical
TX = tunel Cross
TH = tunel Horizontal
TTD /TTL= tunel T facing down/Left
TLL / TLR - tunel L shape/ inverse L shape
TCV - tunel cave
THU - tunel horizontal (do małej komnaty)
SPC - ??? (opuscic podziemia)
# - krata
*/

/*
Black       0;30     Dark Gray     1;30
Blue        0;34     Light Blue    1;34
Green       0;32     Light Green   1;32
Cyan        0;36     Light Cyan    1;36
Red         0;31     Light Red     1;31
Purple      0;35     Light Purple  1;35
Brown       0;33     Yellow        1;33
Light Gray  0;37     White         1;37



https://jrgraphix.net/r/Unicode/2500-257F

        #define RB "\e(0\x6a\e(B" // 188 Right Bottom corner
        #define RT "\e(0\x6b\e(B" // 187 Right Top corner
        #define LT "\e(0\x6c\e(B" // 201 Left Top cornet
        #define LB "\e(0\x6d\e(B" // 200 Left Bottom corner
        #define MC "\e(0\x6e\e(B" // 206 Midle Cross
        #define HL "\e(0\x71\e(B" // 205 Horizontal Line
        #define LC "\e(0\x74\e(B" // 204 Left Cross
        #define RC "\e(0\x75\e(B" // 185 Right Cross
        #define BC "\e(0\x76\e(B" // 202 Bottom Cross
        #define TC "\e(0\x77\e(B" // 203 Top Cross
        #define VL "\e(0\x78\e(B" // 186 Vertical Line
        #define SP " "            // space string

        https://askubuntu.com/questions/558280/changing-colour-of-text-and-background-of-terminal
*/
