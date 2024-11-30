import 'package:pesa/src/features/notifications/models/notification.dart';

class NotificationsService {
  // Simulating fetching notifications from an API or database
  List<Notification> fetchNotifications() {
    return [
      Notification(
        title: 'Nueva actualización',
        description:
            'Actualiza la app ahora para acceder a las últimas funciones para una mejor experiencia financiera.',
        date: '28/9/2024',
        time: '09:41 AM',
        isNew: true,
      ),
      Notification(
        title: 'Nueva actualización',
        description:
            'Actualiza la app ahora para acceder a las últimas funciones para una mejor experiencia financiera.',
        date: '28/9/2024',
        time: '09:41 AM',
        isNew: true,
      ),
      Notification(
        title: 'Acceso detectado',
        description:
            'Actualiza la app ahora para acceder a las últimas funciones para una mejor experiencia financiera.',
        date: '28/9/2024',
        time: '09:41 AM',
        isNew: false,
      ),
    ];
  }
}
