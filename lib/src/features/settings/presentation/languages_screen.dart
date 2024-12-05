import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/src/features/settings/services/languages.dart';

class LanguagesScreen extends StatefulWidget {
  @override
  _LanguagesScreenState createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  final LanguageService _languageService = LanguageService();

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      backgroundColor: AppColors.primaryBackground(brightness),
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackground(brightness),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primaryText(brightness)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          'Lenguaje',
          style: TextStyle(color: AppColors.primaryText(brightness)),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.secondaryBackground(brightness),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Idiomas',
                        style: TextStyle(
                          color: AppColors.secondaryText(brightness),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildLanguageTile('French', brightness),
                    _buildLanguageTile('Spanish', brightness),
                    _buildLanguageTile('Italian', brightness),
                    _buildLanguageTile('German', brightness),
                    _buildLanguageTile('Chinese', brightness),
                    _buildLanguageTile('Japanese', brightness),
                    _buildLanguageTile('Russian', brightness),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageTile(String language, Brightness brightness) {
    bool isSelected = _languageService.selectedLanguage == language;
    return ListTile(
      title: Text(
        language,
        style: TextStyle(color: AppColors.primaryText(brightness)),
      ),
      trailing: Radio(
        value: true,
        groupValue: isSelected,
        onChanged: (value) {
          setState(() {
            _languageService.setSelectedLanguage(language);
          });
        },
        activeColor: AppColors.primary(brightness),
      ),
    );
  }
}