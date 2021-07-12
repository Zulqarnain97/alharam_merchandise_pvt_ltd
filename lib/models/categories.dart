import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Categories with ChangeNotifier{
  final String id;
  final String title;
  final String image;


  Categories({this.id, this.title, this.image, });
}

// final categories=[
//   Categories(
//     id: 'cat1',
//     name: 'Cars',
//     image: 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2Fyc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
//
//   ),
//   Categories(
//     id: 'cat2',
//     name: 'Trucks',
//     image: 'https://images.unsplash.com/photo-1501700493788-fa1a4fc9fe62?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8dHJ1Y2tzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
//
//   ),
//   Categories(
//     id: 'cat3',
//     name: 'Buses',
//     image: 'https://images.unsplash.com/photo-1564694202883-46e7448c1b26?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8YnVzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
//
//   ),
//   Categories(
//       id: 'cat4',
//       name: 'Tracktor',
//       image: 'https://images.unsplash.com/photo-1530258360041-fc0d691242b9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8dHJhY2t0b3J8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
//
//   )
//
// ];