# Bazel workspace created by @bazel/create 2.3.1

# Declares that this directory is the root of a Bazel workspace.
# See https://docs.bazel.build/versions/master/build-ref.html#workspace
workspace(
    # How this workspace would be referenced with absolute labels from another workspace
    name = "rules_cypress_macos_bug",
)

load("//tools:repositories.bzl", "fetch_deps")

fetch_deps()

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

load("@rules_nodejs//nodejs:repositories.bzl", "nodejs_register_toolchains")

# Setup the Node.js toolchain
nodejs_register_toolchains(
    name = "nodejs",
    node_repositories = {
        # 16.20.0
        "16.20.0-darwin_arm64": ("node-v16.20.0-darwin-arm64.tar.gz", "node-v16.20.0-darwin-arm64", "15d0857009f13e85057010b605e57b418318fdf422b5f9dd7e0ef32115da9c10"),
        "16.20.0-darwin_amd64": ("node-v16.20.0-darwin-x64.tar.gz", "node-v16.20.0-darwin-x64", "263d5b4871972028e204087fc8a67e21d8a0e2a420d1247375089ec8fd12759e"),
        "16.20.0-linux_arm64": ("node-v16.20.0-linux-arm64.tar.xz", "node-v16.20.0-linux-arm64", "aca4794ca60f2e17689a700eeaa95d7adcd5fd01cdd2e4f9d596ac41b600b796"),
        "16.20.0-linux_ppc64le": ("node-v16.20.0-linux-ppc64le.tar.xz", "node-v16.20.0-linux-ppc64le", "b439a8f874e8c2fad287ba75a3229407551f5ff9eb41e45e43e9bf67f184f618"),
        "16.20.0-linux_s390x": ("node-v16.20.0-linux-s390x.tar.xz", "node-v16.20.0-linux-s390x", "e71415a21ad5091b6dcbd550d10c8d9a57cd21592617950e5ee0ffe983098d8a"),
        "16.20.0-linux_amd64": ("node-v16.20.0-linux-x64.tar.xz", "node-v16.20.0-linux-x64", "dff21020b555cc165a1ac36da7d4f6c810b35409c94e00afc51d5d370aae47ae"),
        "16.20.0-windows_amd64": ("node-v16.20.0-win-x64.zip", "node-v16.20.0-win-x64", "1ad6e19300860bafdd9f18fd4ac65c32e4d396c56591c861c0d1bdcc55fe9c19"),
    },
    # override bazel mirror, to official nodejs dist
    node_urls = ["https://nodejs.org/dist/v{version}/{filename}"],
    node_version = "16.20.0",  # @todo update to node16 (requires rules_nodejs@5)
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "aspect_rules_cypress",
    sha256 = "20590da66f086d13b454c47ef130d631b45bccf366775697adbc711814f5aac3",
    strip_prefix = "rules_cypress-0.3.1",
    url = "https://github.com/aspect-build/rules_cypress/releases/download/v0.3.1/rules_cypress-v0.3.1.tar.gz",
)

######################
# rules_cypress setup #
######################
# Fetches the rules_cypress dependencies.
# If you want to have a different version of some dependency,
# you should fetch it *before* calling this.
# Alternatively, you can skip calling this function, so long as you've
# already fetched all the dependencies.
load("@aspect_rules_cypress//cypress:dependencies.bzl", "rules_cypress_dependencies")
load("@aspect_rules_cypress//cypress:repositories.bzl", "cypress_register_toolchains")

rules_cypress_dependencies()

cypress_register_toolchains(
    name = "cypress",
    # use next commands to update:
    #  linux-x64: `curl -L https://cdn.cypress.io/desktop/13.2.0/linux-x64/cypress.zip | shasum -a 256`
    #  darwin-x64: `curl -L https://cdn.cypress.io/desktop/13.2.0/darwin-x64/cypress.zip | shasum -a 256`
    #  darwin-arm64: `curl -L https://cdn.cypress.io/desktop/13.2.0/darwin-arm64/cypress.zip | shasum -a 256`
    cypress_integrity = {
        "darwin-arm64": "ec07178fe63479164c1d44973c940216adb7ea7250a189a0895d604bcc827434",
        "darwin-x64": "9033292374f2f4b2120c417d3b8de0feae345991698ba288da892efd3d88c3e1",
        "linux-x64": "84b7af8a1268b1f5e8238ae22abe0367e3208119215f04572d234363a4d32783",
    },
    cypress_version = "13.2.0",
)

###################
# rules_js setup  #
###################

load("@aspect_rules_js//js:repositories.bzl", "rules_js_dependencies")

rules_js_dependencies()

load("@aspect_rules_js//npm:repositories.bzl", "npm_translate_lock")

npm_translate_lock(
    name = "npm",
    data = [
        "//:package.json",
    ],
    pnpm_lock = "//:pnpm-lock.yaml",
    pnpm_version = "8.6.3",
    quiet = True,
)

load("@npm//:repositories.bzl", "npm_repositories")

npm_repositories()
