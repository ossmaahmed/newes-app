import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/services/news_service.dart';

import '../../models/news_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());
  static SearchCubit get (context) => BlocProvider.of(context);

  List<NewsModel> newsList = [];


  getNewsSearch({required String value})async{

    try {
      emit(SearchLoadingState());
      newsList = await NewsService().getHttpSearch(search: value);
      emit(SearchSuccessState());
    } catch (e) {
      log(e.toString());
      emit(SearchErrorState());
    }

  }


}
