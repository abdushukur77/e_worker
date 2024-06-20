import 'package:e_worker/screens/create_screen/widgets/yonalish_turi.dart';
import 'package:e_worker/utils/colors/app_colors.dart';
import 'package:e_worker/utils/styles/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key, required this.locationController});

  final TextEditingController locationController ;

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  List<String> country=[
    "Toshkent viloyat",
    "Andijon viloyat",
    "Namangan viloyat",
    "Jizzax viloyat",
    "Farg'ona viloyat",
    "Buxoro viloyat",
    "Samarqand viloyat",
    "Qashqadaryo viloyat",
    "Surxandaryo viloyat",
    "Xorazm viloyat",
    "Navoiy viloyat",
    "Sirdaryo viloyat",
    "Toshkent Shahar",
    "Qoraqalpog'iston Respublikasi"
  ];
  String location='';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      width:double.infinity,
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor:AppColors.c257CFF,
            padding: EdgeInsets.symmetric(vertical: 16.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r)
            )
          ),
          onPressed: (){
        showModalBottomSheet(context: context, builder:(BuildContext context){
          return Padding(
            padding:EdgeInsets.symmetric(horizontal: 24.w,vertical:20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50.w,
                  height: 10,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                      BorderRadius.circular(6.w)),
                ),
                SizedBox(height: 20.h,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        ...List.generate(country.length, (index){
                          return YonalishTuri(onTap: (){

                            location=country[index];
                            setState(() {});

                            widget.locationController.text=location;
                            Navigator.pop(context);
                          }, isActive: location==country[index],title:country[index], color:(location!=country[index])?Colors.white:Colors.blue);

                        }),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style:TextButton.styleFrom(
                            backgroundColor: Colors.orange
                          ),
                          child: const Text(
                            'Close',
                            style: TextStyle(
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      }, child:Text((location.isEmpty)?"Hudud":location,style: AppTextStyle.urbanistRegular.copyWith(color:Colors.white),)),
    );
  }
}
