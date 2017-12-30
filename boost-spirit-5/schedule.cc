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
      time_t          datetime;
      double          center_frequency;
      double          sample_rate;
      uint64_t        resolution;
      std::string     quadrature;
      double          gain;
      uint64_t        address;
      uint64_t        event_id;
      uint64_t        node_id;
    };
  }

  BOOST_FUSION_ADAPT_STRUCT(
    schedule::schedule,
    (time_t      , datetime)
    (double      , center_frequency)
    (double      , sample_rate)
    (uint64_t    , resolution)
    (std::string , quadrature)
    (double      , gain)
    (uint64_t    , address)
    (uint64_t    , event_id)
    (uint64_t    , node_id)
  )

  namespace schedule
  {

    template<typename Iterator>
    struct schedule_skipper : public qi::grammar<Iterator> 
    {
#if 1
      schedule_skipper() : schedule_skipper::base_type(skip)
      {
        skip = ascii::space;
      }
#else
      schedule_skipper() : schedule_skipper::base_type(skip, "START") 
      {
        skip = ascii::space | ('{' >> *(qi::char_ - '}') >> '}');
      }
#endif
      qi::rule<Iterator> skip;
    }; // schedule_skipper

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
        quoted_string   %= lexeme['"' >> +(char_ - '"') >> '"'];
        unquoted_string %= lexeme['"' >> +(char_ - '"') >> '"'];
        start %=
          lit("schedule")
          >> '{'
          >>  int_             >> ','
          >>  double_          >> ','
          >>  double_          >> ','
          >>  int_             >> ','
          >>  unquoted_string  >> ','
          >>  double_          >> ','
          >>  int_             >> ','
          >>  int_             >> ','
          >>  int_
          >>  '}'
          ;
      }
      qi::rule<Iterator, std::string(), Skipper> quoted_string;
      qi::rule<Iterator, std::string(), Skipper> unquoted_string;
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
      skipper             = space | single_line_comment | block_comment;
    }

    Iterator f(std::cin >> std::noskipws), l;
    std::vector<schedule::schedule> sched;
    //bool ok = phrase_parse(f, l, *qi::int_, skipper, data);
    bool ok = phrase_parse(f, l, grammar, skipper, sched);
    if (ok) 
    {
      //std::copy(data.begin(), data.end(), std::ostream_iterator<int>(std::cout << "Parsed ", " "));
      std::cout << "\n";
    } else 
    {
      std::cout << "Parse failed\n";
    }
    if (f!=l) 
    {
      std::cout << "Remaining unparsed: '" << std::string(f,l) << "'\n";
    }

    std::cout << "done.\n\n";
    return 0;

  }

// *EOF*
