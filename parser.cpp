#include "parser.hpp"
#include <boost/spirit/include/qi.hpp>
#include <fstream>

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

struct Redirection_
{
  boost::optional<std::string> cond;
  boost::optional<std::string> map;
  std::string next_state;
  boost::optional<std::string> set_vars;
};

BOOST_FUSION_ADAPT_STRUCT(
    Redirection_,
    (boost::optional<std::string>, cond)
    (boost::optional<std::string>, map)
    (std::string, next_state)
    (boost::optional<std::string>, set_vars)
)

using Alternative = boost::variant<Redirection_, char>;

struct Transition_
{
  std::string label;
  std::string text;
  boost::variant<Redirection_, char> redirection;

};

BOOST_FUSION_ADAPT_STRUCT(
    Transition_,
    (std::string, label)
    (std::string, text)
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
 auto map = qi::lit("[") >> (+qi::char_("^SNWE.TCLRXUVD# ")) >> qi::lit("]");
 auto cond = qi::lit("[") >> text >> qi::lit("]");
 auto set_vars = qi::lit("[") >> text >> qi::lit("]");
 auto redirection = qi::lit("[->]") >> (-cond) >> (-map) >> label >> (-set_vars);

auto transition = qi::lit("[##]") >> label >> text >> (redirection | end);



Transition_ output;
//Redirection_ output;

         bool r = qi::phrase_parse(
             first,                          /*< start iterator >*/
             last,                           /*< end iterator >*/
             transition,   /*< the parser >*/
             ascii::space,                           /*< the skip-parser >*/
             output
         );

     if (r == false)
     {
         std::cout << " failed ";
         return;
     }

     if (first != last)
     {
         std::cout << " partial at: " << std::string(first, last);
         return;
     }

     std::cout << " ok: " ;//<< "[" << output.label << "]" << output.text;
}
