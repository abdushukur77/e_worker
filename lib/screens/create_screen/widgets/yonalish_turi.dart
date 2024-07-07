import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YonalishTuri extends StatelessWidget {
  const YonalishTuri({super.key, required this.onTap, required this.title, required this.color, required this.isActive});
  final VoidCallback onTap;
  final String  title;
  final Color color;
  final bool isActive;
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
              border: Border.all(color:Colors.blue),
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
                title,style:TextStyle(color: (isActive)?Colors.white:Colors.black,fontSize: 20.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
