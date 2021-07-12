import '../models/categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoriesProvider with ChangeNotifier {
  List<Categories> _cats = [];

  List<Categories> get cats {
    return [..._cats];
  }

  Categories findByid(String id) {
    return _cats.firstWhere((w) => w.id == id);
  }

  void addCategory() {
    //_wouts.add(value);
    notifyListeners();
  }

  Future<bool> fetchAndSetCategories() async {
    const url = 'https://admin.alharammerchandisepvtltd.com/api/vehiclecat/index';

    try {
      final response = await http.get(url);
      print(json.decode(response.body));
      final extractedData =
          json.decode(response.body) as List<dynamic>; // Map<String, dynamic>;
      print('after parsing $extractedData');
      print(extractedData);
      if (extractedData == null) {
        return false;
      }

      final List<Categories> loadedProducts = [];
      extractedData.forEach((prodData) {
        loadedProducts.add(Categories(
          id: prodData['id'].toString(),
          title: prodData['title'],
          image: 'https://admin.alharammerchandisepvtltd.com/storage/images/' + prodData['image'],
        ));
      });
      /*
      extractedData.forEach((id, prodData) {
        loadedProducts.add(CategoryMeal(
          id: id,
          cat_id: prodData['cat_id'],
          title: prodData['title'],
          imagePath: prodData['image'],
          description: prodData['description'],
        ));
      });

       */
      print('now printing my model data');
      loadedProducts.forEach((element) {
        print(element.id);

        print(element.title);
        print(element.image);
      });
      _cats = loadedProducts;
      notifyListeners();
      return true;
    } catch (error) {
      return false;
    }
  }
}
