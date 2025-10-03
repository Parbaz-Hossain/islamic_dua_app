import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'রিমাইন্ডার',
        showBackButton: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.notifications_outlined, size: 100, color: Colors.grey[400]),
            const SizedBox(height: 20),
            Text(
              'রিমাইন্ডার ফিচার শীঘ্রই আসছে',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add reminder functionality
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}