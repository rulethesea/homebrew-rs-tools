class RsDnsGuard < Formula
  desc "RS tool to enforce Google DNS on macOS network services"
  homepage "https://github.com/tony-rts/rs-tools"
  url "https://github.com/tony-rts/rs-tools/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  def install
    # Script nằm ở root của tarball
    bin.install "rs-dns-guard.sh" => "rs-dns-guard"
  end

  test do
    output = shell_output("#{bin}/rs-dns-guard --version")
    assert_match "0.1.0", output
  end
end
