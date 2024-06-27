import 'package:e_worker/screens/create_screen/widgets/soha_turi.dart';
import 'package:e_worker/screens/create_screen/widgets/yonalish_turi.dart';
import 'package:e_worker/utils/styles/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../bloc/category/categories_bloc.dart';
import '../../../bloc/category/categories_event.dart';
import '../../../bloc/category/categories_state.dart';
import '../../../bloc/image/image_bloc.dart';
import '../../../bloc/vacancy/vacancy_bloc.dart';
import '../../../bloc/vacancy/vacancy_event.dart';
import '../../../bloc/vacancy/vacancy_state.dart';
import '../../../data/model/vacancy/vacancy_model.dart';

class FirstVacancyPage extends StatefulWidget {
  const FirstVacancyPage({super.key, required this.fieldController, required this.yonalishControler});

  final TextEditingController fieldController;
  final TextEditingController yonalishControler;

  @override
  State<FirstVacancyPage> createState() => _FirstVacancyPageState();
}

class _FirstVacancyPageState extends State<FirstVacancyPage> {
  String currentCategoryId = '';
  String field = '';
  String direction = '';
  String subCategoryId = '';
  String categoryId = '';

  @override
  Widget build(BuildContext context) {
    context.read<CategoriesBloc>().add(
          GetCategories(),
        );
    final firstFormKey = GlobalKey<FormState>();
    final secondFormKey = GlobalKey<FormState>();
    final TextEditingController positionController = TextEditingController();
    final TextEditingController companyController = TextEditingController();
    return BlocBuilder<VacancyBloc, VacancyState>(
      builder: (context, state) {
        if (state is ImageLoading) {
          return const SingleChildScrollView(
            child: Column(
              children: [],
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: BlocBuilder<VacancyBloc, VacancyState>(
            builder: (context, vacancyState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    BlocBuilder<CategoriesBloc, CategoriesState>(
                      builder: (context, state) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.w),
                            color: AppColors.c257CFF,
                          ),
                          width: double.infinity,
                          height: 50.h,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16.w),
                            onTap: () {
                              context
                                  .read<CategoriesBloc>()
                                  .add(GetCategories());
                              showMaterialModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15.h),
                                          child: Container(
                                            width: 50.w,
                                            height: 10,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(6.w)),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w, vertical: 2.w),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: <Widget>[
                                                ...List.generate(
                                                    state.categories.length,
                                                    (index) {
                                                  return SohaTuri(
                                                    isActive:field == state
                                                        .categories[index]
                                                        .name,
                                                    onTap: () {
                                                      setState(() {
                                                        currentCategoryId = state.categories[index].id;
                                                        field = state
                                                            .categories[index]
                                                            .name;

                                                        widget.fieldController.text=field;

                                                      });
                                                      context
                                                          .read<VacancyBloc>()
                                                          .add(
                                                            UpdateVacancyFieldEvent(
                                                              value:currentCategoryId,
                                                              field: VacancyField.categoryId,
                                                            ),

                                                          );
                                                      context
                                                          .read<
                                                              CategoriesBloc>()
                                                          .add(GetSubCategories(
                                                              parentId:
                                                                  currentCategoryId));

                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    title: state
                                                        .categories[index].name.tr(),
                                                    color: currentCategoryId ==
                                                            state
                                                                .categories[
                                                                    index]
                                                                .id
                                                        ? AppColors.c257CFF
                                                        : Colors.white,
                                                  );
                                                }),
                                                const SizedBox(height: 20),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.orange),
                                                  child: Text(
                                                    'close'.tr(),
                                                    style:AppTextStyle.urbanistMedium.copyWith(
                                                      color:AppColors.white
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
                                },
                                expand: false,
                                duration: const Duration(microseconds: 100),
                              );
                            },
                            child: Center(
                              child: Text(
                                field.isEmpty ? "choose_field".tr() : field.tr(),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    BlocBuilder<CategoriesBloc, CategoriesState>(
                      builder: (context, state) {
                        context
                            .read<CategoriesBloc>()
                            .add(GetSubCategories(parentId: currentCategoryId));
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.w),
                            color: AppColors.c257CFF,
                          ),
                          width: double.infinity,
                          height: 50.h,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16.w),
                            onTap: () {
                              // colorsBool = true;
                              debugPrint(
                                  "CURRENT CATEGORY ID: $currentCategoryId 0");
                              showMaterialModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15.h),
                                          child: Container(
                                            width: 50.w,
                                            height: 10,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.w)),
                                          ),
                                        ),
                                        Container(
                                          // height: 550.h,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w, vertical: 2.w),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: <Widget>[
                                                ...List.generate(
                                                    state.subCategories.length,
                                                    (index) => YonalishTuri(
                                                      isActive: direction == state
                                                          .subCategories[
                                                      index]
                                                          .name ,
                                                          onTap: () {
                                                            setState(() {
                                                              subCategoryId = state
                                                                  .subCategories[
                                                                      index]
                                                                  .id;
                                                              direction = state
                                                                  .subCategories[
                                                                      index]
                                                                  .name;
                                                              widget.yonalishControler.text=direction.tr();

                                                            });

                                                            context
                                                                .read<
                                                                    VacancyBloc>()
                                                                .add(
                                                                  UpdateVacancyFieldEvent(
                                                                    value: state
                                                                        .subCategories[
                                                                            index]
                                                                        .id,
                                                                    field: VacancyField
                                                                        .subCategoryId,
                                                                  ),
                                                                );
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          title: state
                                                              .subCategories[
                                                                  index]
                                                              .name.tr(),
                                                          color: state
                                                                      .subCategories[
                                                                          index]
                                                                      .id ==
                                                                  subCategoryId
                                                              ? AppColors
                                                                  .c257CFF
                                                              : Colors.white,
                                                        )),
                                                const SizedBox(height: 20),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.orange),
                                                  child:Text(
                                                    'close'.tr(),
                                                    style:AppTextStyle.urbanistMedium.copyWith(
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
                                },
                                expand: false,
                                duration: const Duration(microseconds: 100),
                              );
                            },
                            child: Center(
                              child: Text(
                                direction.isEmpty
                                    ? "choose_burn".tr()
                                    : direction.tr(),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // const TakeImageWidget()
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
