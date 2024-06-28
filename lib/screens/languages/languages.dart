import 'package:e_worker/data/local/storage_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key, required this.onTab});

  final VoidCallback onTab;

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  bool active1=false;
  bool active2=false;
  @override
  void initState() {
    if(StorageRepository.getInt(key: 'value')==1){
      active1=true;
    }
    else{
      active2=true;
    }
    setState(() {});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new,size: 25.sp,),
        ),
        title: Text("language".tr(),style: AppTextStyle.urbanistMedium.copyWith(
          color: AppColors.black,fontSize: 24.sp
        ),),
        centerTitle: true,
      ),
      backgroundColor:Colors.white,
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
                  if(!active1){
                    active1=!active1;
                    active2=false;
                    setState(() {});
                    context.setLocale(const Locale("uz", "UZ"));
                    StorageRepository.setInt(key: "value", value:1);
                    widget.onTab.call();
                  }
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
                  if(!active2){
                    active2=true;
                    active1=false;
                    setState(() {});
                    context.setLocale(const Locale("ru", "RU"));
                    StorageRepository.setInt(key: "value", value:2);
                    widget.onTab.call();
                  }
                },
                leading: Image.network("https://upload.wikimedia.org/wikipedia/en/thumb/f/f3/Flag_of_Russia.svg/1200px-Flag_of_Russia.svg.png",
                    width: 90.w,height:90.h,fit: BoxFit.cover),
              ),
              SizedBox(height: 40.h,),
            ],
          ),
        ),
      ),
    );
  }
}
