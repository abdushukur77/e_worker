import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class BannerItem extends StatefulWidget {
  const BannerItem({super.key});

  @override
  State<BannerItem> createState() => _BannerItemState();
}

class _BannerItemState extends State<BannerItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child:CarouselSlider(
        items: List.generate(
          4,(index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical:4.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(46.w),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: double.infinity-20.w,
                imageUrl: "https://kkk1.uz/wp-content/uploads/2022/06/ctroitelno-montazhnye-raboty.jpg",
                placeholder: (context, url) => Shimmer.fromColors(
                  enabled: true,
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(6.w)),
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
                errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
              ),
            ),
          );
        },
        ),
        options: CarouselOptions(
          aspectRatio: 16 / 10,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(seconds: 2),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
      ));
  }
}
