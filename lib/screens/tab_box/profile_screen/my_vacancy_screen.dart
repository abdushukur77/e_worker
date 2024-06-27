import 'package:e_worker/bloc/my_vacancy/my_vacancy_bloc.dart';
import 'package:e_worker/bloc/my_vacancy/my_vacancy_state.dart';
import 'package:e_worker/data/model/forms_status.dart';
import 'package:e_worker/utils/images/app_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';
import '../../vacancy/vacancy_screen.dart';

class MyVacancyScreen extends StatefulWidget {
  const MyVacancyScreen({super.key});

  @override
  State<MyVacancyScreen> createState() => _MyVacancyScreenState();
}

class _MyVacancyScreenState extends State<MyVacancyScreen> {
  int activeIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my_vacancies".tr(),style: AppTextStyle.urbanistMedium.copyWith(
          color: AppColors.black,fontSize:24.sp
        ),),
        centerTitle: true,
      ),
      body: BlocBuilder<MyVacancyBloc,MyVacancyState>(
        builder: (context,state){
          if(state.status==FormsStatus.loading){
            return const Center(child: CircularProgressIndicator(),);
          }
          return (state.vacancies.isEmpty)?Center(child:Lottie.asset(AppImages.empty),):ListView(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            children: [
              ...List.generate(state.vacancies.length, (index) {
                String create = state.vacancies[index].createdAt.toString();
                return ZoomTapAnimation(
                  onTap: () {
                    activeIndex = index;
                    setState(() {});
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return VacancyScreen(
                              vacancyModel: state.vacancies[activeIndex]);
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
                              offset: const Offset(0, 4))
                        ]),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.network(
                              state.vacancies[index].brandImage[0],
                              width: 100.w,
                              height: 100.h,
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.vacancies[index].jobTitle.tr(),
                              style: AppTextStyle.urbanistSemiBold.copyWith(
                                  color: AppColors.black, fontSize: 20.sp),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(create.length > 10
                                ? "E'lon vaqti: ${create.substring(0, 16)}"
                                : create),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })
            ],
          );
        },
      ),
    );
  }
}
