import 'package:e_worker/bloc/auth/auth_bloc.dart';
import 'package:e_worker/bloc/my_vacancy/my_vacancy_bloc.dart';
import 'package:e_worker/bloc/my_vacancy/my_vacancy_event.dart';
import 'package:e_worker/screens/languages/languages.dart';
import 'package:e_worker/screens/tab_box/profile_screen/update_profile_screen.dart';
import 'package:e_worker/utils/colors/app_colors.dart';
import 'package:e_worker/utils/styles/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_vacancy_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    setState(() {});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("",style: AppTextStyle.urbanistMedium.copyWith(
          color: AppColors.black,fontSize:20
        ),),
      ),
      body:BlocBuilder<AuthBloc,AuthState>(
        builder: (context,state){
          if(state.statusMessage=='loading'){
            return const Center(child: CircularProgressIndicator(),);
          }
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal:31.w,vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text("profile".tr(),style: AppTextStyle.urbanistMedium.copyWith(
                          color: AppColors.black,fontSize: 30.sp
                      ),),
                      SizedBox(height: 20.h,),
                      Icon(Icons.account_circle_rounded,size: 100.sp,),
                      SizedBox(height: 5.h,),
                      Text("ID:${state.userModel.userId}"),
                    ],
                  ),
                ),
                SizedBox(height: 16.h,),
                Text("    ${"name".tr()}:${state.userModel.username}",textAlign:TextAlign.center,style: AppTextStyle.urbanistMedium.copyWith(
                    color: AppColors.black,fontSize:20.sp
                ),),
                SizedBox(height: 20.h,),
                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const UpdateProfileScreen();
                    }));
                  },
                  leading: Icon(Icons.settings,size: 25.sp,),
                  trailing: Icon(Icons.arrow_forward_ios_sharp,size: 25.sp,),
                  title: Text("setting".tr(),style: AppTextStyle.urbanistMedium.copyWith(
                      color: AppColors.black,fontSize:20.sp
                  ),),
                ),
                ListTile(
                  onTap: (){
                    context.read<MyVacancyBloc>().add(MyGetVacancyEvent(userId:context.read<AuthBloc>().state.userModel.userId));
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return const MyVacancyScreen();
                    }));
                  },
                  leading: Icon(Icons.category,size: 25.sp,),
                  trailing: Icon(Icons.arrow_forward_ios_sharp,size: 25.sp,),
                  title: Text("my_vacancies".tr(),style: AppTextStyle.urbanistMedium.copyWith(
                      color: AppColors.black,fontSize:20.sp
                  ),),
                ),
                ListTile(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return LanguagesScreen(
                        onTab: (){
                          setState(() {});
                        },
                      );
                    }));
                  },
                  leading: Icon(Icons.language,size: 25.sp,),
                  trailing: Icon(Icons.arrow_forward_ios_sharp,size: 25.sp,),
                  title: Text("language".tr(),style: AppTextStyle.urbanistMedium.copyWith(
                      color: AppColors.black,fontSize:20.sp
                  ),),
                ),
              ],
            ),
          );
        },
      )
    );
  }
}
