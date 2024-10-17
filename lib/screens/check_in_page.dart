import 'package:flutter/material.dart';

class CheckInPage extends StatelessWidget {
  const CheckInPage({Key? key}) : super(key: key);

  void _sendCheckInInfo() {
    // TODO: チェックイン情報を送信する処理を実装
    print('チェックイン情報を送信しました');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('チェックイン', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _sendCheckInInfo,
            child: const Text('チェックイン情報を送信'),
          ),
        ],
      ),
    );
  }
}
