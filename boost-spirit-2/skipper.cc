// example from Stack Overflow:  
// https://stackoverflow.com/questions/44529864/how-to-skip-line-block-nested-block-comments-in-boost-spirit#44531686

#include <boost/spirit/include/qi.hpp>
namespace qi = boost::spirit::qi;

int main() {
  using Iterator = boost::spirit::istream_iterator;
  using Skipper  = qi::rule<Iterator>;

  Skipper block_comment, single_line_comment, skipper;

  {
    using namespace qi;
    single_line_comment = "//" >> *(char_ - eol) >> (eol|eoi);
    block_comment       = ("/*" >> *(block_comment | char_ - "*/")) > "*/";
    skipper             = space | single_line_comment | block_comment;
  }

  Iterator f(std::cin >> std::noskipws), l;

  std::vector<int> data;
  bool ok = phrase_parse(f, l, *qi::int_, skipper, data);
  if (ok) {
    std::copy(data.begin(), data.end(), std::ostream_iterator<int>(std::cout << "Parsed ", " "));
    std::cout << "\n";
  } else {
    std::cout << "Parse failed\n";
  }

  if (f!=l) {
    std::cout << "Remaining unparsed: '" << std::string(f,l) << "'\n";
  }
}

// *EOF*
