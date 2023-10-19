"""External repositories, fetched by Bazel during analysis, when bzlmod is disabled.

Unlike the rest of /WORKSPACE, these calls are guaranteed to be order-independent.
We also put all fetches in this file to make WORKSPACE shorter.
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

# Wrap http_archive with maybe so we don't try to declare a dependency twice
def http_archive(**kwargs):
    maybe(_http_archive, **kwargs)

def fetch_deps():
    """Definitions of external fetches.

    Bazel will only lazy-download the ones needed for requested targets.
    """

    http_archive(
        name = "bazel_skylib",
        sha256 = "c6966ec828da198c5d9adbaa94c05e3a1c7f21bd012a0b29ba8ddbccb2c93b0d",
        urls = [
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.1.1/bazel-skylib-1.1.1.tar.gz",
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.1.1/bazel-skylib-1.1.1.tar.gz",
        ],
    )

    http_archive(
        name = "rules_nodejs",
        sha256 = "5ad078287b5f3069735652e1fc933cb2e2189b15d2c9fc826c889dc466c32a07",
        strip_prefix = "rules_nodejs-6.0.1",
        url = "https://github.com/bazelbuild/rules_nodejs/releases/download/v6.0.1/rules_nodejs-v6.0.1.tar.gz",
    )

    http_archive(
        name = "aspect_bazel_lib",
        sha256 = "09b51a9957adc56c905a2c980d6eb06f04beb1d85c665b467f659871403cf423",
        strip_prefix = "bazel-lib-1.34.5",
        url = "https://github.com/aspect-build/bazel-lib/releases/download/v1.34.5/bazel-lib-v1.34.5.tar.gz",
    )

    http_archive(
        name = "aspect_rules_cypress",
        sha256 = "20590da66f086d13b454c47ef130d631b45bccf366775697adbc711814f5aac3",
        strip_prefix = "rules_cypress-0.3.1",
        url = "https://github.com/aspect-build/rules_cypress/releases/download/v0.3.1/rules_cypress-v0.3.1.tar.gz",
    )

    http_archive(
        name = "aspect_rules_js",
        sha256 = "66360500180584450aacf9d9876eec675263f6b9f9cb6acbc4f6a4d39099b9f7",
        strip_prefix = "rules_js-1.32.3",
        url = "https://github.com/aspect-build/rules_js/releases/download/v1.32.3/rules_js-v1.32.3.tar.gz",
    )
