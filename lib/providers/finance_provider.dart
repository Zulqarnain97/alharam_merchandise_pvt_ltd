import '../models/finance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class FinanceProvider with ChangeNotifier {
  List<Finance> _fin = [];

  List<Finance> get fin {
    return [..._fin];
  }

  Finance findByid(String id) {
    return _fin.firstWhere((w) => w.id == id);
  }

  void addFinanceCategory() {
    //_wouts.add(value);
    notifyListeners();
  }

  Future<bool> fetchAndSetFinance() async {
    const url = 'https://admin.alharammerchandisepvtltd.com/api/finance/index';
    //https://admin.alharammerchandisepvtltd.com/api/finance/index

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

      final List<Finance> loadedProducts = [];
      extractedData.forEach((prodData) {
        loadedProducts.add(Finance(
          id: prodData['id'].toString(),
          title: prodData['title'],
          description: prodData['description'],
          tenure_years: prodData['tenure_year'],
          total_amount: prodData['total_amount'],
          no_of_installments: prodData['installments'],
          installment_duration: prodData['instal_duration'],
        ));
      });

      print('now printing my model data');
      loadedProducts.forEach((element) {
        print(element.id);

        print(element.title);
        print(element.description);
        print(element.tenure_years);
        print(element.total_amount);
        print(element.no_of_installments);
        print(element.installment_duration);


      });
      _fin = loadedProducts;
      notifyListeners();
      return true;
    } catch (error) {
      return false;
    }
  }
}
