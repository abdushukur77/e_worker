import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YonalishTuri extends StatelessWidget {
  const YonalishTuri({super.key, required this.onTap, required this.title, required this.color});
  final VoidCallback onTap;
  final String  title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 7.h,),
        InkWell(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(6.w), color:color,
            ),
            child: Padding(
              padding: EdgeInsets
                  .symmetric(
                  horizontal:
                  20.w,
                  vertical: 5.h),
              child: Text(
                title,style:TextStyle(color: Colors.white,fontSize: 20.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
