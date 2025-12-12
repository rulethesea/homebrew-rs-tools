class RsPolicy < Formula
  desc "RS tool to enforce Google DNS on macOS network services"
  homepage "https://github.com/rulethesea/homebrew-rs-tools"
  url "https://github.com/rulethesea/homebrew-rs-tools/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "88c828aaefa6651f5f20116feac596804a052d95eb483139f864c08852cb0906"
  license "MIT"

  # Tuỳ chọn: nếu bạn muốn chắc chắn dùng bash của Homebrew
  # depends_on "bash" => :run

  def install
    # 1) Cấp quyền thực thi cho tất cả file .sh trong repo
    script_paths = Dir[
      "*.sh",
      "welcome/**/*.sh",
      "profile/**/*.sh",
      "policy/**/*.sh",
      "lib/**/*.sh"
    ]
    chmod 0o755, script_paths

    # 2) Đưa main.sh và thư mục phụ trợ vào libexec
    libexec.install "main.sh", "welcome", "profile", "policy", "lib"

    # 3) Tạo wrapper rs-policy trong bin
    # - cd vào libexec để các đường dẫn ./welcome/... hoạt động đúng
    # - thêm libexec vào PATH nếu cần
    wrapper = bin/"rs-policy"
    wrapper.write <<~EOS
      #!/usr/bin/env bash
      # Đảm bảo libexec nằm trong PATH (tuỳ bạn có cần hay không)
      export PATH="#{libexec}:$PATH"
      cd "#{libexec}"
      exec "#{libexec}/main.sh" "$@"
    EOS
    chmod 0o755, wrapper
  end

  test do
    # Test đơn giản: gọi rs-policy và kiểm tra exit code 0 (nếu script không cần interative)
    system "#{bin}/rs-policy"
  end
end
