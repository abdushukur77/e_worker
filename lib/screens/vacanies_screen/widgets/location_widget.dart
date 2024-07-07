import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/places/search_bloc.dart';
import '../../../bloc/places/search_event.dart';
import '../../../bloc/places/search_state.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';
import '../../create_screen/widgets/yonalish_turi.dart';

class LocationWidgets extends StatefulWidget {
  const LocationWidgets({super.key,required this.function});
  final Function(String s) function;

  @override
  State<LocationWidgets> createState() => _LocationWidgetsState();
}

class _LocationWidgetsState extends State<LocationWidgets> {
  String location="";
  int activeIndex=-1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryBloc,CountryState>(builder:(
        context,state){
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        width:double.infinity,
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor:(location.isEmpty)?AppColors.c_93B8FE:AppColors.c257CFF,
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
                              SizedBox(
                                width: double.infinity,
                                child: TextButton(onPressed:(){
                                  location="";
                                  widget.function.call("");
                                  setState(() {});
                                  Navigator.pop(context);
                                },style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.r)
                                  ),
                                  backgroundColor: (location.isEmpty)?Colors.blue:Colors.white,
                                  side: BorderSide(width: 1.sp,color: Colors.blue)
                                ),
                                    child:Row(
                                      children: [
                                        Text("all".tr(),style: AppTextStyle.urbanistRegular.copyWith(
                                          color: (location.isEmpty)?AppColors.white:AppColors.black,fontSize:20.sp
                                        ),),
                                      ],
                                    )),
                              ),
                              ...List.generate(state.country.length, (index){
                                return YonalishTuri(onTap: (){
                                  activeIndex=index;
                                  setState(() {});
                                  context.read<CountryBloc>().add(GetById(id:state.country[activeIndex].id));
                                  location=state.country[index].name;
                                  setState(() {});
                                  widget.function.call(location);
                                  Navigator.pop(context);
                                }, isActive: location==state.country[index].name,title:state.country[index].name.tr(), color:(location!=state.country[index].name)?Colors.white:Colors.blue);
                              }),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style:TextButton.styleFrom(
                                    backgroundColor: Colors.orange
                                ),
                                child:Column(
                                  children: [
                                    Text(
                                      'close'.tr(),
                                      style: AppTextStyle.urbanistMedium.copyWith(
                                          color: AppColors.white
                                      ),
                                    ),
                                  ],
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
            }, child:Text((location.isEmpty)?"all".tr():location.tr(),style: AppTextStyle.urbanistRegular.copyWith(color:Colors.white,fontSize:16.sp),)),
      );
    });
  }
}
