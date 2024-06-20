import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/styles/app_text_style.dart';
import '../../../bloc/image/image_bloc.dart';
import '../../../bloc/vacancy/vacancy_bloc.dart';
import '../../../bloc/vacancy/vacancy_event.dart';
import '../../../data/model/vacancy/vacancy_model.dart';
import '../../../utils/size/size_utils.dart';

class TakeImageWidget extends StatefulWidget {
  const TakeImageWidget({super.key, required this.hasImage});
   final TextEditingController hasImage;

  @override
  State<TakeImageWidget> createState() => _TakeImageWidgetState();
}

class _TakeImageWidgetState extends State<TakeImageWidget> {
  final ImagePicker picker = ImagePicker();
  List<String> imageUrl = [];
  List<String> storagePath = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<ImageBloc, ImageState>(
          builder: (context, state) {
            if (state is ImageLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ImageSuccess) {
              widget.hasImage.text=imageUrl[0];

              return Center(
                child: SizedBox(
                  height: 150.h,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.imageUrl.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal:8.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.w),
                          child: Image.network(
                            state.imageUrl[index],
                            height: 150.h,
                            width: 150.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
            if (state is ImageInitial) {
              return Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.w),
                  child: Image.network(
                    "https://career.ict.md/wp-content/plugins/user_roles/public/img/company_logo.png",
                    height: 100.h,
                    width: 100.w,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }
            if (state is ImageFailure) {
              return Center(
                child: Text(
                  state.error,
                  style: AppTextStyle.urbanistSemiBold,
                ),
              );
            }
            return const SizedBox();
          },
          listener: (BuildContext context, ImageState state) {
            if (state is ImageSuccess) {

              imageUrl = state.imageUrl;
              debugPrint("CURRENT IMAGE: $imageUrl");
              context.read<VacancyBloc>().add(
                UpdateVacancyFieldEvent(
                  value: imageUrl,
                  field: VacancyField.brandImage,
                ),
              );
            }
          },
        ),
        SizedBox(height: 30.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              takeAnImage();
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.w),
              ),
              padding: EdgeInsets.symmetric(vertical: 12.h),
              backgroundColor: AppColors.c257CFF,
            ),
            child: Text(
              'Rasm tanlang',
              style: AppTextStyle.urbanistMedium.copyWith(
                color: AppColors.white,
                fontSize: 13.w,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _getImageFromCamera() async {
    final List<XFile>? images = await picker.pickMultiImage(
      maxHeight: 1024,
      maxWidth: 1024,
    );
    if (images != null && images.isNotEmpty && context.mounted) {
      for (var image in images.take(2)) {
        storagePath.add("files/images/${image.name}");
      }
      context.read<ImageBloc>().add(
        UploadImage(
          pickedFile: images,
          storagePath: storagePath,
        ),
      );
      debugPrint("DOWNLOAD URL: $imageUrl");
    }
  }

  Future<void> _getImageFromGallery() async {
    final List<XFile>? images = await picker.pickMultiImage(
      maxHeight: 1024,
      maxWidth: 1024,
    );
    if (images != null && images.isNotEmpty && context.mounted) {
      debugPrint("DOWNLOAD URL Gallery: $images");
      for (var image in images.take(2)) {
        storagePath.add("files/images/${image.name}");
      }
      context.read<ImageBloc>().add(
        UploadImage(
          pickedFile: images,
          storagePath: storagePath,
        ),
      );
    }
  }

  void takeAnImage() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 12.h),
            ListTile(
              onTap: () async {
                await _getImageFromGallery();
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
              leading: const Icon(Icons.photo_album_outlined),
              title: const Text("Gallerydan tanlash"),
            ),
            ListTile(
              onTap: () async {
                await _getImageFromCamera();
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
              leading: const Icon(Icons.camera_alt),
              title: const Text("Camera orqali tanlash"),
            ),
            SizedBox(height: 24.h),
          ],
        );
      },
    );
  }
}
