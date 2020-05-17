#!/bin/sh -l

swift test --enable-code-coverage

 llvm-cov report \
     .build/x86_64-apple-macosx/debug/WeatherAppPackageTests.xctest/Contents/MacOS/WeatherAppPackageTests \
     -instr-profile=.build/debug/codecov/default.profdata \
     -ignore-filename-regex=".build|Tests" \
     -use-color 
