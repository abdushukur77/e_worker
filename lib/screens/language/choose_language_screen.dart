import 'package:e_worker/data/local/storage_repository.dart';
import 'package:e_worker/screens/tab_box/tab_box_screen.dart';
import 'package:e_worker/utils/colors/app_colors.dart';
import 'package:e_worker/utils/styles/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({super.key});

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  bool active1=false;
  bool active2=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.deepPurple,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                trailing:Radio(value:true, groupValue:active1, onChanged:(v){
                },),
                title: Text("Uzbek",style: AppTextStyle.urbanistMedium.copyWith(
                  color: AppColors.black,fontSize: 20.sp
                ),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r)
                ),
                contentPadding:EdgeInsets.symmetric(horizontal:8.w,vertical: 8.h),
                tileColor: Colors.grey,
                onTap: (){
                  active1=!active1;
                  active2=false;
                  setState(() {});
                  context.setLocale(const Locale("uz", "UZ"));
                },
                leading:Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Flag_of_Uzbekistan.svg/1280px-Flag_of_Uzbekistan.svg.png",
                  width: 90.w,height:90.h,fit: BoxFit.cover,),
              ),
              SizedBox(height: 20.h,),
              ListTile(
                trailing:Radio(value:true, groupValue:active2, onChanged:(v){
                },),
                title: Text("Русский",style: AppTextStyle.urbanistMedium.copyWith(
                    color: AppColors.black,fontSize: 20.sp
                ),),
                tileColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r)
                ),
                contentPadding:EdgeInsets.symmetric(horizontal:8.w,vertical: 8.h),
                onTap: (){
                  active2=true;
                  active1=false;
                  setState(() {});
                  context.setLocale(const Locale("ru", "RU"));
                },
                leading: Image.network("https://upload.wikimedia.org/wikipedia/en/thumb/f/f3/Flag_of_Russia.svg/1200px-Flag_of_Russia.svg.png",
                    width: 90.w,height:90.h,fit: BoxFit.cover),
              ),
              SizedBox(height: 40.h,),
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed:(){
                  StorageRepository.setBool(key: "isEnter", value:true);
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
                    return const TabBoxScreen();
                  }));
                },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r)
                      )
                    ),
                    child:Text("Start",style: AppTextStyle.urbanistMedium.copyWith(
                  color: AppColors.white,fontSize: 20.sp
                ),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
