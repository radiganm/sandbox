// example from "The C++ Standard Library: A Tutorial and Reference, Second Edition" Section 12.5.1
// posted on Reddit here https://www.reddit.com/r/cpp/comments/14oqo9/a_nice_helper_function_for_c11s_enum_classes/ by mrenaud92

#include <array>
#include <iostream>
#include <bitset>

namespace Colour {
  const int count = 3;
  enum {red, green, blue};
  const std::array<const char*,count> name = {"red", "green", "blue"};
}

int main()
{
  std::bitset<Colour::count> usedColours;

  // Set two of the bits.
  usedColours.set(Colour::red);
  usedColours.set(Colour::blue);

  // Output the bitfield.
  std::cout << "bitfield of used colours: " << usedColours << std::endl;

  // Display all colours that are used.
  if(usedColours.any())
    for(int c = 0; c < Colour::count; ++c)
      if(usedColours[c])
        std::cout << "Colour " << Colour::name[c] << " used\n";

}
