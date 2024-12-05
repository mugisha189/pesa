import 'package:flutter/material.dart';
import 'package:pesa/src/features/send/services/select_contact.dart';

class SelectContact extends StatefulWidget {
  final Function(Map<String, String>) onSelectContact;

  const SelectContact({required this.onSelectContact});

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  final SelectContactService _service = SelectContactService();
  List<Map<String, String>> _contacts = [];
  List<Map<String, String>> _displayedContacts = [];
  bool _showFavorites = false;

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  void _loadContacts() {
    _contacts = _showFavorites
        ? _service.getFavoriteContacts()
        : _service.getAllContacts();
    _displayedContacts = _contacts;
  }

  void _searchContacts(String query) {
    setState(() {
      _displayedContacts = _contacts
          .where((contact) =>
              contact['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _toggleTab(bool showFavorites) {
    setState(() {
      _showFavorites = showFavorites;
      _loadContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.white),
        centerTitle: true,
        title: Text('Enviar dinero', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              onChanged: _searchContacts,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Buscar',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Color(0xFF29292B),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search, color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _toggleTab(false),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: !_showFavorites
                          ? LinearGradient(
                              colors: [Color(0xFF6366F1), Color(0xFF17D3FF)],
                            )
                          : null,
                      color: _showFavorites ? Color(0xFF29292B) : null,
                    ),
                    child: Text(
                      'Todos',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _toggleTab(true),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: _showFavorites
                          ? LinearGradient(
                              colors: [Color(0xFF6366F1), Color(0xFF17D3FF)],
                            )
                          : null,
                      color: !_showFavorites ? Color(0xFF29292B) : null,
                    ),
                    child: Text(
                      'Favoritos',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: _buildContactList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildContactList() {
    Map<String, List<Map<String, String>>> groupedContacts = {};

    for (var contact in _displayedContacts) {
      String firstLetter = contact['name']![0].toUpperCase();
      groupedContacts.putIfAbsent(firstLetter, () => []).add(contact);
    }

    List<Widget> contactWidgets = [];

    groupedContacts.forEach((letter, contacts) {
      contactWidgets.add(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            letter,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

      contactWidgets.addAll(contacts.map((contact) {
        return ListTile(
          onTap: () => widget.onSelectContact(contact),
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.black),
          ),
          title: Text(
            contact['name']!,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            contact['phone']!,
            style: TextStyle(color: Colors.grey),
          ),
        );
      }).toList());
    });

    return contactWidgets;
  }
}
