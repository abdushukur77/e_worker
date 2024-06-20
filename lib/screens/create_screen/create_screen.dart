import 'package:e_worker/bloc/image/image_bloc.dart';
import 'package:e_worker/screens/create_screen/widgets/first_vacancy_page.dart';
import 'package:e_worker/screens/create_screen/widgets/location.dart';
import 'package:e_worker/screens/create_screen/widgets/take_image.dart';
import 'package:e_worker/utils/colors/app_colors.dart';
import 'package:e_worker/utils/styles/app_text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/vacancy/vacancy_bloc.dart';
import '../../bloc/vacancy/vacancy_event.dart';
import '../../data/model/vacancy/vacancy_model.dart';
import '../../utils/formatter/input_formatter.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});



  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  TextEditingController phoneController=TextEditingController();


  TextEditingController fieldController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: const Text("Create Screen"),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
             FirstVacancyPage(fieldController: fieldController),
            const LocationWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.h),
              child: TextFormField(
                style: AppTextStyle.urbanistRegular.copyWith(fontSize: 14,color: AppColors.black),
                onChanged: (v) {
                  if (v.length ==12) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  }
                  context.read<VacancyBloc>().add(
                    UpdateVacancyFieldEvent(
                      value:phoneController.text,
                      field: VacancyField.recruiterPhone,
                    ),
                  );
                },
                inputFormatters: [AppInputFormatters.phoneFormatter],
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  RegExp(r'([0-9])');
                  return null;
                },
                controller:phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.only(top: 17.h, bottom: 17.h),
                  prefixIcon:SizedBox(
                    width: 85.w,
                    child: Row(
                      children: [
                        SizedBox(width: 10.w,),
                        const Icon(Icons.call),
                        SizedBox(width: 10.w,),
                        const Text("+998")
                      ],
                    ),
                  ),
                  hintText: "99 999 99 99",
                  hintStyle: AppTextStyle.urbanistRegular.copyWith(
                    fontSize: 14,
                    color: AppColors.black.withOpacity(0.6),
                  ),
                ),
              ),
            ),
             const TakeImageWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 16.h),
              child: TextField(
                maxLines: null,
                decoration:InputDecoration(
                  hintText: "Enter ",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 13.h),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.w),
                    borderSide: BorderSide(width: 1.w,color:Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.w),
                    borderSide: BorderSide(width: 1.w,color:Colors.black),
                  )
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              width: double.infinity,
              child: TextButton(onPressed: (){


                // context.read<VacancyBloc>().add(
                //   UpdateVacancyFieldEvent(
                //     value: FirebaseAuth.instance
                //         .currentUser!.uid,
                //     field: VacancyField.userId,
                //   ),
                // );
                context.read<VacancyBloc>().add(
                  UpdateVacancyFieldEvent(
                    value:
                    DateTime.now().toString(),
                    field: VacancyField.createdAt,
                  ),
                );


                context.read<VacancyBloc>().add(ChangeToInitialState());

                context.read<ImageBloc>().add(ChangeInitialState());
                Navigator.pop(context);

debugPrint("QQQQQQQQQQQQQQQQQQQQQQQ ${fieldController.text}");


                },style: TextButton.styleFrom(
                backgroundColor:AppColors.c257CFF,
              ),
                  child:Text("Saqlash",style: AppTextStyle.urbanistMedium.copyWith(
                color: AppColors.white,fontSize: 16.w
              ),)),
            )
          ],
        ),
      ),
    );
  }
}
