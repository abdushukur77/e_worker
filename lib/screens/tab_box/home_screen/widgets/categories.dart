// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../bloc/category/categories_bloc.dart';
// import '../../../../bloc/category/categories_state.dart';
// import '../../../../utils/colors/app_colors.dart';
// import '../../../../utils/styles/app_text_style.dart';
//
// class CategoriesWidgets extends StatefulWidget {
//   const CategoriesWidgets({super.key});
//
//   @override
//   State<CategoriesWidgets> createState() => _CategoriesWidgetsState();
// }
//
// class _CategoriesWidgetsState extends State<CategoriesWidgets> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CategoriesBloc,CategoriesState>(builder:(context,state){
//       return SingleChildScrollView(
//         child: GridView.count(crossAxisCount:1,
//           childAspectRatio: 0.9,
//           children:List.generate(state.categories.length, (index){
//             return Container(
//               padding: EdgeInsets.symmetric(horizontal:12.w,vertical:10.h),
//               child: Column(
//                 children: [
//                   Image.network("https://kkk1.uz/wp-content/uploads/2022/06/ctroitelno-montazhnye-raboty.jpg"),
//                   Text(state.categories[index].name,style: AppTextStyle.urbanistMedium.copyWith(
//                       color: AppColors.black,fontSize: 24.sp
//                   ),)
//                 ],
//               ),
//             );
//           }),),
//       );
//     });
//   }
// }
