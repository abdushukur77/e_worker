
import 'package:e_worker/bloc/my_vacancy/my_vacancy_bloc.dart';
import 'package:e_worker/bloc/places/search_bloc.dart';
import 'package:e_worker/bloc/places/search_event.dart';
import 'package:e_worker/data/local/storage_repository.dart';
import 'package:e_worker/data/repository/my_vacancy_repository.dart';
import 'package:e_worker/screens/language/choose_language_screen.dart';
import 'package:e_worker/screens/splash_screen/splash_screen.dart';
import 'package:e_worker/screens/tab_box/tab_box_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/category/categories_bloc.dart';
import '../bloc/category/categories_event.dart';
import '../bloc/image/image_bloc.dart';
import '../bloc/my_vacancy/my_vacancy_event.dart';
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
        RepositoryProvider(
          create: (_) => MyVacancyRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ImageBloc()),
          BlocProvider(create: (context) => CountryBloc()..add(GetAllCountry())),
          BlocProvider(
            create: (context) => VacancyBloc(
              vacancyRepository: context.read<VacancyRepository>(),
            )..add(
              GetVacancyEvent(),
            ),
          ),
          BlocProvider(
            create: (context) => MyVacancyBloc(
              myVacancyRepository: context.read<MyVacancyRepository>(),
            )..add(
              MyGetVacancyEvent(),
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
              locale: context.locale,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
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
          child:const SplashScreen()
        ),
      ),
    );
  }
}
