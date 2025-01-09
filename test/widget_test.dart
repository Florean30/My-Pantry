// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_pantry/main.dart';

void main() {
  // Mendefinisikan test case untuk mengecek fungsi penambahan counter
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Membangun widget aplikasi dan memicu frame pertama
    await tester.pumpWidget(const MyApp());

    // Memverifikasi bahwa counter awalnya menampilkan angka '0'
    // findsOneWidget memastikan teks '0' ditemukan tepat satu kali
    expect(find.text('0'), findsOneWidget);
    // Memastikan teks '1' belum muncul di layar
    expect(find.text('1'), findsNothing);

    // Mensimulasikan tap/ketukan pada icon tambah
    await tester.tap(find.byIcon(Icons.add));
    // Memicu frame baru untuk memperbarui UI setelah tap
    await tester.pump();

    // Memverifikasi bahwa counter telah bertambah
    // Memastikan teks '0' sudah tidak ada di layar
    expect(find.text('0'), findsNothing);
    // Memastikan teks '1' sekarang muncul tepat satu kali
    expect(find.text('1'), findsOneWidget);
  });
}
