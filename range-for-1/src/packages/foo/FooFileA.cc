/// FooFileA.cc
///
/// Copyright 2017 Mac Radigan
/// All Rights Reserved

  #include "packages/foo/FooFileA.h"

  #include <assert.h>

  #define FOO_FILE_A__EOF (100)

namespace rad::sandbox {


  using foo_a_element_t = uint32_t;
  using iterator_t = Iterator<FooFileA, foo_a_element_t>;

  FooFileA::~FooFileA()
  {
  }

  void FooFileA::open(std::string const& filename)
  {
  }

  void FooFileA::close()
  {
  }

  const foo_a_element_t& FooFileA::get() const
  {
    return foo_;
  }

  iterator_t FooFileA::begin()
  {
    iterator_t *it = new iterator_t(*this);
    return *it;
  }

  iterator_t FooFileA::end()
  {
    iterator_t *it = new iterator_t(*this, FOO_FILE_A__EOF);
    return *it;
  }

  inline void FooFileA::advance(std::ptrdiff_t n)
  {
    ++foo_;
  }

  std::ostream& operator<<(std::ostream &os, const rad::sandbox::FooFileA &o)
  {
    std::ios::fmtflags flags(os.flags());
    os << "[ Foo File A ]" << std::endl << std::flush;
    os << ".foo = " << o.foo_ << std::endl << std::flush;
    os.flags(flags);
    return os;
  }

} // namespace

  using namespace rad::sandbox;

/// *EOF*
