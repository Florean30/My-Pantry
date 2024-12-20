import 'package:flutter/material.dart';
import 'package:mypantry_app/app/core/widgets/custom_sayuran_item.dart';

class VegetableList extends StatelessWidget {
  final List<SayuranItem> vegetables = [
    SayuranItem(name: 'Kangkung'),
    SayuranItem(name: 'Kacang panjang'),
    SayuranItem(name: 'Kacang buncis'),
    SayuranItem(name: 'Putren'),
    SayuranItem(name: 'Daun singkong'),
    SayuranItem(name: 'Labu siam'),
    SayuranItem(name: 'Terong'),
    SayuranItem(name: 'Leunca'),
    SayuranItem(name: 'Daun pepaya'),
    SayuranItem(name: 'Kailan'),
    SayuranItem(name: 'Nangka muda'),
    SayuranItem(name: 'Pare'),
    SayuranItem(name: 'Jantung pisang'),
    SayuranItem(name: 'Oyong'),
    SayuranItem(name: 'Pepaya muda'),
    SayuranItem(name: 'Pakis'),
    SayuranItem(name: 'Jengkol'),
    SayuranItem(name: 'Bayam'),
    SayuranItem(name: 'Katu'),
    SayuranItem(name: 'Kentang'),
    SayuranItem(name: 'Jagung'),
    SayuranItem(name: 'Daun bawang'),
    SayuranItem(name: 'Wortel'),
    SayuranItem(name: 'Kobis'),
    SayuranItem(name: 'Cesim'),
    SayuranItem(name: 'Pakcoy'),
    SayuranItem(name: 'Kecambah'),
    SayuranItem(name: 'Touge'),
    SayuranItem(name: 'Daun jeruk'),
    SayuranItem(name: 'Tomat'),
  ];

  VegetableList({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 480),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        itemCount: vegetables.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: index == 0 ? 0 : 15),
            child: VegetableItemWidget(vegetable: vegetables[index]),
          );
        },
      ),
    );
  }
}