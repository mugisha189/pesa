import 'package:flutter/material.dart';

class FaqItem {
  final String title;
  final String description;

  FaqItem({required this.title, required this.description});
}

class ContactItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  ContactItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}

class HelpServices {
  static List<FaqItem> getFaqItems() {
    return [
      FaqItem(
          title: "¿Qué es Pasa?",
          description: "Content. Lorem ipsum dolor sit amet"),
      FaqItem(
          title: "¿Cómo configuro mi cuenta?",
          description: "Content. Lorem ipsum dolor sit amet"),
      FaqItem(
          title: "¿Cómo envío dinero?",
          description: "Content. Lorem ipsum dolor sit amet"),
      FaqItem(
          title: "¿Cuánto tardan las transferencias?",
          description: "Content. Lorem ipsum dolor sit amet"),
      FaqItem(
          title: "¿Hay comisiones?",
          description: "Content. Lorem ipsum dolor sit amet"),
    ];
  }

  static List<ContactItem> getContactItems() {
    return [
      ContactItem(
        icon: Icons.phone,
        title: "Servicio al cliente",
        subtitle: "+250 785 564 924",
        onTap: () {},
      ),
      ContactItem(
        icon: Icons.facebook,
        title: "WhatsApp",
        subtitle: "Description. Lorem ipsum dolor sit amet",
        onTap: () {},
      ),
      ContactItem(
        icon: Icons.web,
        title: "Sitio web",
        subtitle: "www.pasa.pe",
        onTap: () {},
      ),
      ContactItem(
        icon: Icons.facebook,
        title: "Facebook",
        subtitle: "www.facebook.com/pasa.app",
        onTap: () {},
      ),
      ContactItem(
        icon: Icons.camera_alt,
        title: "Instagram",
        subtitle: "www.instagram.com/pasa.app",
        onTap: () {},
      ),
      ContactItem(
        icon: Icons.alternate_email,
        title: "X",
        subtitle: "www.x.com/pasa.app",
        onTap: () {},
      ),
    ];
  }
}
