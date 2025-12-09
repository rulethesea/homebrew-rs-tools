class RsDnsGuard < Formula
  desc "RS tool to enforce Google DNS on macOS network services"
  homepage "https://github.com/tony-rts/homebrew-rs-tools"
  url "https://github.com/tony-rts/homebrew-rs-tools/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "4182d6bdd88272ddc3e84a6e570b740f4ba384936622ed890d4674b0cf27f68e"
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
