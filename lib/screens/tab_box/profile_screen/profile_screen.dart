import 'package:e_worker/utils/colors/app_colors.dart';
import 'package:e_worker/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("",style: AppTextStyle.urbanistMedium.copyWith(
          color: AppColors.black,fontSize:20
        ),),
      ),
      body:Padding(
        padding:  EdgeInsets.symmetric(horizontal:31.w,vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text("Profile",style: AppTextStyle.urbanistMedium.copyWith(
                      color: AppColors.black,fontSize: 30.sp
                  ),),
                  SizedBox(height: 20.h,),
                  Icon(Icons.account_circle_rounded,size: 100.sp,),
                ],
              ),
            ),
            SizedBox(height: 16.h,),
            Text("name \nFalonchi",style: AppTextStyle.urbanistMedium.copyWith(
              color: AppColors.black,fontSize:24.sp
            ),),
            SizedBox(height: 16.h,),
            Text("lastname\nFalonchiyev",style: AppTextStyle.urbanistMedium.copyWith(
                color: AppColors.black,fontSize:24.sp
            ),),
            SizedBox(height: 16.h,),
            Text("phone\n+998 99 999 99 99",style: AppTextStyle.urbanistMedium.copyWith(
                color: AppColors.black,fontSize:24.sp
            ),),
            SizedBox(height: 16.h,),
            Text("email\nexample@gmail.com",style: AppTextStyle.urbanistMedium.copyWith(
                color: AppColors.black,fontSize:24.sp
            ),),
          ],
        ),
      ),
    );
  }
}
