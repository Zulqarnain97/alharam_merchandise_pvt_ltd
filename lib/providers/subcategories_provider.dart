import '../models/categories.dart';
import '../models/subcategories.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class SubCategoriesProvider with ChangeNotifier {
  List<SubCategories> _subcat = [];

  List<SubCategories> get subcat {
    return [..._subcat];
  }

  List<SubCategories> findByid(String id) {
    var a = _subcat.where((e) => e.categories.contains(id));
    print('given id = $id');

    a.forEach((element) {
      // print(element.id);
      // print(element.name);
      // print(element.reps);
      // print(element.workouts);
    });
    return a.toList();
  }

  Future<void> sendCategoryId(String id) async {
    const url = 'https://admin.alharammerchandisepvtltd.com/api/vehicle/index';

    try {
      final response = await http.post(url,
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
          },
          body: jsonEncode({
            'id': int.parse(id),
          }));
      var data = json.decode(response.body);
      print('printing post');
      print(data);
      final List<SubCategories> loadedProducts = [];
      data.forEach((prodData) {
        loadedProducts.add(SubCategories(
          id: prodData['id'].toString(),
          title: prodData['title'],
          image: 'https://admin.alharammerchandisepvtltd.com/storage/images/' + prodData['image'],
          price: prodData['price'],
          description: prodData['description'],
          engine_cap: prodData['engine_cap'],
          seat_cap: prodData['seat_cap'],
          doors: prodData['doors'],
          fuel_type: prodData['fuel_type'],
          transm_type: prodData['transm_type'],
          version: prodData['version'],
          colours: prodData['colours'],
        ));
      });
      _subcat = loadedProducts;
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
