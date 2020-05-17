#!/bin/sh -l

llvm-cov report \
     .build/x86_64-apple-macosx/debug/WeatherAppPackageTests.xctest/Contents/MacOS/WeatherAppPackageTests \
     -instr-profile=.build/debug/codecov/default.profdata \
     -use-color
