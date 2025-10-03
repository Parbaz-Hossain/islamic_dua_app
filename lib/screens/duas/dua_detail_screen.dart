import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/arabic_text_widget.dart';
import '../../models/dua.dart';

class DuaDetailScreen extends StatelessWidget {
  const DuaDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the dua passed as argument
    final dua = ModalRoute.of(context)!.settings.arguments as Dua;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'দোয়া বিস্তারিত',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Arabic text
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ArabicTextWidget(
                  text: dua.arabicText,
                  fontSize: 28,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Bengali translation
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'বাংলা অর্থ:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      dua.bengaliTranslation,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Transliteration
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'উচ্চারণ:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      dua.transliteration,
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}