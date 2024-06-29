import 'package:e_worker/bloc/auth/auth_bloc.dart';
import 'package:e_worker/bloc/image/image_bloc.dart';
import 'package:e_worker/bloc/vacancy/vacancy_bloc.dart';
import 'package:e_worker/bloc/vacancy/vacancy_event.dart';
import 'package:e_worker/screens/create_screen/create_screen.dart';
import 'package:e_worker/screens/tab_box/home_screen/home_screen.dart';
import 'package:e_worker/screens/tab_box/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.black,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            context.read<VacancyBloc>().add(ChangeToInitialState());
            context.read<ImageBloc>().add(ChangeInitialState());
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const CreateScreen();
            }));
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
