#!/usr/bin/env bash
set -euo pipefail

module purge
module load codes/cmake/3.28.0 compilers/gcc/11.3.0 compilers/openmpi/4.0.5 libs/gsl/2.6

rm -rf build
mkdir build
cd build
cmake .. \
      -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_C_COMPILER=$(which gcc) \
          -DCMAKE_CXX_COMPILER=$(which g++)
make -j6
cd ..
rm -rf build
