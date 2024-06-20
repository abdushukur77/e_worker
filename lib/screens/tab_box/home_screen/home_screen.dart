import 'package:e_worker/bloc/vacancy/vacancy_bloc.dart';
import 'package:e_worker/bloc/vacancy/vacancy_event.dart';
import 'package:e_worker/data/model/forms_status.dart';
import 'package:e_worker/screens/tab_box/home_screen/widgets/banner_item.dart';
import 'package:e_worker/screens/vacanies_screen/vacanies_screen.dart';
import 'package:e_worker/utils/colors/app_colors.dart';
import 'package:e_worker/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../bloc/category/categories_bloc.dart';
import '../../../bloc/category/categories_state.dart';
import '../../../utils/size/size_utils.dart';
import '../../shimer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: Colors.black,
          statusBarBrightness: Brightness.dark),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Biz bilan izlayotganingizni toping",
            style: AppTextStyle.urbanistMedium
                .copyWith(color: AppColors.black, fontSize: 20.sp),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    const BannerItem(),
                    SizedBox(height: 20.h),
                    Text(
                      "Categoriyalar",
                      style: AppTextStyle.urbanistMedium
                          .copyWith(color: AppColors.black, fontSize: 24.sp),
                    ),
                  ],
                ),
              ),
              BlocBuilder<CategoriesBloc, CategoriesState>(
                  builder: (context, state) {
                return SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                  // if (state.formsStatus == FormsStatus.loading) {
                  //   return ShimmerWidget(width: double.infinity, height: 100.h);
                  // }
                  if (state.formsStatus == FormsStatus.success) {
                    return ZoomTapAnimation(
                      onTap: () {
                        activeIndex = index;
                        setState(() {});
                        context.read<VacancyBloc>().add(
                            GetVacanciesByCategoryId(
                                categoryId: state.categories[activeIndex].id));
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return VacanciesScreen(
                              categoryId: state.categories[activeIndex].id,
                              name: state.categories[activeIndex].name);
                        }));
                      },
                      child: Container(
                        height: 260.h,
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: Colors.grey.shade100),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 10.h),
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(16.r),
                                child: Image.network(
                                  state.categories[index].image,
                                  width: double.infinity,
                                  height: 200.h,
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(
                              height: 7.h,
                            ),
                            Text(
                              state.categories[index].name,
                              style: AppTextStyle.urbanistMedium.copyWith(
                                  color: AppColors.black, fontSize: 24.sp),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 20.h),
                      child: ShimmerWidget(width: 300.w, height: 200.h,border:BorderRadius.circular(30.r) ,),
                    ),
                  );
                },
                        childCount: state.formsStatus == FormsStatus.success
                            ? state.categories.length
                            : 10));
              }),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 50.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
