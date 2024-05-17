import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/check_internet/check_internet_cubit.dart';
import 'package:news_app/screens/search_screen.dart';
import 'package:news_app/widgets/change_mode.dart';
import 'package:news_app/widgets/list_item_category.dart';
import 'package:news_app/widgets/sliver_list_news_item.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckInternetCubit, CheckInternetState>(
      listener: (context, state) {
        if (state is ConnectedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text(state.message),
          ));
        }
        if (state is NotConnectedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(state.message),
          ));
        }
      },
      builder: (context, states) {
        return Scaffold(
          appBar: AppBar(
            title: const Row(
              children: [
                Text('News'),
                Text(
                  'Cloud',
                  style: TextStyle(color: Colors.yellow),
                )
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 12),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchScreen(),
                          ));
                    },
                    icon: const Icon(Icons.search)),
              ),
              const ChangeMode(),
            ],
          ),
          body: const Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 12),
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: ListItemCategory(),
                ),
                ListNewsItemAndCircleIndicator(
                  category: 'General',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
