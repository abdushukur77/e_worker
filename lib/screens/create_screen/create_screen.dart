import 'package:e_worker/screens/create_screen/widgets/first_vacancy_page.dart';
import 'package:e_worker/screens/create_screen/widgets/location.dart';
import 'package:e_worker/screens/create_screen/widgets/yonalish_turi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: const Text("Create Screen"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            FirstVacancyPage(),
            LocationWidget(),
          ],
        ),
      ),
    );
  }
}
