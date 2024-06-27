import 'package:e_worker/utils/images/app_images.dart';
import 'package:flutter/material.dart';

import '../../data/local/storage_repository.dart';
import '../language/choose_language_screen.dart';
import '../tab_box/tab_box_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  init()async{
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
      return (StorageRepository.getBool(key: "isEnter"))?const TabBoxScreen():const ChooseLanguage();
    }));
  }
  @override
  void initState() {
    init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade400,
      body: Image.asset(AppImages.fon,width:double.infinity,height: double.infinity,),
    );
  }
}
