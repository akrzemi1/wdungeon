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

plot2::GamePlot read_plot(std::string file_name)
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

  auto end = qi::lit("[") >> qi::char_("+!") >> qi::lit("]");
  auto identifier = qi::lexeme[ +(ascii::alnum | qi::char_('_')) ];
  auto label = qi::lit("[") >> identifier >> qi::lit("]");
  auto text = qi::lexeme[ +(qi::char_ - ']' - '[') ];
  auto map_step = qi::lit("^") >> -qi::char_("NESW") >> -(qi::lit(".") >> (+qi::char_("SNWETCLPRXHUVD#")));
  auto map = qi::lit("[") >> +map_step >> qi::lit("]");
  auto cond = qi::lit("[") >> ((identifier >> "=" >> qi::int_) % ",") >> qi::lit("]");
  auto set_vars = qi::lit("[") >> ((identifier >> ":=" >> qi::int_) % ",") >> qi::lit("]");
  auto redirection = +(qi::lit("[->]") >> (-cond) >> (-map) >> label >> (-set_vars));
  auto option = qi::lit("[#]") >> (-cond) >> text >> (-map) >> label >> (-text) >> (-set_vars);
  auto choice = qi::lit("[?]") >> text >> (+option);
 auto continuation = qi::hold[redirection | end | choice];
 auto transition = qi::lit("[##]") >> label >> -map >> -text >> continuation;
 auto comment = qi::lit("[//]") >> qi::omit[*(qi::char_ - ']' - '[')];
 auto grammar = +(transition | comment);

 plot2::GamePlot gamePlot;

          bool r = qi::phrase_parse( first, last,  grammar,  ascii::space, gamePlot  );

          if (r == false)
            throw std::runtime_error(std::string(first, last));
          if (first != last) // fail if we did not get a full match
              throw std::runtime_error(std::string(first, last));

    return gamePlot;
}

BOOST_FUSION_ADAPT_STRUCT (
  plot2::Variable,
  name, value
)

BOOST_FUSION_ADAPT_STRUCT (
    plot2::MapStep,
    direction, modifications
)

BOOST_FUSION_ADAPT_STRUCT (
    plot2::SingleRedirection,
    cond, map, next_state, set_vars
)

BOOST_FUSION_ADAPT_STRUCT(
    plot2::Option,
    cond, decision, map, nextState, narration, set_vars
)

BOOST_FUSION_ADAPT_STRUCT(
    plot2::Choice,
    prompt, options
)

BOOST_FUSION_ADAPT_STRUCT(
    plot2::Transition,
    label, map, text, redirection
)

using namespace plot2;


void test(std::string input)
{
  namespace qi = boost::spirit::qi;
  namespace ascii = boost::spirit::ascii;


 auto first = input.begin(), last = input.end();

 auto end = qi::lit("[") >> qi::char_("+!") >> qi::lit("]");
 auto identifier = qi::lexeme[ +(ascii::alnum | qi::char_('_')) ];
 auto label = qi::lit("[") >> identifier >> qi::lit("]");
 auto text = qi::lexeme[ +(qi::char_ - ']' - '[') ];
 auto map_step = qi::lit("^") >> -qi::char_("NESW") >> -(qi::lit(".") >> (+qi::char_("SNWETCLPRXHUVD#")));
 auto map = qi::lit("[") >> +map_step >> qi::lit("]");
 auto cond = qi::lit("[") >> ((identifier >> "=" >> qi::int_) % ",") >> qi::lit("]");
 auto set_vars = qi::lit("[") >> ((identifier >> ":=" >> qi::int_) % ",") >> qi::lit("]");
 auto redirection = +(qi::lit("[->]") >> (-cond) >> (-map) >> label >> (-set_vars));
 auto option = qi::lit("[#]") >> (-cond) >> text >> (-map) >> label >> (-text) >> (-set_vars);
 auto choice = qi::lit("[?]") >> text >> (+option);
auto continuation = qi::hold[redirection | end | choice];
auto transition = qi::lit("[##]") >> label >> -map >> -text >> continuation;
auto comment = qi::lit("[//]") >> qi::omit[*(qi::char_ - ']' - '[')];
auto grammar = +(transition | comment);

std::vector<Transition> output;

bool r;
  // r = qi::phrase_parse(first,  last, continuation, ascii::space, alto);
   r = qi::phrase_parse(first,  last, grammar, ascii::space, output);


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
