import 'package:flutter/material.dart';
import 'package:mypantry_app/app/core/extensions/date_time_ext.dart';
import 'package:mypantry_app/app/data/models/kelola/aktivitas_kelola.dart';
import 'package:mypantry_app/app/data/models/kelola/penyimpanan_kelola.dart';
import 'package:mypantry_app/app/data/models/kelola/jumlah_kelola.dart';

class CustomDropdownKelolaItem extends StatefulWidget {
  const CustomDropdownKelolaItem({super.key});

  @override
  CustomDropdownKelolaItemState createState() => CustomDropdownKelolaItemState();
}

class CustomDropdownKelolaItemState extends State<CustomDropdownKelolaItem> {
  final TextEditingController activityController = TextEditingController();
  final TextEditingController activityDateController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController storageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dropdown Aktivitas
        buildDropdownField(
          controller: activityController,
          label: 'Aktivitas',
          onTap: () => showDropdownDialog(
            title: 'Pilih Aktivitas',
            items: Activity.values.map((e) => e.name).toList(),
            controller: activityController,
          ),
        ),
        const SizedBox(height: 16),

 // Activity Date
        TextFormField(
          controller: activityDateController,
          decoration: InputDecoration(
            labelText: 'Tanggal Aktivitas',
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  activityDateController.text = pickedDate.toFormattedDate();
                }
              },
            ),
          ),
          readOnly: true,
        ),
        const SizedBox(height: 16),

        // Expire Date
        TextFormField(
          controller: expiryDateController,
          decoration: InputDecoration(
            labelText: 'Tanggal Kadaluwarsa',
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  expiryDateController.text = pickedDate.toFormattedDate();
                }
              },
            ),
          ),
          readOnly: true,
        ),
        const SizedBox(height: 16),

        // Dropdown Quantity
        buildDropdownField(
          controller: quantityController,
          label: 'Quantity',
          onTap: () => showDropdownDialog(
            title: 'Pilih Quantity',
            items: List.generate(10, (index) => (index + 1).toString()),
            controller: quantityController,
          ),
        ),
        const SizedBox(height: 16),

         // Dropdown Quantity
        buildDropdownField(
          controller: quantityController,
          label: 'Quantity',
          onTap: () => showDropdownDialog(
            title: 'Pilih Quantity',
            items: Quantity.values.map((e) => e.name).toList(),
            controller: quantityController,
          ),
        ),
        const SizedBox(height: 16),

        // Dropdown Storage
        buildDropdownField(
          controller: storageController,
          label: 'Storage',
          onTap: () => showDropdownDialog(
            title: 'Pilih Storage',
            items: Storage.values.map((e) => e.name).toList(),
            controller: storageController,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget buildDropdownField({
    required TextEditingController controller,
    required String label,
    required VoidCallback onTap,
  }) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            enabled: false,
            decoration: InputDecoration(
              labelText: label,
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        IconButton(
          icon: Image.asset('assets/images/icon/select.png'),
          onPressed: onTap,
        ),
      ],
    );
  }

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