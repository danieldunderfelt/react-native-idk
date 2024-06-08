#include "react-native-idk.h"

namespace idk {
    std::string generate(std::string input) {
      // Interpolate the input into the string
      std::string output = "Hello, " + input + "!";

      // Return the interpolated string
      return output;
    }
}
