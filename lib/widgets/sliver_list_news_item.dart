import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit/news_cubit.dart';
import 'package:news_app/widgets/news_item.dart';
import 'package:news_app/widgets/no_news.dart';

class ListNewsItemAndCircleIndicator extends StatelessWidget {
  const ListNewsItemAndCircleIndicator({
    super.key,
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getNews(
          category: category,
        ),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetNewsLoadingState) {
            return const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            );
          }
          if (state is GetNewsSuccessState) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => NewsItem(
                  model: NewsCubit.get(context).newsList[index],
                ),
                childCount: NewsCubit.get(context).newsList.length,
              ),
            );
          }
          if (state is GetNewsErrorState) {
            return const NoNews();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
