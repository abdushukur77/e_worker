
import 'package:e_worker/screens/tab_box/tab_box_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/category/categories_bloc.dart';
import '../bloc/category/categories_event.dart';
import '../bloc/image/image_bloc.dart';
import '../bloc/vacancy/vacancy_bloc.dart';
import '../bloc/vacancy/vacancy_event.dart';
import '../data/repository/category_repository.dart';
import '../data/repository/vacancy_repository.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => CategoriesRepository(),
        ),
        RepositoryProvider(
          create: (_) => VacancyRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ImageBloc()),
          BlocProvider(
            create: (context) => VacancyBloc(
              vacancyRepository: context.read<VacancyRepository>(),
            )..add(
              GetVacancyEvent(),
            ),
          ),
          BlocProvider(
            create: (context) => CategoriesBloc(
                categoriesRepository: context.read<CategoriesRepository>())
              ..add(GetCategories()),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(428, 926),
          builder: (context, child) {
            ScreenUtil.init(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.transparent)),
                useMaterial3: true,
              ),
              home: child,
            );
          },
          child: const TabBoxScreen(),
        ),
      ),
    );
  }
}
