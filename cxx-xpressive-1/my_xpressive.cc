// example from http://www.boost.org/doc/libs/1_66_0/doc/html/xpressive/user_s_guide.html#boost_xpressive.user_s_guide.quick_start
// ... combined with ...
// example from http://www.boost.org/doc/libs/1_66_0/doc/html/xpressive/user_s_guide.html#boost_xpressive.user_s_guide.examples.display_a_tree_of_nested_results

  #include <boost/xpressive/xpressive.hpp>
  #include <iostream>

  using namespace boost::xpressive;
  using namespace regex_constants;

  // Displays nested results to std::cout with indenting
  struct output_nested_results
  {
    int tabs_;
  
    output_nested_results( int tabs = 0 )
        : tabs_( tabs )
    {
    }
  
    template< typename BidiIterT >
    void operator ()( match_results< BidiIterT > const &what ) const
    {
      // first, do some indenting
      typedef typename std::iterator_traits< BidiIterT >::value_type char_type;
      char_type space_ch = char_type(' ');
      std::fill_n( std::ostream_iterator<char_type>( std::cout ), tabs_ * 4, space_ch );
  
      // output the match
      std::cout << what[0] << '\n';
  
      // output any nested matches
      std::for_each(
        what.nested_results().begin(),
        what.nested_results().end(),
        output_nested_results( tabs_ + 1 ) );
    }
  };

  int main()
  {

    sregex expr;
    {
      sregex_compiler compiler;
      syntax_option_type x = ignore_white_space;
        compiler.compile("(? $group  = ) \\( (? $expr ) \\) ", x);
        compiler.compile("(? $factor = ) \\d+ | (? $group ) ", x);
        compiler.compile("(? $term   = ) (? $factor )"
                         " ( \\* (? $factor ) | / (? $factor ) )* ", x);
      expr = compiler.compile("(? $expr   = ) (? $term )"
                              "   ( \\+ (? $term ) | - (? $term )   )* ", x);
    }

    std::string str("foo 9*(10+3) bar");
    smatch what;

    if(regex_search(str, what, expr))
    {
      // This prints "9*(10+3)":
      std::cout << "complete match:" << std::endl;
      std::cout << what[0] << std::endl;

      std::cout << std::endl;

      std::cout << "nested results:" << std::endl;
      // display the nested results
      std::for_each(
        what.nested_results().begin(),
        what.nested_results().end(),
        output_nested_results() );
      }

    return 0;

  }
