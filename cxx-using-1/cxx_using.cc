// cxx_using.cc

  #include <cstdlib>
  #include <stdio.h>
  #include <iostream>

#ifdef HAVE_CAKE_AND_EAT_CAKE
  using my_type_1 = int;
  using my_type_2 = int;

  void test(my_type_1 &x)
  {
    printf("Hello, from my_type_1: %d\n", x);
  }

  void test(my_type_2 &x)
  {
    printf("Hello, from my_type_2: %d\n", x);
  }

  template<typename T>
  void test(T &x)
  {
    printf("Hello, from generic: %d\n", x);
  }

  template<>
  void test<my_type_1>(my_type_1 &x)
  {
    printf("Hello, from my_type_1: %d\n", x);
  }

  template<>
  void test<my_type_2>(my_type_2 &x)
  {
    printf("Hello, from my_type_2: %d\n", x);
  }
#endif

  class my_type_1
  {
    public:
      my_type_1() : x(0) {};
      my_type_1 &operator=(const int &value)
      {
        x = value;
        return *this;
      }
      my_type_1 &operator=(const my_type_1 &rhs)
      {
        if(this == &rhs)
          return *this;
        x = rhs.x;
        return *this;
      }
      my_type_1(const my_type_1 &rhs)
      {
        x = rhs.x;
      }
      inline int get_x() const { return x; };
    private:
      int x;
  };

  std::ostream& operator<<(std::ostream &os, const my_type_1 &o)
  {
    os << o.get_x();
    return os;
  }

  class my_type_2
  {
    public:
      my_type_2() : x(0) {};
      my_type_2 &operator=(const int &value)
      {
        x = value;
        return *this;
      }
      my_type_2 &operator=(const my_type_2 &rhs)
      {
        if(this == &rhs)
          return *this;
        x = rhs.x;
        return *this;
      }
      my_type_2(const my_type_2 &rhs)
      {
        x = rhs.x;
      }
      inline int get_x() const { return x; };
    private:
      int x;
  };

  std::ostream& operator<<(std::ostream &os, const my_type_2 &o)
  {
    os << o.get_x();
    return os;
  }

  template<typename T>
  void test(T &o)
  {
  }

  template<>
  void test<my_type_1>(my_type_1 &o)
  {
    std::cout << "Hello from my_type_1: " << o << std::endl;
  }

  template<>
  void test<my_type_2>(my_type_2 &o)
  {
    std::cout << "Hello from my_type_2: " << o << std::endl;
  }

  int main(void) 
  {
    my_type_1 x1;
    x1 = 1;
    my_type_2 x2;
    x2 = 2;

    test(x1);
    test(x2);

    return EXIT_SUCCESS;
  }

// *EOF*
