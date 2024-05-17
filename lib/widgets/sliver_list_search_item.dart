import 'package:flutter/material.dart';
import 'package:news_app/cubit/news_search_cubit/search_cubit.dart';
import 'package:news_app/widgets/news_item.dart';

class ListSearchItem extends StatelessWidget {
  const ListSearchItem({super.key,});



  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) =>
            NewsItem(
              model: SearchCubit.get(context).newsList[index],
            ),
        childCount: SearchCubit.get(context).newsList.length,
      ),
    );
  }
}
