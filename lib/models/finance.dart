import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Finance with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final int tenure_years;
  final int total_amount;
  final int no_of_installments;
  final int  installment_duration;


  Finance({this.id, this.title, this.description, this.tenure_years, this.total_amount, this.no_of_installments, this.installment_duration });
}

