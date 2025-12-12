class RsPolicy < Formula
  desc "RS tool to enforce Google DNS on macOS network services"
  homepage "https://github.com/rulethesea/homebrew-rs-tools"
  url "https://github.com/rulethesea/homebrew-rs-tools/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "88c828aaefa6651f5f20116feac596804a052d95eb483139f864c08852cb0906"
  license "MIT"

  # Nếu bạn muốn chắc dùng bash của Homebrew, giữ dòng này.
  # Nếu không cần, có thể bỏ.
  depends_on "bash" => :run

  def install
    # Đảm bảo tất cả file .sh trong project đều có quyền thực thi
    script_paths = Dir[
      "*.sh",
      "welcome/**/*.sh",
      "profile/**/*.sh",
      "policy/**/*.sh",
      "lib/**/*.sh"
    ]
    chmod 0755, script_paths

    # Đưa main.sh và toàn bộ thư mục phụ trợ vào libexec
    libexec.install "main.sh", "welcome", "profile", "policy", "lib"

    # Tạo wrapper rs-policy trong bin, trỏ tới main.sh trong libexec
    (bin/"rs-policy").write_env_script libexec/"main.sh",
      PATH: PATH.new(Formula["bash"].opt_bin, libexec, ENV["PATH"])
    # Nếu bỏ depends_on "bash", thay dòng trên bằng:
    # (bin/"rs-policy").write_env_script libexec/"main.sh",
    #   PATH: PATH.new(libexec, ENV["PATH"])
  end

  test do
    # Test đơn giản: chỉ cần chạy xem có exit được là ok (tránh require user input)
    system "#{bin}/rs-policy"
  end
end
