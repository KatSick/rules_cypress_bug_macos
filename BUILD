load("@aspect_rules_cypress//cypress:defs.bzl", "cypress_module_test")
load("@aspect_rules_js//js:defs.bzl", "js_library")
load("@npm//:defs.bzl", "npm_link_all_packages")

npm_link_all_packages()

js_library(
    name = "run-cypress",
    srcs = [
        "run-cypress.js",
    ],
)

cypress_module_test(
    name = "cypress_tests",
    runner = ":run-cypress",
)
