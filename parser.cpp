#include "parser.hpp"
#include <boost/spirit/include/qi.hpp>
#include <fstream>

void test(std::string input);
void test_file(std::string file_name)
{
  std::ifstream plotfile {file_name};
  std::string plottext;
  while (plotfile) {
    std::string line;
    std::getline(plotfile, line);
    plottext += '\n' + line;
  }
  test(plottext);
}

GamePlot read_plot(std::string file_name)
{
  std::ifstream plotfile {file_name};
  std::string plottext;
  while (plotfile) {
    std::string line;
    std::getline(plotfile, line);
    plottext += '\n' + line;
  }

  namespace qi = boost::spirit::qi;
    namespace ascii = boost::spirit::ascii;
  auto first = plottext.begin(), last = plottext.end();

    GamePlot game_plot;
          bool r = qi::phrase_parse(
              first,                          /*< start iterator >*/
              last,                           /*< end iterator >*/
              qi::double_,   /*< the parser >*/
              ascii::space                           /*< the skip-parser >*/
          );

          if (r == false)
            throw std::runtime_error(std::string(first, last));
          if (first != last) // fail if we did not get a full match
              throw std::runtime_error(std::string(first, last));

    return game_plot;
}


struct Variable_
{
  std::string name;
  int value;
};

BOOST_FUSION_ADAPT_STRUCT(
    Variable_,
    (std::string, name)
    (int, value)
)

struct SingleRedirection_
{
  std::vector<Variable_> cond;
  boost::optional<std::string> map;
  std::string next_state;
  std::vector<Variable_> set_vars;
};

BOOST_FUSION_ADAPT_STRUCT(
    SingleRedirection_,
    (std::vector<Variable_>, cond)
    (boost::optional<std::string>, map)
    (std::string, next_state)
    (std::vector<Variable_>, set_vars)
)

struct Option_
{
  std::vector<Variable_> cond;
  std::string decision;
  boost::optional<std::string> map;
  std::string nextState;
  boost::optional<std::string> narration;
  std::vector<Variable_> set_vars;
};

BOOST_FUSION_ADAPT_STRUCT(
    Option_,
    (std::vector<Variable_>, cond)
    (std::string, decision)
    (boost::optional<std::string>, map)
    (std::string, nextState)
    (boost::optional<std::string>, narration)
    (std::vector<Variable_>, set_vars)
)

struct Choice_{
  std::string prompt;
  std::vector<Option_> options;
};

BOOST_FUSION_ADAPT_STRUCT(
    Choice_,
    (std::string, prompt)
    (std::vector<Option_>, options)
)

using Redirection_ = std::vector<SingleRedirection_>;
using Alternative = boost::variant<Redirection_, char, Choice_>;

struct Transition_
{
  std::string label;
  boost::optional<std::string> map;
  boost::optional<std::string> text;
  Alternative redirection;
};

BOOST_FUSION_ADAPT_STRUCT(
    Transition_,
    (std::string, label)
    (boost::optional<std::string>, map)
    (boost::optional<std::string>, text)
    (Alternative, redirection)
)

void test(std::string input)
{
 namespace qi = boost::spirit::qi;
   namespace ascii = boost::spirit::ascii;

 auto first = input.begin(), last = input.end();

 auto end = qi::lit("[") >> qi::char_("+!") >> qi::lit("]");
 auto identifier = qi::lexeme[ +(ascii::alnum | qi::char_('_')) ];
 auto label = qi::lit("[") >> identifier >> qi::lit("]");
 auto text = qi::lexeme[ +(qi::char_ - ']' - '[') ];
 auto map = qi::lit("[") >> qi::lit("^") >> (+qi::char_("^SNWE.TCLPRXHUVD# ")) >> qi::lit("]");
 auto cond = qi::lit("[") >> ((identifier >> "=" >> qi::int_) % ",") >> qi::lit("]");
 auto set_vars = qi::lit("[") >> ((identifier >> ":=" >> qi::int_) % ",") >> qi::lit("]");
 auto redirection = +(qi::lit("[->]") >> (-cond) >> (-map) >> label >> (-set_vars));
 auto option = qi::lit("[#]") >> (-cond) >> text >> (-map) >> label >> (-text) >> (-set_vars);
 auto choice = qi::lit("[?]") >> text >> (+option);
auto continuation = qi::hold[redirection | end | choice];
auto transition = qi::lit("[##]") >> label >> -map >> -text >> continuation;
auto comment = qi::lit("[//]") >> qi::omit[*(qi::char_ - ']' - '[')];
auto grammar = +(transition | comment);

std::vector<Transition_> output;

std::vector<Variable_> cond_;
Transition_ trs;
//Redirection_ output;

bool r;
   //r = qi::phrase_parse(first,  last, (identifier >> "=" >> qi::int_) % ",", ascii::space, cond_);
   r = qi::phrase_parse(first,  last, grammar, ascii::space, output);

   Choice_ ch;
//  r = qi::phrase_parse( first,  last, choice, ascii::space, ch );

Alternative alt;
  //   r = qi::phrase_parse( first,  last, continuation, ascii::space, alt );

     if (r == false) {
         std::cout << " failed ";
         return;
     }

     if (first != last) {
         std::cout << " partial at: " << std::string(first, last);
         return;
     }

     std::cout << " ok: " ;//<< "[" << output.label << "]" << output.text;
}
