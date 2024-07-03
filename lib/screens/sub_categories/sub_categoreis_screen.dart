import "package:e_worker/bloc/category/categories_bloc.dart";
import "package:e_worker/bloc/category/categories_state.dart";
import "package:e_worker/data/model/forms_status.dart";
import "package:e_worker/utils/colors/app_colors.dart";
import "package:e_worker/utils/styles/app_text_style.dart";
import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "../../bloc/vacancy/vacancy_bloc.dart";
import "../../bloc/vacancy/vacancy_event.dart";
import "../vacanies_screen/vacanies_screen.dart";


class SubCategoriesScreen extends StatefulWidget {
  const SubCategoriesScreen({super.key, required this.categoryName});
  final String categoryName;
  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  int activeIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryName.tr(),
          style: AppTextStyle.urbanistMedium
              .copyWith(color: AppColors.black, fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body:BlocBuilder<CategoriesBloc,CategoriesState>(
        builder: (context,state){
          if(state.formsStatus==FormsStatus.loading){
            return const Center(child: CircularProgressIndicator(),);
          }
          return ListView(
            children:List.generate(state.subCategories.length, (index){
              return Padding(
                padding:EdgeInsets.symmetric(horizontal:24.w,vertical: 8.h),
                child: ListTile(
                  onTap: (){
                    activeIndex=index;
                    setState(() {});
                    context.read<VacancyBloc>().add(
                        GetVacanciesBySubCategoryId(
                            subCategoryId: state.subCategories[activeIndex].id));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return VacanciesScreen(
                              name: state.subCategories[activeIndex].name);
                        }));
                  },
                  style:ListTileStyle.list,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  tileColor: Colors.blue.withOpacity(0.3),
                  title: Text(state.subCategories[index].name.tr(),style: AppTextStyle.urbanistMedium.copyWith(
                    color: AppColors.black,fontSize:18.sp
                  ),),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
