import 'package:get/get.dart';

import '../modules/add_category/add_category_binding.dart';
import '../modules/add_category/add_category_page.dart';

class AddCategoryRoutes {
  AddCategoryRoutes._();

  static const addCategory = '/add-category';

  static final routes = [
    GetPage(
      name: addCategory,
      page: () => const AddCategoryPage(),
      binding: AddCategoryBinding(),
    ),
  ];
}
