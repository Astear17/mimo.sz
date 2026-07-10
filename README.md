\# DJI Mimo Vietnamese Translation



Bản dịch tiếng Việt dành cho \*\*DJI Mimo\*\* (Android) — ứng dụng điều khiển và biên tập nội dung cho các thiết bị như Osmo Action, Osmo Mobile và Osmo Pocket.



!\[License](https://img.shields.io/badge/license-MIT-blue.svg)

!\[DJI Mimo version](https://img.shields.io/badge/DJI%20Mimo-v2.10.9-orange.svg)

!\[Last commit](https://img.shields.io/github/last-commit/Astear17/mimo.sz)



> \[!IMPORTANT]

> Đây là dự án không chính thức, không liên kết, tài trợ hoặc xác nhận bởi DJI. \*\*DJI\*\*, \*\*DJI Mimo\*\*, \*\*Osmo\*\* và các tên sản phẩm liên quan là nhãn hiệu của Công ty TNHH Công nghệ SZ DJI Osmo và các công ty liên kết của nó.



\## Trạng thái



\- Còn trong quá trình dịch sang tiếng Việt.

\- Tổng số tài nguyên chuỗi: \*\*10.603\*\*.

\- Repo chứa toàn bộ resource được decompile từ `base.apk` (không chỉ riêng `strings.xml`), nhưng trọng điểm dịch chỉ nằm ở `res/values/strings.xml`.

\- Giữ nguyên key, thuộc tính và cấu trúc XML gốc.

\- Giữ nguyên placeholder định dạng, URL, ký tự thoát và tên tính năng DJI.

\- Đã kiểm tra cú pháp XML và quy tắc chuỗi tài nguyên Android.



> \[!NOTE]

> Vì mình lười nên README này sẽ không được cập nhật song song với tiến độ dịch. Xem tiến độ thực tế qua lịch sử commit của `strings.xml`.



\## Cấu trúc mục tiêu (trọng điểm dịch)



```text

res

└── values/

&#x20;   └── strings.xml

```



\## Cách sử dụng



Có 2 cách để dùng bản dịch này:



1\. \*\*Tự build từ mã nguồn\*\* — dành cho ai muốn tùy chỉnh hoặc theo dõi bản dịch mới nhất trực tiếp từ repo (xem mục \[Build lại APK](#build-lại-apk) bên dưới).

2\. \*\*Dùng bản Release có sẵn\*\* — dành cho người dùng phổ thông, cài nhanh bằng file ZIP đã đóng gói sẵn. Bản Release được dịch bằng ChatGPT Work 5.6 Sol (Max), có thể chứa bản dịch mơ hồ hoặc chưa hoàn thiện 100%.



\### Cài đặt bản Release (khuyến nghị người dùng thường)



\*\*Bước 1:\*\* Tải và cài đặt \[X-plore từ CH Play](https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore)



\*\*Bước 2:\*\* Tải tệp `DJI\_Mimo\_VietHoa.zip` từ mục Releases về thiết bị



\*\*Bước 3:\*\* Mở X-plore \& cho phép các quyền mà ứng dụng yêu cầu



\*\*Bước 4:\*\* Tìm file ZIP đã tải, nhấn 1 lần vào file ZIP sẽ có mục \*\*Cài đặt: Split APK 4x\*\*



Đợi khoảng 1-2 phút sẽ có cửa sổ hiển thị yêu cầu cài đặt APK. Bấm \*\*Cài đặt\*\* là xong.



> \[!NOTE]

> Nhớ gỡ cài đặt app Mimo gốc trên máy nếu có, trước khi cài bản đã Việt hóa.



\## Build lại APK



\### Yêu cầu



\- \*\*Apktool\*\* v3.0.2 hoặc cao hơn — tải và cài đặt tại \[apktool.org/docs/install](https://apktool.org/docs/install/)

\- \*\*Java\*\* 8 hoặc cao hơn

\- Tệp `keystore.jks` dùng để ký APK — có sẵn trong mục Releases



\### Các bước build



1\. Clone repo về máy:

&#x20;  ```bash

&#x20;  git clone https://github.com/Astear17/mimo.sz.git

&#x20;  cd mimo.sz

&#x20;  ```



2\. Đóng gói lại APK bằng Apktool:

&#x20;  ```bash

&#x20;  apktool b . -o base.apk

&#x20;  ```

&#x20;  Lưu ý: file build ra phải được đặt tên là `base.apk` để khớp với tên file gốc bên trong bản Split APK.



3\. Ký lại `base.apk` bằng `keystore.jks` (tải kèm trong Releases). Dùng `apksigner` đi kèm Android SDK build-tools:

&#x20;  ```bash

&#x20;  apksigner sign --ks keystore.jks base.apk

&#x20;  ```

&#x20;  Nếu Android báo lỗi không cài được do xung đột chữ ký với app cũ, bật \*\*Allow resign / Cho phép ký lại\*\* trong trình cài (ví dụ trong X-plore hoặc trình quản lý APK khác hỗ trợ resign) thay vì gỡ cài đặt app gốc.



4\. Thay `base.apk` vào bộ Split APK:

&#x20;  - Tải `DJI\_Mimo\_VietHoa.zip` từ Releases (bên trong có 4 file APK, gồm 1 `base.apk` và 3 file split khác).

&#x20;  - Xóa file `base.apk` cũ trong ZIP, thay bằng `base.apk` vừa build và ký ở bước 3.

&#x20;  - Đổi đuôi file ZIP từ `.zip` thành `.apks`.



5\. Cài đặt bộ `.apks` lên thiết bị — làm theo các bước tương tự mục \[Cài đặt bản Release](#cài-đặt-bản-release-khuyến-nghị-người-dùng-thường) ở trên bằng X-plore, hoặc dùng công cụ hỗ trợ cài Split APK khác.



\## Quy ước dịch thuật



| Thuật ngữ gốc | Bản dịch sử dụng | Ghi chú |

|---|---|---|

| Gimbal | Gimbal | Giữ nguyên, thuật ngữ kỹ thuật phổ biến trong cộng đồng quay phim/nhiếp ảnh Việt Nam |

| Follow mode | Chế độ Theo dõi | |

| FPV mode | Chế độ FPV | Giữ nguyên viết tắt FPV vì đã phổ biến |

| Tilt / Pan / Roll | Nghiêng / Xoay ngang / Lăn | |

| Livestream | Phát trực tiếp | |

| SD card | Thẻ nhớ SD / thẻ SD | |

| Battery | Pin | |

| Firmware | Firmware | Giữ nguyên, không có bản dịch thuần Việt phù hợp |

| Timelapse / Hyperlapse | Giữ nguyên | Tên tính năng, không dịch để tránh gây nhầm lẫn với hướng dẫn sử dụng gốc |

| ActiveTrack / SpinShot / QuickShot / Story Mode | Giữ nguyên | Tên tính năng độc quyền của DJI |



Các placeholder như `%1$s`, `%2$d`, `%1$.2f`, `%s` và `%%` phải được giữ nguyên tuyệt đối.



\## Đóng góp



Khi muốn đóng góp bản dịch:



1\. Sửa trực tiếp file `res/values/strings.xml` (lưu ý: dùng thư mục `values`, không phải `values-vi`).

2\. Không đổi tên key hoặc thuộc tính của tài nguyên.

3\. Không xóa, thêm hoặc đổi thứ tự placeholder.

4\. Giữ nguyên URL, ký tự thoát và tên riêng của DJI.

5\. Ưu tiên câu ngắn, tự nhiên và dễ hiểu trong giao diện di động.

6\. Kiểm tra lại cú pháp XML trước khi gửi Pull Request.



\## Giấy phép



Phần bản dịch và các nội dung do dự án này tạo ra được phát hành theo \[MIT License](LICENSE).



Giấy phép này không áp dụng cho ứng dụng DJI Mimo, mã nguồn, tài nguyên, nhãn hiệu hoặc nội dung thuộc sở hữu của DJI và các bên thứ ba.



\---



> \[!IMPORTANT]

> Nhắc lại: dự án này \*\*không chính thức\*\*, không liên kết, tài trợ hoặc xác nhận bởi DJI. \*\*DJI\*\*, \*\*DJI Mimo\*\*, \*\*Osmo\*\* và các tên sản phẩm liên quan là nhãn hiệu thuộc sở hữu của Công ty TNHH Công nghệ SZ DJI Osmo và các công ty liên kết.

