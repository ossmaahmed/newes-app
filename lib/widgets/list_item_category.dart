import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/item_category.dart';

class ListItemCategory extends StatelessWidget {
  const ListItemCategory({super.key});

  final List<CategoryModel> categoryList = const[
    CategoryModel(name: 'Business', image: 'assets/business.avif'),
    CategoryModel(name: 'Entertainment', image: 'assets/entertaiment.avif'),
    CategoryModel(name: 'Health', image: 'assets/health.avif'),
    CategoryModel(name: 'Science', image: 'assets/science.avif'),
    CategoryModel(name: 'Sports', image: 'assets/sports.avif'),
    CategoryModel(name: 'Technology', image: 'assets/technology.jpeg'),
    CategoryModel(name: 'General', image: 'assets/general.avif'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:150 ,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) => ItemCategory(model: categoryList[index]),),
    );
  }
}
