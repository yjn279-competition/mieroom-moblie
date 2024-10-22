import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'check_in_page.dart';
import 'profile_view_page.dart';
import '../models/safety_status.dart';
import '../providers/profile_provider.dart';
import '../providers/user_status_provider.dart';
import '../models/user_status.dart';
import 'qr_scanner_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _selectedIndex = 0;
  SafetyStatus _myStatus =
      SafetyStatus(name: '自分', status: SafetyStatusType.unknown);

  @override
  void initState() {
    super.initState();
  }

  List<SafetyStatus> _getFamilyStatus(List<String> familyNumbers) {
    return familyNumbers.isNotEmpty
        ? familyNumbers
            .map((number) => SafetyStatus(
                name: '家族 (${_getLastFourDigits(number)})',
                status: SafetyStatusType.unknown))
            .toList()
        : [SafetyStatus(name: '家族情報なし', status: SafetyStatusType.unknown)];
  }

  String _getLastFourDigits(String number) {
    if (number.length <= 4) {
      return number;
    }
    return number.substring(number.length - 4);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _updateMyStatus(SafetyStatusType newStatus) {
    setState(() {
      _myStatus = SafetyStatus(name: _myStatus.name, status: newStatus);
    });
    // TODO: ローカルストレージに保存し、可能であればサーバーに送信
  }

  Widget _buildHomeContent() {
    final profilesAsyncValue = ref.watch(profilesProvider);
    final userStatus = ref.watch(userStatusProvider);

    return profilesAsyncValue.when(
      data: (profiles) {
        final familyStatus = profiles.isNotEmpty
            ? _getFamilyStatus(profiles.first.familyNumbers)
            : [
                SafetyStatus(
                    name: 'プロフィール未設定', status: SafetyStatusType.unknown)
              ];

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '現在の状態',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _buildStatusCard(userStatus),
                const SizedBox(height: 24),
                const Text(
                  '家族の安否情報',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                ...familyStatus.map(_buildFamilyStatusCard),
              ],
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('エラーが発生しました: $error')),
    );
  }

  Widget _buildStatusCard(UserStatus? userStatus) {
    final isInShelter = userStatus?.isInShelter == true;
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              userStatus?.status ?? '不明',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _getStatusColor(userStatus?.status),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color:
                    isInShelter ? Colors.green.shade100 : Colors.red.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isInShelter ? Icons.home : Icons.home_outlined,
                    size: 30,
                    color: isInShelter ? Colors.green : Colors.red,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isInShelter ? '避難所にいます' : '避難所にいません',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isInShelter
                          ? Colors.green.shade800
                          : Colors.red.shade800,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '最終更新: ${userStatus?.lastUpdated != null ? _formatDateTime(userStatus!.lastUpdated) : "不明"}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSafetyStatusCard() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              _myStatus.status.toString().split('.').last,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _getStatusColor(_myStatus.status.toString()),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _updateMyStatus(SafetyStatusType.safe),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('安全'),
                ),
                ElevatedButton(
                  onPressed: () => _updateMyStatus(SafetyStatusType.needHelp),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('助けが必要'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFamilyStatusCard(SafetyStatus status) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              status.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Chip(
              label: Text(
                status.status.toString().split('.').last,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: _getStatusColor(status.status.toString()),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String? status) {
    switch (status) {
      case '安全':
        return Colors.green;
      case '要支援':
        return Colors.orange;
      case '急':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.year}/${dateTime.month}/${dateTime.day} ${dateTime.hour}:${dateTime.minute}';
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      _buildHomeContent(),
      const QRScannerPage(),
      const ProfileViewPage(),
    ];

    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'QRスキャン',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'プロフィール',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
