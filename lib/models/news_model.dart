import 'package:intl/intl.dart';

class NewsModel{
  String? name;
  String? image;
  String? description;
  final String date;
  final String url;



  NewsModel(   {required this.url, required this.date,required this.description,required this.name,required this.image});
  factory NewsModel.fromJson (Map<String,dynamic> json){

    return NewsModel(description: json['description'], name: json['title'], image: json['urlToImage'], date: DateFormat('yyyy-MM-dd  h:m').format(DateFormat("yyyy-MM-ddTh:m:sz").parse(json['publishedAt'])), url: json['url']);
  }

}