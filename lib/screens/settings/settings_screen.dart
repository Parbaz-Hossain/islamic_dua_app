import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'সেটিংস',
        showBackButton: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('ভাষা'),
            subtitle: const Text('বাংলা'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Language selection
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('নোটিফিকেশন'),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('ডার্ক মোড'),
            trailing: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('অ্যাপ সম্পর্কে'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}