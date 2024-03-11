import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import '../../utils/app_enum.dart'; // Đảm bảo đường dẫn đúng tùy theo cấu trúc thư mục dự án của bạn
import 'package:doctor_pet/core/data/pet.dart';
import 'package:doctor_pet/core/data/owner.dart';
import 'package:doctor_pet/views/pet/nested_navigation/nested_navation_pet.dart'; // Đảm bảo đường dẫn đúng
import 'package:doctor_pet/core/data/data_mock/petslist.dart'; // Đảm bảo đường dẫn đến file petslist.dart đúng

class PetController extends GetxController {
  RxInt index = RxInt(0);
  Rx<Role> role = Rx<Role>(Role.customer);

  final customerTabNameList = [
    'Dashboard',
    'Appointment',
    'Medical history',
    'Ask Doctor',
    'Search Clinic',
    'Pet view',
  ];

  void changeTab(int i) => index.value = i;

  List<String> getTabListByRole(Role role) {
    switch (role) {
      case Role.customer:
        return customerTabNameList;
      default:
        return []; // Hoặc trả về một danh sách mặc định nếu không có vai trò nào khớp
    }
  }

  List<Widget> listScreen() {
    return [
      const NestedNavigationPet(),
      // Thêm các screen tương ứng với mỗi tab ở đây
    ];
  }

  var pets = <Pet>[].obs;
  var filteredPets = <Pet>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Sử dụng dữ liệu từ file mockPets
    pets.assignAll(mockPets);
    filteredPets.assignAll(pets);
  }

  void searchPet(String query) {
    if (query.isEmpty) {
      filteredPets.assignAll(pets);
    } else {
      filteredPets.assignAll(
        pets
            .where(
                (pet) => pet.name.toLowerCase().contains(query.toLowerCase()))
            .toList(),
      );
    }
    filteredPets.refresh();
  }
}
