import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import '../services/help.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      backgroundColor: AppColors.primaryBackground(brightness),
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackground(brightness),
        title: const Text("Centro de ayuda"),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'FAQs'),
            Tab(text: 'Contacto'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildFaqTab(),
          _buildContactTab(),
        ],
      ),
    );
  }

  Widget _buildFaqTab() {
    final faqItems = HelpServices.getFaqItems();
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: faqItems.length,
      itemBuilder: (context, index) {
        final item = faqItems[index];
        return ExpansionTile(
          title: Text(item.title),
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(item.description),
            ),
          ],
        );
      },
    );
  }

  Widget _buildContactTab() {
    final contactItems = HelpServices.getContactItems();
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: contactItems.length,
      itemBuilder: (context, index) {
        final item = contactItems[index];
        return ListTile(
          leading: Icon(item.icon),
          title: Text(item.title),
          subtitle: Text(item.subtitle),
          onTap: item.onTap,
        );
      },
    );
  }
}
