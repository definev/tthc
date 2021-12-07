import 'package:flutter/material.dart';

class ActionScreen extends StatelessWidget {
  const ActionScreen({Key? key}) : super(key: key);

  static const routeName = '/action';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn thủ tục'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(10),
        shrinkWrap: true,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context, 'Chứng minh thư'),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.account_box,
                    size: 40,
                  ),
                  Text(
                    'Chứng minh thư',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context, 'Công chứng sổ đỏ'),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.chrome_reader_mode,
                    size: 40,
                  ),
                  Text(
                    'Công chứng sổ đỏ',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context, 'Đóng tiền phạt'),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.monetization_on_rounded,
                    size: 40,
                  ),
                  Text(
                    'Đóng tiền phạt',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context, 'Làm hộ chiếu'),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.flight,
                    size: 40,
                  ),
                  Text(
                    'Làm hộ chiếu',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context, 'Giấy phép xây dựng'),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.construction,
                    size: 40,
                  ),
                  Text(
                    'Giấy phép xây dựng',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context, 'Hộ khẩu'),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.person_add,
                    size: 40,
                  ),
                  Text(
                    'Hộ khẩu',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context, 'Đăng ký kinh doanh'),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.add_business,
                    size: 40,
                  ),
                  Text(
                    'Đăng ký kinh doanh',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context, 'Cung cấp thông tin'),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.help_center,
                    size: 40,
                  ),
                  Text(
                    'Cung cấp thông tin',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context, 'Hải quan'),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.help_center,
                    size: 40,
                  ),
                  Text(
                    'Hải quan',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
