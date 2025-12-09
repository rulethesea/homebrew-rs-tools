#!/bin/bash

echo "🔐 [RS Policy] Từ tháng 12.2025, tất cả thiết bị của công ty RS bắt buộc sử dụng DNS của Google (8.8.8.8 và 8.8.4.4)."
echo "🧪 Kiểm tra cấu hình DNS hiện tại..."

# Bước 1: Kiểm tra trạng thái hiện tại
bash ./lib/dns/check_current_dns.sh
status=$?

# Bước 2: Nếu chưa đạt chuẩn, tiến hành sửa
if [[ $status -gt 0 ]]; then
  echo
  echo "⚠️ Có $status interface chưa cấu hình đúng DNS."
  echo "🛠 Đang tiến hành cấu hình lại DNS Google cho tất cả interface..."

  bash ./lib/dns/set_google_dns_all.sh

  echo
  echo "🔁 Đang kiểm tra lại sau khi cấu hình..."

  bash ./lib/dns/check_current_dns.sh
  recheck_status=$?

  echo
  if [[ $recheck_status -eq 0 ]]; then
    echo "✅ Cảm ơn bạn đã tuân thủ chính sách DNS của RS!"
    echo "📤 Báo cáo trạng thái đã được gửi về server."
  else
    echo "❌ Một số interface vẫn chưa đạt yêu cầu sau khi cấu hình."
    echo "📞 Vui lòng liên hệ bộ phận kỹ thuật để được hỗ trợ."
  fi

else
  echo
  echo "✅ Thiết bị của bạn đã tuân thủ chính sách DNS."
  echo "📤 Báo cáo trạng thái đã được gửi về server."
fi
