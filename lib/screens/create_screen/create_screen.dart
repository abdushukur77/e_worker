import 'package:e_worker/bloc/image/image_bloc.dart';
import 'package:e_worker/bloc/vacancy/vacancy_state.dart';
import 'package:e_worker/screens/create_screen/widgets/first_vacancy_page.dart';
import 'package:e_worker/screens/create_screen/widgets/location.dart';
import 'package:e_worker/screens/create_screen/widgets/take_image.dart';
import 'package:e_worker/utils/colors/app_colors.dart';
import 'package:e_worker/utils/styles/app_text_style.dart';
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

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Do you want to proceed?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {

                Navigator.of(context).pop(); // Close the dialog
                context.read<VacancyBloc>().add(
                  AddVacancyEvent(
                    vacancyModel:vacancyModel,
                  ),
                );
                print('Yes');
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Handle the "No" action here
                print('No');
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Screen"),
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
                  LocationWidget(locationController: locationController),
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
                      decoration: InputDecoration(
                        hintText: "Enter ",
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
                          AddVacancyEvent(
                            vacancyModel: vacancyModel.copyWith(
                              position: locationController.text,
                              description: fieldController.text,
                              phone: phoneController.text,
                              brandImage: context.read<VacancyBloc>().state.vacancyModel.brandImage,
                              categoryId: context.read<VacancyBloc>().state.vacancyModel.categoryId,
                              subCategoryId: context.read<VacancyBloc>().state.vacancyModel.subCategoryId,
                            ),
                          ),
                        );
                        _showConfirmationDialog(context);
                      }
                          : null,
                      style: TextButton.styleFrom(
                        backgroundColor: isButtonEnabled ? AppColors.c257CFF : Colors.grey,
                      ),
                      child: Text(
                        "Saqlash",
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
