class RsPolicy < Formula
  desc "RS tool to enforce Google DNS on macOS network services"
  homepage "https://github.com/tony-rts/homebrew-rs-tools"
  url "https://github.com/tony-rts/homebrew-rs-tools/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "4182d6bdd88272ddc3e84a6e570b740f4ba384936622ed890d4674b0cf27f68e"
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
