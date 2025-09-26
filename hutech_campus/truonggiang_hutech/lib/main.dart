import 'package:flutter/material.dart';

import 'screens/details_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(HutechCampusApp()); // Chạy ứng dụng Flutter
}

class HutechCampusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thông tin các Campus HUTECH',
      theme: ThemeData(primarySwatch: Colors.blue), // Chủ đề chính (màu đỏ)
      initialRoute: '/home', // Màn hình đầu tiên khi mở app
      routes: {
        '/home': (context) => HomeScreen(), // Trang chính
        '/details': (context) => DetailsScreen(), // Trang chi tiết
      },
    );
  }
}
