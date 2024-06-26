import 'package:e_worker/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/category/categories_bloc.dart';
import '../../../bloc/category/categories_state.dart';

class SohaTuri extends StatelessWidget {
  const SohaTuri({super.key, required this.onTap, required this.title, required this.color, required this.isActive,});

  final VoidCallback onTap;
  final String title;
  final Color color;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 7.h,
        ),
        InkWell(
          onTap: onTap,
          child: BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.w),
                  color: color,
                  border: Border.all(width: 1.w,color:AppColors.c257CFF)
                ),
                width: double.infinity,
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 5.h),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [
                      Text(
                        title,style:  TextStyle(color: (isActive)?Colors.white:Colors.black,fontSize: 20.w ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
