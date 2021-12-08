# TTHC

Phần mềm tthc lấy ý tưởng từ việc các bối rối khi mọi người đi làm thủ tục, không biết đi ra phòng nào xin những gì. tthc là một bản đồ thu nhỏ sẽ hướng dẫn bạn từng bước để làm thủ tục một cách chi tiết nhanh chóng và dễ hiểu, tthc hướng dẫn cụ thể bước làm thủ tục nào sẽ ra phòng nào, vị trí của phòng đó và các chú thích cần ghi nhớ để làm thủ tục giúp người dùng thực hiện thủ tục nhanh chóng và thoải mái.

## Integration test
Chạy kiểm thử animation màn hình `MapScreen` 
```bash
flutter drive --driver=test_driver/integration_test_driver.dart --target=integration_test/map_test.dart
```

## Screenshots

<table>
  <tr>
    <td>Splash screen</td>
     <td>Chọn lịch hen thủ tục</td>
     <td>Thêm lịch hẹn</td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/62325868/145140079-aa6c43aa-3252-427a-98cb-6bcd23f1c691.png"></td>
    <td><img src="https://user-images.githubusercontent.com/62325868/145140127-ac71bd59-646a-4956-ab04-0cd65d619ba6.png"></td>
    <td><img src="https://user-images.githubusercontent.com/62325868/145140171-5fd61316-527f-4173-8783-525f05ba5e79.png"></td>
   </tr>
    <tr>
     <td>Chọn thủ tục</td>
     <td>Chọn địa điểm</td>
     <td>Bản đồ hướng dẫn</td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/62325868/145140422-668f030a-50c3-4bcf-956d-9d08976a88eb.png"></td>
    <td><img src="https://user-images.githubusercontent.com/62325868/145140462-8f2aeb48-a7d5-49e0-8ce9-bda7cc74c84b.png"></td>
    <td><img src="https://user-images.githubusercontent.com/62325868/145263287-bf341f10-d58c-4aeb-b6ef-9a861bac11ac.gif"></td>
  </tr>

 </table>

## Công nghệ sử dụng

### Network
- Back-end: spring boot
- dio
### State management
- flutter_riverpod
### Widget life-cycle
- flutter_hooks
- hooks_riverpod
### Styling
- animations
- simple_animations
- flex_color_scheme
- just_the_tooltip
### Testing
- flutter_test
- integration_test
### Linting
- very_good_analysis

## Cấu trúc dự án
Xem tại file [cấu trúc dự án](./architecture.md)
