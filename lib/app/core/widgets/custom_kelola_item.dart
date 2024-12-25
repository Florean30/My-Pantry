import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypantry_app/app/core/extensions/date_time_ext.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'package:mypantry_app/app/data/models/kelola/aktivitas_kelola.dart';
import 'package:mypantry_app/app/data/models/kelola/penyimpanan_kelola.dart';

// Widget untuk menampilkan dropdown form pengelolaan item
class CustomDropdownKelolaItem extends StatefulWidget {
  const CustomDropdownKelolaItem({super.key});

  @override
  CustomDropdownKelolaItemState createState() =>
      CustomDropdownKelolaItemState();
}

class CustomDropdownKelolaItemState extends State<CustomDropdownKelolaItem> {
  // Controller untuk mengelola input dari setiap field
  final TextEditingController activityController = TextEditingController();
  final TextEditingController activityDateController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController storageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightgreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul kategori item
            const Text(
              "Sayuran",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15),

            // Menampilkan nama item
            const Row(
              children: [
                Expanded(child: Text('Nama')),
                Text(':'),
                Expanded(child: Text(' Tomat')),
                SizedBox(width: 20)
              ],
            ),
            const SizedBox(height: 4.0),

            // Dropdown untuk memilih aktivitas
            buildDropdownField(
              controller: activityController,
              label: 'Aktivitas',
              onTap: () => showDropdownDialog(
                title: 'Pilih Aktivitas',
                items: Activity.values.map((e) => e.name).toList(),
                controller: activityController,
              ),
            ),
            const SizedBox(height: 4.0),

            // Field untuk memilih tanggal aktivitas
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Tanggal Aktivitas',
                  ),
                ),
                const Text(':'),
                Expanded(
                  child: Text(" ${activityDateController.text}"),
                ),
                InkWell(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: AppColors.orange,
                              onPrimary: Colors.white,
                              onSurface: Colors.black,
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor: AppColors.orange,
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (pickedDate != null) {
                      activityDateController.text =
                          pickedDate.toFormattedDate();
                    }
                  },
                  child: Image.asset(
                    'assets/images/icon/select.png',
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4.0),

            // Field untuk memilih tanggal kadaluwarsa
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Kadaluwarsa',
                  ),
                ),
                const Text(':'),
                Expanded(
                  child: Text(" ${expiryDateController.text}"),
                ),
                InkWell(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: AppColors.orange,
                              onPrimary: Colors.white,
                              onSurface: Colors.black,
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor: AppColors.orange,
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (pickedDate != null) {
                      expiryDateController.text = pickedDate.toFormattedDate();
                    }
                  },
                  child: Image.asset(
                    'assets/images/icon/select.png',
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4.0),

            // Dropdown untuk memilih kuantitas dengan enum Quantity
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Jumlah",
                  ),
                ),
                const SizedBox(width: 52.0),
                const Text(':'),
                const Expanded(
                  child: Text(" 1"),
                ),
                Material(
                  elevation: 2,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.remove,
                          size: 12.0,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        1.toString(),
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 8.0),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.add,
                          size: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4.0),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/icon/select.png',
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 4.0),

            // Dropdown untuk memilih tempat penyimpanan
            buildDropdownField(
              controller: storageController,
              label: 'Penyimpanan',
              onTap: () => showDropdownDialog(
                title: 'Pilih Storage',
                items: Storage.values.map((e) => e.name).toList(),
                controller: storageController,
              ),
            ),

            // Tombol Save
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: const Size(61, 26),
                  ),
                  child: const Text(
                    'Hapus',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: const Size(61, 26),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget helper untuk membuat field dropdown yang dapat dikustomisasi
  Widget buildDropdownField({
    required TextEditingController controller,
    required String label,
    required VoidCallback onTap,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
          ),
        ),
        const SizedBox(width: 1.0),
        const Text(':'),
        Expanded(
          child: Text(" ${controller.text}"),
        ),
        InkWell(
          onTap: onTap,
          child: Image.asset(
            'assets/images/icon/select.png',
            width: 20,
            height: 20,
          ),
        ),
      ],
    );
  }

  // Fungsi untuk menampilkan dialog dropdown
  void showDropdownDialog({
    required String title,
    required List<String> items,
    required TextEditingController controller,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SizedBox(
            width: double.minPositive,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(items[index]),
                  onTap: () {
                    controller.text = items[index];
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
