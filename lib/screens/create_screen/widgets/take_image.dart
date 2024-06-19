// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../../../../utils/colors/app_colors.dart';
// import '../../../../../utils/styles/app_text_style.dart';
//
// class TakeImageWidget extends StatefulWidget {
//   const TakeImageWidget({super.key});
//
//   @override
//   State<TakeImageWidget> createState() => _TakeImageWidgetState();
// }
//
// class _TakeImageWidgetState extends State<TakeImageWidget> {
//   final ImagePicker picker = ImagePicker();
//   String imageUrl = "";
//   String storagePath = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         BlocConsumer<ImageBloc, ImageState>(
//           builder: (context, state) {
//             if (state is ImageLoading) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             if (state is ImageSuccess) {
//               return Center(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(50.w),
//                   child: Image.network(
//                     state.imageUrl,
//                     height: 100.h,
//                     width: 100.w,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               );
//             }
//             if (state is ImageInitial) {
//               return Center(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(50.w),
//                   child: Image.network(
//                     "https://career.ict.md/wp-content/plugins/user_roles/public/img/company_logo.png",
//                     height: 100.h,
//                     width: 100.w,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               );
//             }
//             if (state is ImageFailure) {
//               return Center(
//                 child: Text(
//                   state.error,
//                   style: AppTextStyle.interBold,
//                 ),
//               );
//             }
//             return const SizedBox();
//           },
//           listener: (BuildContext context, ImageState state) {
//             if (state is ImageSuccess) {
//               imageUrl = state.imageUrl;
//               debugPrint(
//                 "CURRENT IMAGE: $imageUrl",
//               );
//               context.read<VacancyBloc>().add(
//                 UpdateVacancyFieldEvent(
//                   value: imageUrl,
//                   field: VacancyField.brandImage,
//                 ),
//               );
//             }
//           },
//         ),
//         SizedBox(height: 30.h,),
//         SizedBox(
//           width: width,
//           child: ElevatedButton(
//             onPressed: () {
//               takeAnImage();
//             },
//             style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(vertical: 12.h),
//                 backgroundColor: AppColors.c130160
//             ),
//             child: Text('select_image'.tr(),
//               style: AppTextStyle.interMedium.copyWith(
//                   color: AppColors.white, fontSize: 13.w
//               ),),
//           ),
//         ),
//       ],
//     );
//   }
//   Future<void> _getImageFromCamera() async {
//     XFile? image = await picker.pickImage(
//       source: ImageSource.camera,
//       maxHeight: 1024,
//       maxWidth: 1024,
//     );
//     if (image != null && context.mounted) {
//       debugPrint("IMAGE PATH:${image.path}");
//       storagePath = "files/images/${image.name}";
//       if (mounted) {
//         context.read<ImageBloc>().add(
//           UploadImage(
//             pickedFile: image,
//             storagePath: "files/images/${image.name}",
//           ),
//         );
//       }
//
//       debugPrint("DOWNLOAD URL:$imageUrl");
//     }
//   }
//   Future<void> _getImageFromGallery() async {
//     XFile? image = await picker.pickImage(
//       source: ImageSource.gallery,
//       maxHeight: 1024,
//       maxWidth: 1024,
//     );
//     if (image != null && context.mounted) {
//       debugPrint("IMAGE PATH:${image.path}");
//       storagePath = "files/images/${image.name}";
//       if (mounted) {
//         context.read<ImageBloc>().add(
//           UploadImage(
//             pickedFile: image,
//             storagePath: "files/images/${image.name}",
//           ),
//         );
//       }
//       image = XFile('');
//       debugPrint("DOWNLOAD URL:$imageUrl");
//     }
//   }
//   takeAnImage() {
//     showModalBottomSheet(
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(16),
//               topRight: Radius.circular(16),
//             )),
//         context: context,
//         builder: (context) {
//           return Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(height: 12.h),
//               ListTile(
//                 onTap: () async {
//                   await _getImageFromGallery();
//                   if (context.mounted) {
//                     Navigator.pop(context);
//                   }
//                 },
//                 leading: const Icon(Icons.photo_album_outlined),
//                 title:  Text("Gallerydan tanlash".tr()),
//               ),
//               ListTile(
//                 onTap: () async {
//                   await _getImageFromCamera();
//                   if (context.mounted) {
//                     Navigator.pop(context);
//                   }
//                 },
//                 leading: const Icon(Icons.camera_alt),
//                 title:  Text("Camera orqali tanlash".tr()),
//               ),
//               SizedBox(height: 24.h),
//             ],
//           );
//         });
//   }
// }
