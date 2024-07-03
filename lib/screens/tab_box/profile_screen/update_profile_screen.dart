import 'package:e_worker/bloc/auth/auth_bloc.dart';
import 'package:e_worker/utils/colors/app_colors.dart';
import 'package:e_worker/utils/styles/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/user/user_model.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("setting".tr(),style: AppTextStyle.urbanistMedium.copyWith(
          color: AppColors.black,fontSize:24.sp
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 20.h),
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            TextField(
              controller: nameController,
              style: AppTextStyle.urbanistRegular.copyWith(
                color: AppColors.black,fontSize: 18.sp
              ),
              decoration: InputDecoration(
                hintText: "enter_new_name".tr(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(width: 1.sp,color: Colors.black)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(width: 1.sp,color: Colors.black)
                ),
              ),
            ),
            SizedBox(height:20.h,),
            // TextField(
            //   controller: phoneController,
            //   decoration: InputDecoration(
            //     hintText: "Enter phone",
            //     focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(16.r),
            //         borderSide: BorderSide(width: 1.sp,color: Colors.black)
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(16.r),
            //         borderSide: BorderSide(width: 1.sp,color: Colors.black)
            //     ),
            //   ),
            // ),
            SizedBox(
              width: double.infinity,
              child: TextButton(onPressed: (){
               UserModel userModel=context.read<AuthBloc>().state.userModel;
               userModel=userModel.copyWith(
                 username:nameController.text
               );
               context.read<AuthBloc>().add(UpdateUserEvent(userModel:userModel));
               Navigator.pop(context);
              },
                  style: TextButton.styleFrom(
                    backgroundColor:Colors.blue,
                  ),
                  child:Text("change".tr(),style: AppTextStyle.urbanistRegular.copyWith(
                color: AppColors.white,fontSize: 20.sp
              ),)),
            )
          ],
        ),
      ),
    );
  }
}

