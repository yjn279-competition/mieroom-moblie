import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_status.dart';
import '../providers/user_status_provider.dart';
import 'dart:async';

class CheckInPage extends ConsumerStatefulWidget {
  final String? qrData;
  const CheckInPage({Key? key, this.qrData}) : super(key: key);

  @override
  ConsumerState<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends ConsumerState<CheckInPage> {
  bool _isLoading = false;
  String? _shelterName;

  @override
  void initState() {
    super.initState();
    if (widget.qrData != null) {
      _shelterName = widget.qrData;
      debugPrint('Shelter Name: $_shelterName');
    }
  }

  Future<void> _updateStatus(bool isCheckingIn) async {
    setState(() {
      _isLoading = true;
    });

    debugPrint('Updating status: isCheckingIn = $isCheckingIn');

    // 2秒間のローディング
    await Future.delayed(const Duration(seconds: 2));

    // ユーザーステータスを更新
    final newStatus = isCheckingIn ? '避難所にいます' : '避難所にいません';
    await ref
        .read(userStatusProvider.notifier)
        .updateUserStatus(newStatus, isCheckingIn);

    // 更新後の状態を確認
    final updatedStatus = ref.read(userStatusProvider);
    debugPrint(
        'Updated status: ${updatedStatus?.status}, isInShelter: ${updatedStatus?.isInShelter}');

    setState(() {
      _isLoading = false;
    });

    debugPrint('Status updated: $newStatus');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(isCheckingIn ? 'チェックインが完了しました' : 'チェックアウトが完了しました')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userStatus = ref.watch(userStatusProvider);
    final isCheckedIn = userStatus?.isInShelter ?? false;

    return Scaffold(
      appBar: AppBar(
        title: Text(isCheckedIn ? 'チェックアウト' : 'チェックイン'),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_shelterName != null)
                  Text(
                    '避難所: $_shelterName',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                const SizedBox(height: 20),
                isCheckedIn ? _buildCheckOutView() : _buildCheckInView(),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                  child: const Text('ホームに戻る'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                ),
              ],
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCheckInView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.login,
          size: 80,
          color: Colors.blue,
        ),
        const SizedBox(height: 20),
        const Text(
          'チェックインする',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () => _updateStatus(true),
          icon: const Icon(Icons.login, size: 30),
          label: const Text('チェックイン', style: TextStyle(fontSize: 20)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckOutView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.logout,
          size: 80,
          color: Colors.red,
        ),
        const SizedBox(height: 20),
        const Text(
          'チェックアウトする',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () => _updateStatus(false),
          icon: const Icon(Icons.logout, size: 30),
          label: const Text('チェックアウト', style: TextStyle(fontSize: 20)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ],
    );
  }
}
