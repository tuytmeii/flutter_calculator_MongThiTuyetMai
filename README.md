
#  Simple Mobile Calculator – Flutter

Một ứng dụng **máy tính bỏ túi** được xây dựng bằng **Flutter**, mô phỏng lại giao diện theo đúng thiết kế Figma trong bài Lab.
Ứng dụng gồm đầy đủ các chức năng toán học cơ bản, hỗ trợ chain operations và có giao diện trực quan với các nút bấm hình tròn giống máy tính vật lý.

---

##  **Mục tiêu dự án**

Ứng dụng được xây dựng nhằm giúp sinh viên:

* Hiểu cách tạo UI bằng Flutter.
* Quản lý state và xử lý input người dùng.
* Thực hiện các phép toán cơ bản.
* Tái tạo giao diện từ Figma theo pixel-perfect.
* Xử lý lỗi và edge cases như số âm, phần trăm, CE, C, decimal, chia 0,…

---

##  **Công nghệ sử dụng**

* Flutter SDK
* Dart
* Material Design
* Widgets: `GridView`, `InkWell`, `Container`, `Expanded`, `SafeArea`

---

##  **Yêu cầu giao diện**

###  Màu sắc (theo mẫu hình)

| Thành phần        | Màu       |
| ----------------- | --------- |
| **Nền app**       | `#1A1A1A` |
| **Nút số**        | `#2B2B2B` |
| **Nút phép toán** | `#3D503A` |
| **Nút "="**       | `#2F7A39` |
| **Nút "C"**       | `#B44343` |

###  Hình dạng & bố cục

* Mỗi nút là **hình tròn** (Circle Button)
* Grid 4 cột × 5 hàng
* Khoảng cách nút: **16px**
* Padding màn hình: **20px**
* Font chữ: **Roboto**
* Display font size: **48px**
* Font nút: **22px**

---

##  **Cấu trúc giao diện**

### ** 1. Display (khu vực hiển thị số)**

* Căn phải
* Màu trắng
* Font lớn
* Nằm phía trên keypad

### ** 2. Keypad (lưới nút bấm)**

```
C    ()   %    ÷
7    8    9    ×
4    5    6    -
1    2    3    +
+/-  0    .    =
```

---

## **Chức năng của ứng dụng**

### ✔ Nhập số (0–9)

Hiển thị số theo input người dùng.

### ✔ Dấu thập phân "."

Không cho phép nhập nhiều dấu `.` trong 1 số.


### ✔ C (Clear All)

Xoá toàn bộ dữ liệu, reset trạng thái.

### ✔ +/-

Đổi dấu của số hiện tại.

### ✔ %

Chuyển số hiện tại thành phần trăm:
`input / 100`

### ✔ Phép toán

Hỗ trợ:

* Cộng `+`
* Trừ `-`
* Nhân `×`
* Chia `÷`

### ✔ Dấu "="

Tính toán kết quả theo phép toán hiện tại.

### ✔ Chain Operations

Ví dụ:

```
5 + 3 × 2 = 16
```

Ứng dụng tự động thực hiện phép trước mỗi khi chọn phép toán mới.

### ✔ Xử lý chia 0

Trả về `"Error"` nếu `n ÷ 0`.

---

## **Các trường hợp cần test**

* `5 + 3 = 8`
* `7 × 2 = 14`
* `3.5 × 2 = 7`
* `9 ÷ 0 = Error`
* `CE` xoá đúng ký tự
* `C` xoá toàn bộ
* `5 + 3 × 2 = 16`
* Nhập nhiều số, số dài
* +/- hoạt động đúng
* Không được nhập 2 dấu "."

---


--



---

