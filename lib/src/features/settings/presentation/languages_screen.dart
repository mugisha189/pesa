import 'package:flutter/material.dart';

class LanguagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.arrow_back, color: Colors.white),
        centerTitle: true,
        title: Text(
          'Lenguaje',
          style: TextStyle(color: Colors.white),
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
                  color: Color(0xFF1E1E1E),
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
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey),
                    ListTile(
                      title: Text(
                        'French',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Radio(
                        value: false,
                        groupValue: true,
                        onChanged: (value) {},
                        activeColor: Colors.cyan,
                      ),
                    ),
                    Divider(color: Colors.grey),
                    ListTile(
                      title: Text(
                        'Spanish',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Radio(
                        value: false,
                        groupValue: true,
                        onChanged: (value) {},
                        activeColor: Colors.cyan,
                      ),
                    ),
                    Divider(color: Colors.grey),
                    ListTile(
                      title: Text(
                        'Italian',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Radio(
                        value: false,
                        groupValue: true,
                        onChanged: (value) {},
                        activeColor: Colors.cyan,
                      ),
                    ),
                    Divider(color: Colors.grey),
                    ListTile(
                      title: Text(
                        'Germany',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Radio(
                        value: false,
                        groupValue: true,
                        onChanged: (value) {},
                        activeColor: Colors.cyan,
                      ),
                    ),
                    Divider(color: Colors.grey),
                    ListTile(
                      title: Text(
                        'Chinese',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Radio(
                        value: false,
                        groupValue: true,
                        onChanged: (value) {},
                        activeColor: Colors.cyan,
                      ),
                    ),
                    Divider(color: Colors.grey),
                    ListTile(
                      title: Text(
                        'Japanese',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Radio(
                        value: false,
                        groupValue: true,
                        onChanged: (value) {},
                        activeColor: Colors.cyan,
                      ),
                    ),
                    Divider(color: Colors.grey),
                    ListTile(
                      title: Text(
                        'Russian',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Radio(
                        value: false,
                        groupValue: true,
                        onChanged: (value) {},
                        activeColor: Colors.cyan,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
