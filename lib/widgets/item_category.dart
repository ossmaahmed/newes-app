import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/category_screen.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({super.key, required this.model});

  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 4,vertical: 15),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(model: model),));
        },
        child: Container(
          width: 200,
          height: 150,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(15),
              image: DecorationImage(
                  image: AssetImage(model.image), fit: BoxFit.cover)),
          child: Text(
            model.name,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
