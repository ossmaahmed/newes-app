import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/sliver_list_news_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.model});

  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
            title:Text(model.name),

        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 12),
          child: CustomScrollView(
            slivers: [
                ListNewsItemAndCircleIndicator(
                  category: model.name,
                ),

            ],
          ),
        ));
  }
}




