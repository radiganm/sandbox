/// Iterator.h
///
/// Copyright 2017 Mac Radigan
/// All Rights Reserved

  #include <algorithm>
  #include <functional>
  #include <iostream>

#pragma once

namespace rad::sandbox {

  template<typename T, typename E> class Iterator; // forward
  template<typename T, typename E> class Iterable; // forward

  template<typename T, typename E>
  class Iterator: public std::iterator<std::input_iterator_tag, T, ptrdiff_t,const T*, const T&>
  {
    public:
      Iterator(T ref) : ref_(std::ref(ref)) {};
      virtual ~Iterator() {};
      const E&    operator*() const                           
      { 
        std::cout << "*x" << std::endl << std::flush;
        return ref_.get().get(); 
      };
      Iterator&   operator++()                                { ref_.get().advance(1); return *this; };
      inline bool operator!=(Iterator<T, E> const &o) const   { return ref_.get() != o.ref_.get(); };
      inline void advance(std::ptrdiff_t n) { ref_.get().advance(n); };
    private:
      std::reference_wrapper<T> ref_;
  }; // Iterator<T>

  template<typename T, typename E>
  class Iterable
  {
    public:
      using iterator_t = Iterator<T, E>;
      Iterable() = default;
      virtual ~Iterable() {};
      virtual iterator_t begin()                    = 0;
      virtual iterator_t end()                      = 0;
      virtual const E& get() const                  = 0;
      inline virtual void advance(std::ptrdiff_t n) = 0;
      bool operator!=(Iterable<T, E> const &o) const { return get_index() != o.get_index(); };
      inline std::size_t get_index() const { return index_; };
    protected:
      std::size_t index_;
  }; // Iterable<T>

} // namespace

/// *EOF*
