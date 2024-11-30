import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/src/features/notifications/services/notifications_service.dart';
import 'package:pesa/src/features/notifications/models/notification.dart'
    as local_notification;
import 'package:pesa/src/app/brightness_provider.dart';

class NotificationsScreen extends StatelessWidget {
  final NotificationsService _notificationsService = NotificationsService();

  @override
  Widget build(BuildContext context) {
    final notifications = _notificationsService.fetchNotifications();
    final newNotifications =
        notifications.where((notification) => notification.isNew).toList();
    final readNotifications =
        notifications.where((notification) => !notification.isNew).toList();

    final brightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, color: AppColors.primaryText(brightness)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Text(
              'Notificaciones',
              style: TextStyle(
                color: AppColors.primaryText(brightness),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            CircleAvatar(
              radius: 10,
              backgroundColor: AppColors.accent,
              child: Text(
                '${newNotifications.length}',
                style: TextStyle(
                  color: AppColors.primaryText(brightness),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon:
                Icon(Icons.settings, color: AppColors.primaryText(brightness)),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // New Notifications Section
            if (newNotifications.isNotEmpty)
              _notificationSection('Nuevos', newNotifications, brightness),
            SizedBox(height: 20),

            // Read Notifications Section
            if (readNotifications.isNotEmpty)
              _notificationSection('Leídos', readNotifications, brightness),
          ],
        ),
      ),
    );
  }

  Widget _notificationSection(
      String title,
      List<local_notification.Notification> notifications,
      Brightness brightness) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.primaryText(brightness),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        ...notifications.map((notification) {
          return _notificationCard(notification, brightness);
        }).toList(),
      ],
    );
  }

  Widget _notificationCard(
      local_notification.Notification notification, Brightness brightness) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.cardBackground(brightness),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: AppColors.green,
            size: 24,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: TextStyle(
                    color: AppColors.primaryText(brightness),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  notification.description,
                  style: TextStyle(
                    color: AppColors.secondaryText(brightness),
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notification.date,
                      style: TextStyle(
                        color: AppColors.secondaryText(brightness),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      notification.time,
                      style: TextStyle(
                        color: AppColors.secondaryText(brightness),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.arrow_forward_ios,
              color: AppColors.secondaryText(brightness), size: 16),
        ],
      ),
    );
  }
}
