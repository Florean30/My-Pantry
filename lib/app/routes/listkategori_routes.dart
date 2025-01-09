import 'package:get/get.dart';
import '../modules/listkategori/listkategori_binding.dart';
import '../modules/listkategori/listkategori_page.dart';

class ListkategoriRoutes {
  ListkategoriRoutes._();

  static const listkategori = '/listkategori';

  static final routes = [
    GetPage(
      name: listkategori,
      page: () => const ListkategoriPage(),
      binding: ListkategoriBinding(),
    ),
  ];
}
