import 'package:e_worker/bloc/places/search_bloc.dart';
import 'package:e_worker/bloc/places/search_state.dart';
import 'package:e_worker/screens/create_screen/widgets/yonalish_turi.dart';
import 'package:e_worker/utils/colors/app_colors.dart';
import 'package:e_worker/utils/styles/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DistrictWidget extends StatefulWidget {
  const DistrictWidget({super.key, required this.districtController});
  final TextEditingController districtController ;

  @override
  State<DistrictWidget> createState() => _DistrictWidgetState();
}

class _DistrictWidgetState extends State<DistrictWidget> {
  String location='';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryBloc,CountryState>(builder:(
    context,state){
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
                              ...List.generate(state.district.length, (index){
                                return YonalishTuri(onTap: (){
                                  location=state.district[index].name;
                                  setState(() {});
                                  widget.districtController.text=location;
                                  Navigator.pop(context);
                                }, isActive: location==state.district[index].name,title:state.district[index].name.tr(), color:(location!=state.district[index].name)?Colors.white:Colors.blue);
                              }),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style:TextButton.styleFrom(
                                    backgroundColor: Colors.orange
                                ),
                                child:Text(
                                  'close'.tr(),
                                  style: AppTextStyle.urbanistMedium.copyWith(
                                      color: AppColors.white
                                  ),
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
            }, child:Text((location.isEmpty)?"choose_place2".tr():location.tr(),style: AppTextStyle.urbanistRegular.copyWith(color:Colors.white),)),
      );
    });
  }
}
