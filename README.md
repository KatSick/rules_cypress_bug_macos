# rules_cypress bug on macOS

## Steps to reproduce

1. Clone this repo
2. Run `bazel run //:cypress_tests`
3. Allow cypress unsigned binary in macOS settings
4. See the error: "Could not find a Cypress configuration file in this folder"
5. Do a `bazel clean`
6. Run `bazel run //:cypress_tests`

## Actual result

See macOS unsigned binary warning again

## Expected result

No warning
