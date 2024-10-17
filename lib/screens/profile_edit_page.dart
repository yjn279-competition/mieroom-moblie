import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import '../providers/profile_provider.dart';
import '../models/profile.dart' as profile_model;
import '../database/database.dart';

class ProfileEditPage extends ConsumerStatefulWidget {
  final int? profileId;

  const ProfileEditPage({Key? key, this.profileId}) : super(key: key);

  @override
  ConsumerState<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends ConsumerState<ProfileEditPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _birthDateController;
  late TextEditingController _genderController;
  late TextEditingController _myNumberController;
  late List<TextEditingController> _familyNumberControllers;
  late TextEditingController _specialNotesController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _birthDateController = TextEditingController();
    _genderController = TextEditingController();
    _myNumberController = TextEditingController();
    _familyNumberControllers = [TextEditingController()];
    _specialNotesController = TextEditingController();
    if (widget.profileId != null) {
      _loadExistingProfile();
    }
  }

  void _loadExistingProfile() async {
    final profile =
        await ref.read(databaseProvider).getProfile(widget.profileId!);
    setState(() {
      _nameController.text = profile.name;
      _birthDateController.text = profile.birthDate;
      _genderController.text = profile.gender;
      _myNumberController.text = profile.myNumber;
      _familyNumberControllers = profile.familyNumbers
          .split(',')
          .map((number) => TextEditingController(text: number))
          .toList();
      if (_familyNumberControllers.isEmpty) {
        _familyNumberControllers.add(TextEditingController());
      }
      _specialNotesController.text = profile.specialNotes;
    });
  }

  void _addFamilyMember() {
    setState(() {
      _familyNumberControllers.add(TextEditingController());
    });
  }

  void _removeFamilyMember(int index) {
    setState(() {
      _familyNumberControllers.removeAt(index);
    });
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      final profile = profile_model.Profile(
        id: widget.profileId ?? 0,
        name: _nameController.text,
        birthDate: _birthDateController.text,
        gender: _genderController.text,
        myNumber: _myNumberController.text,
        familyNumbers: _familyNumberControllers
            .map((controller) => controller.text)
            .where((number) => number.isNotEmpty)
            .toList(),
        specialNotes: _specialNotesController.text,
      );

      try {
        final database = ref.read(databaseProvider);
        if (widget.profileId == null) {
          await database.insertProfile(ProfilesCompanion.insert(
            name: profile.name,
            birthDate: profile.birthDate,
            gender: profile.gender,
            myNumber: profile.myNumber,
            familyNumbers: profile.familyNumbers.join(','),
            specialNotes: profile.specialNotes,
          ));
        } else {
          await database.updateProfile(ProfilesCompanion(
            id: drift.Value(widget.profileId!),
            name: drift.Value(profile.name),
            birthDate: drift.Value(profile.birthDate),
            gender: drift.Value(profile.gender),
            myNumber: drift.Value(profile.myNumber),
            familyNumbers: drift.Value(profile.familyNumbers.join(',')),
            specialNotes: drift.Value(profile.specialNotes),
          ));
        }

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('プロフィールが保存されました')),
        );
        Navigator.of(context).pop();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('エラーが発生しました: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.profileId == null ? 'プロフィール作成' : 'プロフィール編集'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildSection('基本情報', [
              _buildTextFormField(_nameController, '名前'),
              _buildTextFormField(_birthDateController, '生年月日'),
              _buildTextFormField(_genderController, '性別'),
            ]),
            const SizedBox(height: 20),
            _buildSection('個人番号', [
              _buildTextFormField(_myNumberController, 'マイナンバー'),
            ]),
            const SizedBox(height: 20),
            _buildFamilyNumbersSection(),
            const SizedBox(height: 20),
            _buildSection('特記事項', [
              _buildTextFormField(_specialNotesController, '特記事項', maxLines: 3),
            ]),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _saveProfile,
              child: const Text('保存'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
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

  Widget _buildTextFormField(TextEditingController controller, String label,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$labelを入力してください';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildFamilyNumbersSection() {
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
            ..._familyNumberControllers.asMap().entries.map((entry) {
              int idx = entry.key;
              var controller = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller,
                        decoration: InputDecoration(labelText: '家族 ${idx + 1}'),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => _removeFamilyMember(idx),
                    ),
                  ],
                ),
              );
            }),
            ElevatedButton.icon(
              onPressed: _addFamilyMember,
              icon: const Icon(Icons.add),
              label: const Text('家族を追加'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _birthDateController.dispose();
    _genderController.dispose();
    _myNumberController.dispose();
    for (var controller in _familyNumberControllers) {
      controller.dispose();
    }
    _specialNotesController.dispose();
    super.dispose();
  }
}
