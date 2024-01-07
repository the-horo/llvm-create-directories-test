#include "llvm/Support/FileSystem.h"
#include "llvm/Support/Path.h"
#include <iostream>

using namespace llvm;
using namespace llvm::sys::fs;
using namespace llvm::sys::path;

int main (int argc, char **argv) {
        if (argc < 2) {
                return 1;
        }

        SmallString<128> path;
        append(path, argv[1]);

        std::clog << "Trying to create: " << path.c_str() << '\n';
        const auto ec = create_directories(path);
        std::clog << "Error code: " << ec << '\n';

        return ec.value();
}
