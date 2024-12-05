class SelectContactService {
  List<Map<String, String>> getAllContacts() {
    return [
      {'name': 'Abigail Smith', 'phone': '+250 786 584 924'},
      {'name': 'Alan Steward', 'phone': '+250 786 584 924'},
      {'name': 'Britney Smith', 'phone': '+250 786 584 924'},
      {'name': 'Beto González', 'phone': '+250 786 584 924'},
      {'name': 'Bob Hernández', 'phone': '+250 786 584 924'},
    ];
  }

  List<Map<String, String>> getFavoriteContacts() {
    return [
      {'name': 'Abigail Smith', 'phone': '+250 786 584 924'},
      {'name': 'Britney Smith', 'phone': '+250 786 584 924'},
    ];
  }
}
