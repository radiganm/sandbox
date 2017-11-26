  // Mac Radigan

  #include <SoapySDR/Device.hpp>
  #include <SoapySDR/Formats.hpp>
  #include <SoapySDR/Errors.hpp>
  #include <gflags/gflags.h>
  #include <string>
  #include <cstdlib>
  #include <iostream>
  #include <stdexcept>
  #include <csignal>
  #include <chrono>
  #include <cstdio>
  #include <atomic>
  #include <thread>

  using namespace std::chrono_literals;

  static std::atomic<bool> is_running(true);

  static void interrupt(int signo)
  {
    switch(signo)
    {
      case SIGINT:
        is_running = false;
        break;
      default:
        std::cerr << "unhandled signal" << std::endl << std::flush;
    }
  }
  
  DEFINE_bool(debug,   false, "debug");
  DEFINE_bool(verbose, false, "verbose");

  int main(int argc, char *argv[])
  {
    int status = EXIT_SUCCESS;

    if (SIG_ERR == signal(SIGINT, interrupt)) 
    {
      perror("unable to set signal");
      return status;
    }

    std::string usage("test_rx - Sample usage:\n");
    usage += argv[0];
    usage += " ";
    gflags::SetUsageMessage(usage);
    gflags::ParseCommandLineFlags(&argc, &argv, true);

    SoapySDR::Device *device(nullptr);

    try
    {
      std::string args;
      device = SoapySDR::Device::make(args);
    }
    catch (const std::exception &ex)
    {
      std::cerr << "ERROR: " << ex.what() << std::endl;
      return EXIT_FAILURE;
    }

    try
    {

      const double sample_rate = 10e6;

      int direction(SOAPY_SDR_RX);
      std::vector<size_t> channels;
      std::string channel_string;
      for (const auto &pair : SoapySDR::KwargsFromString(channel_string))
      {
        channels.push_back(std::stoi(pair.first));
      }
      if (channels.empty()) channels.push_back(0);

      if (sample_rate <= 0.0)
      {
        std::cerr << "sample rate must be positive" << std::endl << std::flush;
        return EXIT_FAILURE;
      }

      double full_scale(0.0);
      const auto format = device->getNativeStreamFormat(direction, channels.front(), full_scale);
      const size_t size = SoapySDR::formatToSize(format);
      auto stream = device->setupStream(direction, format, channels);

      const size_t n_elements = device->getStreamMTU(stream);
      std::vector<std::vector<char>> workspace(channels.size(), std::vector<char>(size * n_elements));

      std::vector<void *> buffers(channels.size());
      for (size_t k = 0; k < channels.size(); ++k) buffers[k] = workspace[k].data();

      int flags(0);
      long long time(0); // in nanoseconds

      while (is_running)
      {
        int ok = device->readStream(stream, buffers.data(), n_elements, flags, time);
        if (ok < 0) switch (ok)
        {
          case SOAPY_SDR_TIMEOUT:
            continue;
          case SOAPY_SDR_OVERFLOW:
            continue;
          case SOAPY_SDR_UNDERFLOW:
            continue;
          case SOAPY_SDR_NOT_SUPPORTED:
            continue;
          case SOAPY_SDR_TIME_ERROR:
            continue;
          case SOAPY_SDR_CORRUPTION:
            continue;
          case SOAPY_SDR_STREAM_ERROR:
            continue;
          default:
            std::cerr << "Unexpected stream error " << SoapySDR::errToStr(ok) << std::endl;
        }
        std::this_thread::sleep_for(10ms);
      }

      device->deactivateStream(stream);
      device->closeStream(stream);
      SoapySDR::Device::unmake(device);
    }
    catch (const std::exception &ex)
    {
      std::cerr << "ERROR: " << ex.what() << std::endl;
      SoapySDR::Device::unmake(device);
      return EXIT_FAILURE;
    }

    return status;
  }

// *EOF*
