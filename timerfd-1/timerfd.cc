/// timerfd.c

  #include <cstdint>
  #include <stdio.h>
  #include <stdlib.h>
  #include <pthread.h>
  #include <string.h>
  #include <unistd.h>
  #include <assert.h>
  #include <errno.h>
  #include <sys/time.h>
  #include <sys/timerfd.h>

  int main(int argc, char *argv[])
  {
    int period = 10000;
  //int fd = timerfd_create(CLOCK_MONOTONIC, 0);
    int fd = timerfd_create(CLOCK_REALTIME, 0);
    assert (fd != -1);
    unsigned int sec = period / 1000000;
    unsigned int ns = (period - (sec * 1000000)) * 1000;
    sec = 1;
    ns  = 0;
    struct itimerspec interval;
    interval.it_interval.tv_sec = sec;
    interval.it_interval.tv_nsec = ns;
    interval.it_value.tv_sec = sec;
    interval.it_value.tv_nsec = ns;
    int rc = timerfd_settime(fd, TFD_TIMER_ABSTIME, &interval, NULL);
    uint64_t total = 0;
    while (bool is_running = true) 
    {
      uint64_t ticks;
      rc = ::read(fd, &ticks, sizeof ticks);
      if(rc == -1)
      {
        perror("read timer");
      }
      if(ticks)
      {
        fprintf(stderr, "ticks: %12.12ld", ticks);
      }
      total += ticks;
      fprintf(stderr, "  total: %12.12ld\n", total);
    }
    return 0;
  }

/// *EOF*
