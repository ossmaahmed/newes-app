import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/check_internet/check_internet_cubit.dart';
import 'package:news_app/cubit/news_search_cubit/search_cubit.dart';
import 'package:news_app/widgets/custom_text_form_filed.dart';
import 'package:news_app/widgets/sliver_list_search_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocBuilder<SearchCubit, SearchStates>(
        builder: (context, state) {
          return BlocBuilder<CheckInternetCubit, CheckInternetState>(
            builder: (context, states) {
              return Scaffold(
                  appBar: AppBar(),
                  body: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CustomScrollView(
                      slivers: [
                        const SliverToBoxAdapter(
                          child: SizedBox(
                            height: 20,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: CustomFormFiled(
                            label: 'Search',
                            onChanged: (value) {
                              SearchCubit.get(context)
                                  .getNewsSearch(value: value);
                            },
                          ),
                        ),
                        if (state is SearchInitialState)
                          const SliverFillRemaining(
                              child: Center(
                                  child: Text(
                                    'Search about any new',
                                    style: TextStyle(fontSize: 20),
                                  ))),
                        if (state is SearchLoadingState)
                          const SliverFillRemaining(
                              child:
                              Center(child: CircularProgressIndicator())),
                        if (state is SearchSuccessState) const ListSearchItem(),

                        if (state is SearchErrorState)
                          const SliverToBoxAdapter(
                            child: SizedBox(height: 100,),
                          ),

                          if (state is SearchErrorState)
                          const SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.error,color: Colors.red,),
                                  Expanded(
                                    child: Text(
                                      'Oops, there is an error, please try again ',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        if (states is NotConnectedState)
                          const SliverToBoxAdapter(
                            child: SizedBox(height: 50,),
                          ),

                        if (states is NotConnectedState)
                          const SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.error,color: Colors.red,),
                                  Expanded(
                                    child: Text(
                                      'Check your internet ',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ));
            },
          );
        },
      ),
    );
  }
}
