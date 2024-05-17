import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/change_theme_cubit/change_them_cubit.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/widgets/web_view.dart';

class NewsItem extends StatelessWidget {
    const NewsItem({super.key, required this.model});
  final NewsModel model ;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeThemCubit, ChangeThemState>(
  builder: (context, state) {
    return Padding(
      padding:  const EdgeInsetsDirectional.only(top: 22),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => WebView(url: model.url),));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl:model.image ?? 'https://t3.ftcdn.net/jpg/01/91/95/30/360_F_191953033_gehQATeDoh5z6PyRDbeKyBZuS83CjMEF.jpg',
              placeholder: (context, url) =>  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>  const Icon(Icons.error),
            ),
             const SizedBox(height: 12,),
            Text(model.name ?? '',maxLines: 2,style:  TextStyle(
              color:ChangeThemCubit.get(context).isLight == true ?  Colors.white : Colors.black,
              overflow: TextOverflow.ellipsis,
            ),),
             const SizedBox(height: 12,),
            Text(model.description ?? '',maxLines: 2,style:  const TextStyle(
              color: Colors.grey,
              overflow: TextOverflow.ellipsis,
            ),),
             const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(model.date,style:  const TextStyle(
                  color: Colors.grey,
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  },
);
  }
}
