import "package:e_worker/bloc/category/categories_bloc.dart";
import "package:e_worker/bloc/category/categories_state.dart";
import "package:e_worker/data/model/category/sub_category_model.dart";
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
  const SubCategoriesScreen({super.key, required this.categoryName, required this.isLast});
  final String categoryName;
  final bool isLast;
  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  int activeIndex=0;
  List<SubCategoryModel> subcategories=[];
  int active=0;
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
          if(state.formsStatus==FormsStatus.success){
            subcategories=state.subCategories;
            if(widget.categoryName=='day_worker'){
              SubCategoryModel subCategoryModels=subcategories.where((element) =>element.name=='boshqa_ishlar').toList()[0];
              subcategories.removeWhere((element) => element.name=='boshqa_ishlar');
              subcategories.add(subCategoryModels);
            }
            return Column(
              children: [
                Visibility(
                    visible:widget.isLast,
                    child:Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 16.h),
                      child: Row(children: [
                        TextButton(onPressed: (){
                          active=0;
                          setState(() {});
                        },
                            style: TextButton.styleFrom(
                                backgroundColor:(active==0)?Colors.blue:Colors.white,
                                side: BorderSide(width: 2.w,color: Colors.blue)
                            ),
                            child:Text("Chakana savdo",style: AppTextStyle.urbanistRegular.copyWith(
                                color: (active==0)?AppColors.white:AppColors.black,fontSize:18.sp
                            ),)),
                        const Spacer(),
                        TextButton(onPressed: (){
                          active=1;
                          setState(() {});
                        },
                            style: TextButton.styleFrom(
                                backgroundColor:(active==1)?Colors.blue:Colors.white,
                                side: BorderSide(width: 2.w,color: Colors.blue)
                            ),
                            child:Text("Ulgurchi savdo",style: AppTextStyle.urbanistRegular.copyWith(
                                color:(active==1)?AppColors.white:AppColors.black,fontSize:18.sp
                            ))),
                      ],),
                    )),
                Expanded(
                  child: ListView(
                    children:List.generate(subcategories.length, (index){
                      return Padding(
                        padding:EdgeInsets.symmetric(horizontal:24.w,vertical: 8.h),
                        child: ListTile(
                          onTap: (){
                            activeIndex=index;
                            setState(() {});
                            context.read<VacancyBloc>().add(
                              GetVacanciesBySubCategoryId(
                                  subCategoryId:subcategories[activeIndex].id,isValid: active==0),);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return VacanciesScreen(
                                      name:subcategories[activeIndex].name);
                                }));
                          },
                          style:ListTileStyle.list,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          tileColor: Colors.blue.withOpacity(0.3),
                          title: Text(subcategories[index].name.tr(),style: AppTextStyle.urbanistMedium.copyWith(
                              color: AppColors.black,fontSize:18.sp
                          ),),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
