class RsPolicy < Formula
  desc "RS tool to enforce Google DNS on macOS network services"
  homepage "https://github.com/rulethesea/homebrew-rs-tools"
  url "https://github.com/rulethesea/homebrew-rs-tools/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "88c828aaefa6651f5f20116feac596804a052d95eb483139f864c08852cb0906"
  license "MIT"

  # Nếu bạn dùng bash của Homebrew, nên khai báo thêm:
  # depends_on "bash" => :run

  def install
    # Đưa main.sh và các thư mục phụ trợ vào libexec
    libexec.install "main.sh"
    libexec.install "welcome", "profile", "policy", "lib"

    # Tạo wrapper rs-policy trong bin, trỏ vào main.sh trong libexec
    (bin/"rs-policy").write_env_script libexec/"main.sh",
      PATH: PATH.new(libexec, ENV["PATH"])
    # Nếu muốn chắc chắn dùng bash của Homebrew:
    # (bin/"rs-policy").write_env_script libexec/"main.sh",
    #   PATH: PATH.new(Formula["bash"].opt_bin, libexec, ENV["PATH"])
  end

  test do
    system "#{bin}/rs-policy"
  end
end
