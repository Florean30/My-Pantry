import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mypantry_app/app/core/widgets/custom_image_picker.dart';

class AddKategoriController extends GetxController {
  // Variable observable
  var namaKategori = ''.obs;
  var imagePath = ''.obs;
  // Instance image picker
  // final ImagePicker picker = ImagePicker();

  // Method untuk mengambil gambar dari galeri
  // Future<void> getImage() async {
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  //   if (image != null) {
  //     imagePath.value = image.path;
  //   }
  // }

  // Method untuk menyimpan kategori
  void saveKategori() {
    if (namaKategori.value.isEmpty) {
      Get.snackbar(
        'Error',
        'Nama kategori tidak boleh kosong',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.back(); // Kembali ke halaman sebelumnya
    Get.snackbar(
      'Sukses',
      'Kategori berhasil ditambahkan',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Method untuk mereset form
  void resetForm() {
    namaKategori.value = '';
    imagePath.value = '';
  }
}
