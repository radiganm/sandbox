
  #include <boost/accumulators/framework/accumulator_set.hpp>
  #include <boost/accumulators/statistics/sum.hpp>

//#include <boost/accumulators/accumulators.hpp>
//#include <boost/accumulators/statistics/stats.hpp>
//#include <boost/accumulators/statistics/weighted_sum.hpp>

  using namespace boost::accumulators;

  int main(int argc, char *argv[]) {
    
    accumulator_set<int, features<tag::sum>, int> acc;
    accumulator_set<int, features<tag::weighted_sum>, int> acc_weighted;
    
    return 0;
  }
