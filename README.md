
brew tap rulethesea/rs-tools
brew install rs-policy


# Get sha256
https://github.com/rulethesea/homebrew-rs-tools/archive/refs/tags/v1.0.0.tar.gz
curl -L -o rs-dns-guard-0.1.0.tar.gz https://github.com/rulethesea/homebrew-rs-tools/archive/refs/tags/v1.0.0.tar.gz

shasum -a 256 rs-dns-guard-0.1.0.tar.gz
