/// FooFileA.h
///
/// Copyright 2017 Mac Radigan
/// All Rights Reserved

  #include "packages/io/File.h"

#pragma once

namespace rad::sandbox {

  using foo_a_element_t = uint32_t;

  class FooFileA : public File<FooFileA, foo_a_element_t>
  {
    public:
      using iterator_t = Iterator<FooFileA, foo_a_element_t>;
      FooFileA() = default;
      virtual ~FooFileA();
      virtual void open(std::string const& filename);
      virtual void close();
      virtual iterator_t begin() { return iterator(*this); };
      virtual iterator_t end() { return iterator(*this, -1); };
      virtual const foo_a_element_t& get() const;
      inline virtual std::ptrdiff_t get_index(std::ptrdiff_t n) const;
      inline virtual void advance(std::ptrdiff_t n);
    private:
      foo_a_element_t foo_;
      friend std::ostream& operator<<(std::ostream &os, const rad::sandbox::FooFileA &o);
  };

} // namespace

/// *EOF*
