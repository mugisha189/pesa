import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/src/app/routes.dart';
import 'package:pesa/src/features/notifications/services/notifications_service.dart';
import 'package:pesa/src/features/notifications/models/notification.dart' as local_notification;
import 'package:pesa/src/app/brightness_provider.dart';

class NotificationsScreen extends StatelessWidget {
  final NotificationsService _notificationsService = NotificationsService();

  @override
  Widget build(BuildContext context) {
    final notifications = _notificationsService.fetchNotifications();
    final newNotifications = notifications.where((notification) => notification.isNew).toList();
    final readNotifications = notifications.where((notification) => !notification.isNew).toList();

    final brightness = Theme.of(context).brightness;

    return Scaffold(
      backgroundColor: AppColors.primaryBackground(brightness),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primaryText(brightness)),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: AppColors.primaryBackground(brightness),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Notificaciones',
              style: TextStyle(
                color: AppColors.primaryText(brightness),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 8),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary(brightness),
                    AppColors.secondary(brightness),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(
                  '${newNotifications.length}',
                  style: TextStyle(
                    color: AppColors.primaryBackground(brightness),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: AppColors.primaryText(brightness)),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.settings);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (newNotifications.isNotEmpty)
                _notificationSection('Nuevos', newNotifications, brightness),
              const SizedBox(height: 20),
              if (readNotifications.isNotEmpty)
                _notificationSection('Leídos', readNotifications, brightness),
            ],
          ),
        ),
      ),
    );
  }

  Widget _notificationSection(
    String title,
    List<local_notification.Notification> notifications,
    Brightness brightness,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.secondaryBackground(brightness),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.primaryText(brightness),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15),
          ...notifications.map((notification) {
            return _notificationCard(notification, brightness);
          }).toList(),
        ],
      ),
    );
  }

  Widget _notificationCard(
    local_notification.Notification notification,
    Brightness brightness,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
        color: AppColors.cardBackground(brightness),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: AppColors.primaryBackground(brightness),
                shape: BoxShape.circle),
            child: Icon(
              Icons.check,
              color: AppColors.primaryText(brightness),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: TextStyle(
                    color: AppColors.primaryText(brightness),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  notification.description,
                  style: TextStyle(
                    color: AppColors.primaryText(brightness),
                    fontSize: 13,
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
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      notification.time,
                      style: TextStyle(
                        color: AppColors.secondaryText(brightness),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Icon(Icons.arrow_forward_ios,
              color: AppColors.secondaryText(brightness), size: 16),
        ],
      ),
    );
  }
}
