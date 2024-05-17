import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/news_service.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<NewsModel> newsList = [];

  late String val;

  getNews({required String category}) async {
    try {
      emit(GetNewsLoadingState());
      newsList =
      await NewsService().getHttp(category: category,);
      emit(GetNewsSuccessState());
    } catch (e) {
      log(e.toString());
      emit(GetNewsErrorState());
    }
  }


}
