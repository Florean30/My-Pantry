import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ActivityController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> downloadActivityPDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            children: [
              pw.Text('Daftar Aktivitas', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 20),
              // Tambahkan data aktivitas di sini
              // Contoh:
              pw.Container(
                child: pw.Column(
                  children: [
                    _buildActivityRow('Bumbu Kering', 'Garam', 'Belanja', '30/12/2024', '12 Pcs'),
                    // Tambahkan baris aktivitas lainnya
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );

    // Mendapatkan direktori untuk menyimpan file
    final dir = await getExternalStorageDirectory();
    final file = File('${dir?.path}/aktivitas.pdf');

    // Menyimpan file PDF
    await file.writeAsBytes(await pdf.save());

    // Menampilkan snackbar berhasil
    Get.snackbar(
      'Berhasil',
      'File PDF telah diunduh ke ${file.path}',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  pw.Widget _buildActivityRow(String kategori, String nama, String aktivitas, String tanggal, String jumlah) {
    return pw.Container(
      padding: pw.EdgeInsets.all(8),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(kategori, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 5),
          pw.Row(children: [pw.Text('Nama: $nama')]),
          pw.Row(children: [pw.Text('Aktivitas: $aktivitas')]),
          pw.Row(children: [pw.Text('Tanggal: $tanggal')]),
          pw.Row(children: [pw.Text('Jumlah: $jumlah')]),
        ],
      ),
    );
  }
}
