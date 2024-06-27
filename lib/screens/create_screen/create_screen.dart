import 'package:e_worker/bloc/image/image_bloc.dart';
import 'package:e_worker/bloc/my_vacancy/my_vacancy_bloc.dart';
import 'package:e_worker/bloc/my_vacancy/my_vacancy_event.dart';
import 'package:e_worker/bloc/places/search_bloc.dart';
import 'package:e_worker/bloc/places/search_state.dart';
import 'package:e_worker/bloc/vacancy/vacancy_state.dart';
import 'package:e_worker/data/repository/my_vacancy_repository.dart';
import 'package:e_worker/screens/create_screen/widgets/district.dart';
import 'package:e_worker/screens/create_screen/widgets/first_vacancy_page.dart';
import 'package:e_worker/screens/create_screen/widgets/location.dart';
import 'package:e_worker/screens/create_screen/widgets/take_image.dart';
import 'package:e_worker/utils/colors/app_colors.dart';
import 'package:e_worker/utils/styles/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();
  TextEditingController fieldController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController yonalishController = TextEditingController();
  TextEditingController informationController=TextEditingController();
  TextEditingController districtController=TextEditingController();
  TextEditingController hasImage = TextEditingController();
  VacancyModel vacancyModel = VacancyModel.initial();
  bool isButtonEnabled = false;

  void _validateForm() {
    setState(() {
      isButtonEnabled = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    phoneController.addListener(_validateForm);
    fieldController.addListener(_validateForm);
    locationController.addListener(_validateForm);
    yonalishController.addListener(_validateForm);
    hasImage.addListener(_validateForm);
  }

  @override
  void dispose() {
    phoneController.dispose();
    fieldController.dispose();
    locationController.dispose();
    yonalishController.dispose();
    hasImage.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("create_vacancy".tr(),style: AppTextStyle.urbanistMedium.copyWith(
          color: AppColors.black,fontSize:20.sp
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<VacancyBloc, VacancyState>(
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  FirstVacancyPage(
                    fieldController: fieldController,
                    yonalishControler: yonalishController,
                  ),
                  LocationWidget(locationController:locationController),
                  SizedBox(height: 16.h,),
                  DistrictWidget(districtController: districtController),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                    child: TextFormField(
                      style: AppTextStyle.urbanistRegular.copyWith(fontSize: 14, color: AppColors.black),
                      onChanged: (v) {
                        if (v.length == 12) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        }
                        context.read<VacancyBloc>().add(
                          UpdateVacancyFieldEvent(
                            value: phoneController.text,
                            field: VacancyField.recruiterPhone,
                          ),
                        );
                      },
                      inputFormatters: [AppInputFormatters.phoneFormatter],
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a phone number';
                        }
                        return null;
                      },
                      controller: phoneController,
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
                        prefixIcon: SizedBox(
                          width: 85.w,
                          child: Row(
                            children: [
                              SizedBox(width: 10.w),
                              const Icon(Icons.call),
                              SizedBox(width: 10.w),
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
                  TakeImageWidget(hasImage: hasImage),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                    child: TextFormField(
                      maxLines: null,
                      controller: informationController,
                      decoration: InputDecoration(
                        hintText: "enter_information".tr(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.w),
                          borderSide: BorderSide(width: 1.w, color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.w),
                          borderSide: BorderSide(width: 1.w, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    width: double.infinity,
                    child: TextButton(
                      onPressed: isButtonEnabled
                          ? () {
                        context.read<VacancyBloc>().add(
                          UpdateVacancyFieldEvent(value:informationController.text, field:VacancyField.description),
                        );
                        context.read<VacancyBloc>().add(
                          UpdateVacancyFieldEvent(value:"${locationController.text} ${districtController.text}", field:VacancyField.position),
                        );
                        context.read<VacancyBloc>().add(
                          UpdateVacancyFieldEvent(value:DateTime.now().toString(), field:VacancyField.createdAt),
                        );
                        context.read<VacancyBloc>().add(
                          UpdateVacancyFieldEvent(value:yonalishController.text, field:VacancyField.jobTitle),
                        );
                        vacancyModel=state.vacancyModel;
                        context.read<VacancyBloc>().add(
                          AddVacancyEvent(vacancyModel:state.vacancyModel),
                        );
                        vacancyModel=vacancyModel.copyWith(
                          description: informationController.text,
                          position: locationController.text,
                          createdAt: DateTime.now().toString(),
                          jobTitle: yonalishController.text
                        );
                        context.read<MyVacancyBloc>().add(MyAddVacancyEvent(vacancyModel:vacancyModel));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Muvaffaqqiyatli qo'shildi",style: AppTextStyle.urbanistMedium.copyWith(
                            color: AppColors.white,fontSize: 14.sp
                          ),),backgroundColor: Colors.green,duration:const Duration(seconds: 2),),
                        );
                        Navigator.pop(context);
                      }
                          : null,
                      style: TextButton.styleFrom(
                        backgroundColor: isButtonEnabled ? AppColors.c257CFF : Colors.grey,
                      ),
                      child: Text(
                        "save".tr(),
                        style: AppTextStyle.urbanistMedium.copyWith(color: AppColors.white, fontSize: 16.w),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
