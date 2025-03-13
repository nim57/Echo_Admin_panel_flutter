import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var DataList = <Map<String, String>>[].obs;
  var filterdDataList = <Map<String, String>>[].obs;
  RxList<bool> selectedRow = <bool>[].obs;
  RxInt sortColumnIndex = 1.obs;
  RxBool sortAscending = true.obs;
  final SearchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchDummyData();
  }

  void sortById(int sortColumnIndex, bool ascending) {
    sortAscending.value = ascending;
    filterdDataList.sort((a, b) {
      if (ascending) {
        return filterdDataList[0]['Column']
            .toString()
            .toLowerCase()
            .compareTo(filterdDataList[0]['Column'].toString().toLowerCase());
      } else {
        return filterdDataList[0]['Column']
            .toString()
            .toLowerCase()
            .compareTo(filterdDataList[0]['Column'].toString().toLowerCase());
      }
    });
    this.sortColumnIndex.value = sortColumnIndex;
  }

  void searchQuary(String query) {
    filterdDataList.assignAll(DataList.where(
        (item) => item['Column1']!.contains(query.toLowerCase())));
  }

  void fetchDummyData() {
    selectedRow.assignAll(List.generate(36, (index) => false));

    DataList.addAll(List.generate(
        36,
        (index) => {
              'Column1': 'Data ${index + 1} -1',
              'Column2': 'Data ${index + 1} -2',
              'Column3': 'Data ${index + 1} -3',
              'Column4': 'Data ${index + 1} -4',
            }));

    filterdDataList.addAll(List.generate(
        36,
        (index) => {
              'Column1': 'Data ${index + 1} -1',
              'Column2': 'Data ${index + 1} -2',
              'Column3': 'Data ${index + 1} -3',
              'Column4': 'Data ${index + 1} -4',
            }));
  }
}
