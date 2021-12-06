# Cấu trúc dự án

```js
lib                                      
├─ src                                   
│  ├─ connectors                         
│  │  └─ `map_connector.dart` (Liên kết data giữa màn `MapScreen` với các màn còn lại)              
│  ├─ features                           
│  │  ├─ action (Tính năng chọn loại thủ tục)                          
│  │  │  ├─ controllers                  
│  │  │  │  └─ `action_controller.dart`    
│  │  │  ├─ repositories                 
│  │  │  ├─ screens                      
│  │  │  │  └─ `action_screen.dart`        
│  │  │  └─ widgets                      
│  │  ├─ form (Tính năng book lịch làm thủ tục)                            
│  │  │  ├─ controllers                  
│  │  │  ├─ models                       
│  │  │  │  └─ `tthc_form.dart`            
│  │  │  ├─ repositories                 
│  │  │  │  └─ `form_remote.dart`          
│  │  │  ├─ screens                      
│  │  │  │  └─ `form_screen.dart`          
│  │  │  └─ widgets                      
│  │  ├─ location (Tính năng chọn vị trí)                        
│  │  │  ├─ controllers                  
│  │  │  │  └─ `location_controller.dart`  
│  │  │  ├─ repositories                      
│  │  │  ├─ screens                      
│  │  │  │  └─ `location_screen.dart`      
│  │  │  └─ widgets                      
│  │  └─ map (Tính năng xem bản đồ)                             
│  │     ├─ controllers                  
│  │     ├─ repositories                 
│  │     ├─ screens                      
│  │     │  └─ `map_screen.dart`          
│  │     └─ widgets                      
│  ├─ models                             
│  │  ├─ `tthc_action.dart`                
│  │  └─ `tthc_location.dart`              
│  ├─ utils                              
│  │  └─ `styles.dart`                     
│  └─ widgets                            
├─ `app.dart`                              
└─ `main.dart`                             
```

Thư mục `connectors` giúp giao tiếp giữa các tính năng với nhau.

Thư mục `utils` chứa một số helper về styles, logging, validate form, ...

Thư mục `models` lưu các object dùng chung

Mỗi sub-folder của thư mục `features` chứa 5 thư mục con:
- `controllers`: Quản lí state
- `repositories`: Quản lí dữ liệu (Lưu dữ liệu local hoặc gọi api)
- `models`: Quản lí object
- `screens`: Màn hình của tính năng
- `widgets`: Các `Widget` có thể reuse trong tính năng

`app.dart`: Điểm khởi đầu của ứng dụng

`main.dart`: Hàm main