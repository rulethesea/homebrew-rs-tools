class RsPolicy < Formula
  desc "RS tool to enforce Google DNS on macOS network services"
  homepage "https://github.com/rulethesea/homebrew-rs-tools"
  url "https://github.com/rulethesea/homebrew-rs-tools/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "88c828aaefa6651f5f20116feac596804a052d95eb483139f864c08852cb0906"
  license "MIT"

  def install
    # Cài đặt script chính
    bin.install "main.sh" => "rs-policy"
    
    # Cài đặt các thư mục và script phụ trợ
    libexec.install "welcome", "profile", "policy", "lib"
    
    # Tạo wrapper script để chạy từ đúng thư mục
    (bin/"rs-policy").write_env_script libexec/"main.sh", :PATH => PATH.new(libexec, Formula["bash"].opt_bin, ENV["PATH"])
  end

  test do
    system "#{bin}/rs-policy"
  end
end
