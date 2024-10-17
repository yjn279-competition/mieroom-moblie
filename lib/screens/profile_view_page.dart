import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'profile_edit_page.dart';
import '../models/profile.dart' as profile_model;
import '../providers/profile_provider.dart';
import '../services/ble_service.dart';

class ProfileViewPage extends ConsumerWidget {
  const ProfileViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            final profilesAsyncValue = ref.watch(profilesProvider);
            return profilesAsyncValue.when(
              data: (profiles) {
                if (profiles.isEmpty) {
                  return _buildEmptyProfile(context, ref);
                }
                final profile = profiles.first;
                return _buildProfileContent(context, ref, profile);
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) =>
                  Center(child: Text('エラーが発生しました: $error')),
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyProfile(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person_outline, size: 100, color: Colors.grey),
          const SizedBox(height: 20),
          const Text(
            'プロフィールが設定されていません',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _navigateToEditProfile(context, ref),
            child: const Text('プロフィールを作成'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileContent(
      BuildContext context, WidgetRef ref, profile_model.Profile profile) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(profile),
            const SizedBox(height: 20),
            _buildInfoSection('基本情報', [
              _buildInfoItem('名前', profile.name),
              _buildInfoItem('生年月日', profile.birthDate),
              _buildInfoItem('性別', profile.gender),
            ]),
            const SizedBox(height: 20),
            _buildInfoSection('個人番号', [
              _buildInfoItem('マイナンバー', profile.myNumber),
            ]),
            const SizedBox(height: 20),
            _buildFamilyNumbersSection(profile.familyNumbers),
            const SizedBox(height: 20),
            _buildInfoSection('特記事項', [
              _buildInfoItem('', profile.specialNotes),
            ]),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton.icon(
                onPressed: () =>
                    _navigateToEditProfile(context, ref, profile.id),
                icon: const Icon(Icons.edit),
                label: const Text('プロフィール編集'),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _sendProfileViaBLE(context, profile),
                icon: const Icon(Icons.bluetooth),
                label: const Text('プロフィールをBLEで送信'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(profile_model.Profile profile) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          child: Icon(Icons.person, size: 40),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                '${profile.birthDate} / ${profile.gender}',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoSection(String title, List<Widget> children) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty) ...[
            SizedBox(
              width: 100,
              child: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 10),
          ],
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildFamilyNumbersSection(List<String> familyNumbers) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '家族のマイナンバー',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            if (familyNumbers.isEmpty)
              const Text('登録されている家族はいません')
            else
              ...familyNumbers.asMap().entries.map((entry) {
                return _buildInfoItem('家族 ${entry.key + 1}', entry.value);
              }),
          ],
        ),
      ),
    );
  }

  void _navigateToEditProfile(BuildContext context, WidgetRef ref,
      [int? profileId]) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileEditPage(profileId: profileId),
      ),
    ).then((_) => ref.refresh(profilesProvider));
  }

  // void _sendProfileViaBLE(
  //     BuildContext context, profile_model.Profile profile) async {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(content: Text('プロフィールの送信を開始します...')),
  //   );

  //   try {
  //     await BLEService.sendProfile(profile);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('プロフィールが正常に送信されました')),
  //     );
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('送信中にエラーが発生しました: $e')),
  //     );
  //   }
  // }
  void _sendProfileViaBLE(
      BuildContext context, profile_model.Profile profile) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('プロフィールの広告を開始します...')),
    );

    try {
      await BLEService.advertiseProfile(profile);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('プロフィールの広告を開始しました')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('広告開始中にエラーが発生しました: $e')),
      );
    }
  }
}
