#!/bin/sh -l

swift test --enable-code-coverage

# find . | sed -e "s/[^-][^\/]*\// |/g" -e "s/|\([^ ]\)/|-\1/"

llvm-cov report \
     /github/workspace/.build/x86_64-unknown-linux-gnu/debug/WeatherAppPackageTests.xctest \
     -instr-profile=/github/workspace/.build/debug/codecov/default.profdata \
     -use-color
