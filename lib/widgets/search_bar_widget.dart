import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  var searchText = ''.obs;

  void setSearchText(String text) {
    searchText.value = text;
  }

  void performSearch() {
    print("Searching for: ${searchText.value}");
  }
}

class SearchBarWidget extends StatelessWidget {
  final SearchController searchController = Get.put(SearchController());

  SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              onChanged: (value) {
                searchController.setSearchText(value);
              },
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              searchController.performSearch();
            },
          ),
        ],
      ),
    );
  }
}
