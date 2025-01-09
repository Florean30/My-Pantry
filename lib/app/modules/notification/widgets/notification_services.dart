import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Widget untuk mengelola layanan notifikasi
class NotificationService {
  // Membuat instance dari FlutterLocalNotificationsPlugin
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Inisialisasi Notification Service
  static Future<void> initialize() async {
    // Membuat instance baru untuk konfigurasi notifikasi
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    // Meminta izin notifikasi untuk platform Android
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    // Konfigurasi pengaturan awal untuk Android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // Menggabungkan pengaturan untuk semua platform
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    // Menginisialisasi plugin notifikasi dengan pengaturan yang telah dibuat
    await _notificationsPlugin.initialize(initializationSettings);
  }

  // Method untuk menampilkan notifikasi
  static Future<void> showNotification({
    required int id, // ID unik untuk notifikasi
    required String title, // Judul notifikasi
    required String body, // Isi/konten notifikasi
  }) async {
    // Konfigurasi detail notifikasi untuk Android
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'default_channel_id', // ID channel notifikasi
      'Default Channel', // Nama channel notifikasi
      channelDescription:
          'This is the default notification channel', // Deskripsi channel
      importance: Importance.max, // Tingkat kepentingan notifikasi
      priority: Priority.high, // Prioritas notifikasi
    );

    // Menggabungkan konfigurasi untuk semua platform
    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    // Menampilkan notifikasi dengan parameter yang diberikan
    await _notificationsPlugin.show(
      id,
      title,
      body,
      platformDetails,
    );
  }
}
