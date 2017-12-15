/// File.h
///
/// Copyright 2017 Mac Radigan
/// All Rights Reserved

  #include "packages/io/Iterator.h"

#pragma once

namespace rad::sandbox {

  template<typename T, typename E>
  class File : public Iterable<T, E>
  {
    public:
      File() = default;
      virtual ~File() {};
      virtual void open(std::string const& filename) = 0;
      virtual void close() = 0;
    protected:
      int           fd_;
      void         *data_;
      std::size_t   offset_;
      std::size_t   size_;
    private:
  };

} // namespace

/// *EOF*
