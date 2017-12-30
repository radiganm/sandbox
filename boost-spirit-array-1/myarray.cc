// exmaple from this Stack Exchange post:  https://stackoverflow.com/questions/34435150/boostspirit-parsing-into-struct-with-stdarray

#include <boost/fusion/include/tuple.hpp>
#include <boost/fusion/adapted/boost_array.hpp>
#include <boost/spirit/include/qi.hpp>
#include <string>

namespace boost { namespace spirit { namespace traits {
    template <typename T, size_t N>
        struct is_container<boost::array<T, N>, void> : mpl::false_ { };
} } }

namespace qi    = boost::spirit::qi;
namespace ascii = boost::spirit::ascii;

struct StructWithArray
{
    double dummy_; // see http://stackoverflow.com/questions/19823413/spirit-qi-attribute-propagation-issue-with-single-member-struct
    boost::array<double, 6> ary_;
};

BOOST_FUSION_ADAPT_STRUCT(StructWithArray, dummy_, ary_)

template <typename Iterator, typename Skipper>
struct StructWithArrayParser
    : qi::grammar<Iterator, StructWithArray(), Skipper>
{
    StructWithArrayParser() : StructWithArrayParser::base_type(start)
    {
        using qi::double_;

        arrayLine = double_ > double_ > double_ > double_ > double_ > double_;
        start     = double_ > arrayLine;
    }

  private:
    qi::rule<Iterator, boost::array<double, 6>(), Skipper> arrayLine;
    qi::rule<Iterator, StructWithArray(), Skipper> start;
};

int main() {
    std::string arrayStr = "0 1 2 3 4 5 6";
    using It = std::string::const_iterator;
    It it = arrayStr.begin(), endIt = arrayStr.end();
    StructWithArrayParser<It, ascii::space_type> grammar;

    StructWithArray structWithArray;
    bool ret = phrase_parse(it, endIt, grammar, ascii::space, structWithArray);
    std::cout << std::boolalpha << ret << "\n";

    for (double v : structWithArray.ary_)
        std::cout << v << " ";
}
