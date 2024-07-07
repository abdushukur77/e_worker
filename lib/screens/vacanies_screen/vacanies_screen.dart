import 'dart:async';

import 'package:e_worker/bloc/vacancy/vacancy_bloc.dart';
import 'package:e_worker/bloc/vacancy/vacancy_state.dart';
import 'package:e_worker/data/model/forms_status.dart';
import 'package:e_worker/data/model/vacancy/vacancy_model.dart';
import 'package:e_worker/screens/create_screen/widgets/district.dart';
import 'package:e_worker/screens/vacancy/vacancy_screen.dart';
import 'package:e_worker/screens/vacanies_screen/widgets/district_widget.dart';
import 'package:e_worker/screens/vacanies_screen/widgets/location_widget.dart';
import 'package:e_worker/utils/colors/app_colors.dart';
import 'package:e_worker/utils/images/app_images.dart';
import 'package:e_worker/utils/styles/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class VacanciesScreen extends StatefulWidget {
  const VacanciesScreen(
      {super.key,required this.name});
  final String name;

  @override
  State<VacanciesScreen> createState() => _VacanciesScreenState();
}

class _VacanciesScreenState extends State<VacanciesScreen> {
  int activeIndex = 0;
  TextEditingController location=TextEditingController();
  TextEditingController district=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name.tr(),
          style: AppTextStyle.urbanistMedium
              .copyWith(color: AppColors.black, fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10.h,),
          LocationWidgets(function: (v){
            location.text=v;
            setState(() {});
          },),
          SizedBox(height: 10.h,),
          Visibility(
              visible: location.text.isNotEmpty,
              child:DistrictWidgets(function: (v){
                district.text=v;
                setState(() {});
              },)),
          SizedBox(height: 20.h,),
          BlocBuilder<VacancyBloc, VacancyState>(
            builder: (context, state) {
              if (state.status == FormsStatus.success) {
                List<VacancyModel> vacancies=state.vacancies.where((e){
                  return e.position.toLowerCase().contains("${location.text.toLowerCase()} ${district.text.toLowerCase()}");
                }).toList();
                return (vacancies.isEmpty)?Center(child: Lottie.asset(AppImages.empty),):Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 30.h),
                    children: [
                      ...List.generate(vacancies.length, (index) {
                        String create = vacancies[index].createdAt.toString();
                        String position1=vacancies[index].position.split(" ")[0];
                        String position2=vacancies[index].position.split(" ")[1];
                        return ZoomTapAnimation(
                          onTap: () {
                            activeIndex = index;
                            setState(() {});
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return VacancyScreen(
                                  vacancyModel:vacancies[activeIndex]);
                            }));
                          },
                          child: Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      color: AppColors.black.withOpacity(0.5),
                                      offset: Offset(0, 4))
                                ]),
                            child: Row(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(16.r),
                                    child: Image.network(
                                      (vacancies[index].brandImage.isEmpty)?"https://career.ict.md/wp-content/plugins/user_roles/public/img/company_logo.png":vacancies[index].brandImage[0],
                                      width: 100.w,
                                      height: 100.h,
                                      fit: BoxFit.cover,
                                    )),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        vacancies[index].jobTitle.tr(),
                                        style: AppTextStyle.urbanistSemiBold.copyWith(
                                            color: AppColors.black, fontSize: 20.sp),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Text("${position1.tr()} ${position2.tr()}",style: AppTextStyle.urbanistMedium.copyWith(
                                        color: Colors.black,fontSize:16.sp
                                      ),),
                                      SizedBox(height:10.h,),
                                      Text(create.length > 10
                                          ? "E'lon vaqti: ${create.substring(0, 16)}"
                                          : create),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
