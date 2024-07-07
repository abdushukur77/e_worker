import 'package:e_worker/utils/colors/app_colors.dart';
import 'package:e_worker/utils/styles/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoneyScreen extends StatefulWidget {
  const MoneyScreen({super.key});

  @override
  State<MoneyScreen> createState() => _MoneyScreenState();
}

class _MoneyScreenState extends State<MoneyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hisob".tr(),style: AppTextStyle.urbanistMedium.copyWith(
          color: AppColors.black,fontSize:24.sp
        ),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Text("0\$",style: AppTextStyle.urbanistRegular.copyWith(
              color: AppColors.black,fontSize: 40.sp
            ),)
          ],
        ),
      ),
    );
  }
}
