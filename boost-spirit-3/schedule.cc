// schedule.cc

  #include <boost/spirit/include/qi.hpp>
  #include <boost/config/warning_disable.hpp>
  #include <boost/spirit/include/qi.hpp>
  #include <boost/spirit/include/phoenix_core.hpp>
  #include <boost/spirit/include/phoenix_operator.hpp>
  #include <boost/spirit/include/phoenix_object.hpp>
  #include <boost/fusion/include/adapt_struct.hpp>
  #include <boost/fusion/include/io.hpp>
  #include <boost/spirit/include/support_utree.hpp>

  #include <iostream>
  #include <string>
  #include <complex>

  #define BOOST_SPIRIT_DEBUG

  namespace schedule
  {
    namespace qi = boost::spirit::qi;
    namespace ascii = boost::spirit::ascii;
    struct schedule
    {
      int one;
      std::string two;
      std::string three;
      double four;
    };
  }

  BOOST_FUSION_ADAPT_STRUCT(
    schedule::schedule,
    (int, one)
    (std::string, two)
    (std::string, three)
    (double, four)
  )

  namespace schedule
  {

    template<typename Iterator>
    struct schedule_skipper : public qi::grammar<Iterator> 
    {
      schedule_skipper() : schedule_skipper::base_type(skip)
      {
        skip = ascii::space;
      }
    //schedule_skipper() : schedule_skipper::base_type(skip, "PL/0") 
    //{
    //  skip = ascii::space | ('{' >> *(qi::char_ - '}') >> '}');
    //}
      qi::rule<Iterator> skip;
    }; // schedule_skipper

//  template <typename Iterator>
//  struct schedule_grammar : qi::grammar<Iterator, schedule(), ascii::space_type>
    template<typename Iterator, typename Skipper = schedule_skipper<Iterator>>
    struct schedule_grammar : public qi::grammar<Iterator, schedule(), Skipper> 
    {
      schedule_grammar() : schedule_grammar::base_type(start)
      {
        using qi::lit;
        using qi::int_;
        using qi::bool_;
        using qi::double_;
        using qi::lexeme;
        using ascii::char_;
        quoted_string %= lexeme['"' >> +(char_ - '"') >> '"'];
        start %=
          lit("schedule")
          >> '{'
          >>  int_ >> ','
          >>  quoted_string >> ','
          >>  quoted_string >> ','
          >>  double_
          >>  '}'
          ;
      }
      //qi::rule<Iterator, std::string(), ascii::space_type> quoted_string;
      //qi::rule<Iterator, schedule(), ascii::space_type> start;
      qi::rule<Iterator, std::string(), Skipper> quoted_string;
      qi::rule<Iterator, schedule(), Skipper> start;
    }; // schedule_grammar

  }

  int main() {

    using boost::spirit::ascii::space;
    using iterator_t = std::string::const_iterator;
    using grammar_t = schedule::schedule_grammar<iterator_t>;
    using skipper_t = schedule::schedule_skipper<iterator_t>;

    grammar_t grammar;
    skipper_t skip;
    std::string str;

    using Iterator = boost::spirit::istream_iterator;
    using Skipper  = boost::spirit::qi::rule<iterator_t>;

    Skipper block_comment, single_line_comment, skipper;

    {
      namespace qi = boost::spirit::qi;
      using namespace qi;
      single_line_comment = "#" >> *(char_ - eol) >> (eol|eoi);
      block_comment       = ("/*" >> *(block_comment | char_ - "*/")) > "*/";
      //skipper             = space | single_line_comment | block_comment;
      skipper             = space | single_line_comment;
    }

    while (getline(std::cin, str))
    {
      schedule::schedule sched;
      iterator_t iter = str.begin();
      iterator_t end = str.end();
      //bool r = phrase_parse(iter, end, grammar, space, sched);
      bool r = phrase_parse(iter, end, grammar, skip, sched);
      //boost::spirit::utree tree;
      //bool r = phrase_parse(iter, end, grammar, skip, tree);
      //std::cout << "tree: " << tree << '\n';
      if (r && iter == end)
      {
        std::cout << boost::fusion::tuple_open('[');
        std::cout << boost::fusion::tuple_close(']');
        std::cout << boost::fusion::tuple_delimiter(", ");

        std::cout << "-------------------------\n";
        std::cout << "Parsing succeeded\n";
        std::cout << "got: " << boost::fusion::as_vector(sched) << std::endl;
        std::cout << "\n-------------------------\n";
      }
      else
      {
        std::cout << "-------------------------\n";
        std::cout << "Parsing failed\n";
        std::cout << "-------------------------\n";
      }
    }

    std::cout << "done.\n\n";
    return 0;

  }

// *EOF*
