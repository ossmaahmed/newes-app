import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cache_helper.dart';
import 'package:news_app/cubit/bloc_observer.dart';
import 'package:news_app/cubit/change_theme_cubit/change_them_cubit.dart';
import 'package:news_app/cubit/check_internet/check_internet_cubit.dart';
import 'package:news_app/screens/news_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  dynamic isLight = CacheHelper.getSaveData(key: 'mode');
  if (kDebugMode) {
    print(isLight);
  }
  runApp(MyApp(
    isLight: isLight,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLight});

  final dynamic isLight;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ChangeThemCubit()..changeMode(fromShared: isLight),
        ),
        BlocProvider(
          create: (context) => CheckInternetCubit()..checkConnection(),
        ),


      ],
      child: BlocBuilder<ChangeThemCubit, ChangeThemState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            themeMode: ChangeThemCubit.get(context).isLight == true
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
