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
      Iterator(T &ref, std::ptrdiff_t index=0) : ref_(std::ref(ref)), index_(index) {};
      virtual ~Iterator() {};
      const E&    operator*() const { return ref_.get().get(); };
      Iterator&   operator++() { advance(1); return *this; };
      inline bool operator!=(Iterator<T, E> const &o) const 
      { 
        return ref_.get().get_index(index_) != o.ref_.get().get_index(o.index_); 
      };
      inline void advance(std::ptrdiff_t n) { index_ += n; ref_.get().advance(n); };
    private:
      std::reference_wrapper<T> ref_;
      std::ptrdiff_t index_;
  }; // Iterator<T>

  template<typename T, typename E>
  class Iterable
  {
    public:
      using iterator_t = Iterator<T, E>;
      Iterable() = default;
      virtual ~Iterable() {};
      virtual iterator_t iterator(T &o, std::ptrdiff_t index=0) { return iterator_t(o, index); };
      virtual iterator_t begin() = 0;
      virtual iterator_t end() = 0;
      inline virtual const E& get() const = 0;
      inline virtual std::ptrdiff_t get_index(std::ptrdiff_t n) const = 0;
      inline virtual void advance(std::ptrdiff_t n) = 0;
    protected:
  }; // Iterable<T>

} // namespace

/// *EOF*
