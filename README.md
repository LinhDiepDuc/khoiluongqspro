# QS Pro

Workspace hỗ trợ bóc tách khối lượng và quản lý BOQ cho kỹ sư Quantity Surveying.

## Tệp chạy website

- `index.html`: giao diện ứng dụng.
- `styles.css`: giao diện và bố cục.
- `app.js`: thao tác BOQ, tính tổng và kết nối tài khoản.
- `supabase-config.js`: Project URL và publishable key công khai.

## Triển khai lên Netlify

Website hiện được kết nối GitHub và tự triển khai nhánh `main`. Đưa các tệp chạy ở trên vào thư mục gốc repo `LinhDiepDuc/khoiluongqspro`; Netlify sẽ tự tạo production deploy sau khi commit.

## Supabase

Database schema nằm trong `supabase-schema.sql`. Bảng `qspro_workspaces` bật Row Level Security để mỗi tài khoản chỉ truy cập workspace của mình. `supabase-config.js` chỉ chứa publishable key dành cho trình duyệt; không đưa secret key hoặc mật khẩu database vào website.

## Tính năng

- Tổng quan workspace QS Pro.
- Bảng BOQ mẫu, tìm kiếm, lọc, cập nhật đơn giá và thêm công tác theo kích thước.
- Tính khối lượng theo m³, m², mét và tổng thành tiền.
- Tham số hao hụt, chi phí chung, dự phòng và VAT.
- Lưu dữ liệu trong trình duyệt ở chế độ demo; đồng bộ workspace theo tài khoản khi đăng nhập Supabase.
- Xuất BOQ ra CSV, trang kỹ năng QS và thư viện thuật ngữ.

## Giới hạn hiện tại

BOQ mẫu là dữ liệu minh họa. Công thức, đơn giá và tỷ lệ chi phí cần được QS rà soát theo bản vẽ, hợp đồng và quy định của từng dự án. Website chưa có tính năng đọc bản vẽ, cộng tác nhiều người trên cùng workspace hoặc phân quyền đội nhóm.
