/// test_foo.cc
/// Copyright 2017 Mac Radigan
/// All Rights Reserved

  #include "packages/foo/FooFileA.h"
  #include <atomic>
  #include <signal.h>
  #include <iostream>
  #include <thread>
  #include <chrono>

  using namespace std::chrono_literals;

  static std::atomic<bool> is_running(true);

  static rad::sandbox::FooFileA *in;

  static void interrupt(int signo)
  {
    switch(signo)
    {
      case SIGINT:
        is_running = false;
        in->close();
        break;
      default:
        std::cerr << "unhandled signal" << std::endl << std::flush;
    }
  }
  
  int main(int argc, char *argv[])
  {
    int status(EXIT_SUCCESS);

    if (SIG_ERR == signal(SIGINT, interrupt)) 
    {
      perror("unable to set signal");
      return status;
    }

    in = new rad::sandbox::FooFileA();

    std::cout << "print FooFileA      " << *in       << std::endl << std::flush;
    std::cout << "print FooFileA->get " << in->get() << std::endl << std::flush;

    std::cout << "range-based for loop: " << std::endl << std::flush;
    for(auto &x: *in)
    {
      std::cout << std::endl << "next..." << std::endl << std::flush;
      std::cout << x << std::endl << std::flush;
      std::cout << std::endl << "top..." << std::endl << std::flush;
    }

    delete in;

    return status;
  }

/// *EOF*
