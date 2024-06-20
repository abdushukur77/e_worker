import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_worker/data/model/vacancy/vacancy_model.dart';
import 'package:e_worker/utils/colors/app_colors.dart';
import 'package:e_worker/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class VacancyScreen extends StatefulWidget {
  const VacancyScreen({super.key, required this.vacancyModel});
  final VacancyModel vacancyModel;
  @override
  State<VacancyScreen> createState() => _VacancyScreenState();
}

class _VacancyScreenState extends State<VacancyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.vacancyModel.jobTitle,style: AppTextStyle.urbanistMedium.copyWith(
          color: AppColors.black,fontSize:24.sp
        ),),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200.h,
            child: CarouselSlider(
              items:List.generate(
                widget.vacancyModel.brandImage.length,(index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical:4.h),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(46.w),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: double.infinity-20.w,
                      imageUrl: widget.vacancyModel.brandImage[index],
                      placeholder: (context, url) => Shimmer.fromColors(
                        enabled: true,
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(6.w)),
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                    ),
                  ),
                );
              },
              ),
              options:CarouselOptions(
                aspectRatio: 16 / 10,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(seconds: 2),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),

          ),
          SizedBox(height: 30.h,),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Telephone:",style: AppTextStyle.urbanistMedium.copyWith(
                    color: AppColors.black,fontSize:20.sp
                  ),),
                  SizedBox(height: 10.h,),
                  Row(children: [
                    Icon(Icons.phone,size: 32.sp,),
                    SizedBox(width: 10.w,),
                    Text("+998 ${widget.vacancyModel.phone}",style: AppTextStyle.urbanistSemiBold.copyWith(
                      color: AppColors.black,fontSize: 20.sp
                    ),),
                  ],),
                  SizedBox(height: 20.h,),
                  Text("Batafsil:\n${widget.vacancyModel.description}",style: AppTextStyle.urbanistSemiBold.copyWith(
                    color: AppColors.black,fontSize:16.sp
                  ),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
