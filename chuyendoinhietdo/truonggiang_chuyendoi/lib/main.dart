import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final TextEditingController _celsiusController = TextEditingController();
  String _result = "";

  void _convert() {
    final input = _celsiusController.text;
    if (input.isEmpty) {
      setState(() {
        _result = "Vui lòng nhập nhiệt độ °C!";
      });
      return;
    }
    final double? celsius = double.tryParse(input);
    if (celsius == null) {
      setState(() {
        _result = "Nhập số hợp lệ nha!";
      });
      return;
    }
    final double fahrenheit = celsius * 9 / 5 + 32;
    setState(() {
      _result = "${fahrenheit.toStringAsFixed(2)} độ";
    });
  }

  @override
  void dispose() {
    _celsiusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "CHUYỂN ĐỔI ĐƠN VỊ ĐO",
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    "Nhập nhiệt độ (°C)",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _celsiusController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(),
                ),
                const SizedBox(height: 16),
                Text("Nhiệt độ F là: ", style: TextStyle(fontSize: 20)),
                const SizedBox(height: 16),
                Text(
                  _result,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                  ),
                ),
                // ElevatedButton đã bỏ rồi
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _convert,
          icon: const Icon(Icons.swap_horiz),
          label: const Text("Chuyển đổi sang °F"),
        ),
      ),
    );
  }
}
