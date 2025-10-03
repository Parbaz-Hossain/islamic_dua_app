import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom_app_bar.dart';
import '../../services/dua_service.dart';
import '../../core/constants/app_routes.dart';

class DuasListScreen extends StatefulWidget {
  const DuasListScreen({super.key});

  @override
  State<DuasListScreen> createState() => _DuasListScreenState();
}

class _DuasListScreenState extends State<DuasListScreen> {
  @override
  void initState() {
    super.initState();
    // Load duas when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DuaService>(context, listen: false).loadDuas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'দোয়া সমূহ',
        showBackButton: true,
      ),
      body: Consumer<DuaService>(
        builder: (context, duaService, child) {
          if (duaService.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (duaService.duas.isEmpty) {
            return const Center(
              child: Text('কোন দোয়া পাওয়া যায়নি'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: duaService.duas.length,
            itemBuilder: (context, index) {
              final dua = duaService.duas[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  title: Text(
                    dua.bengaliTranslation,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    dua.category,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.duaDetail,
                      arguments: dua,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}