import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nilay/model/test/slider.dart';
import 'package:nilay/utils/components.dart';

class SliderHomeStoresItem extends StatelessWidget {

  final SliderData slider;

  const SliderHomeStoresItem({required this.slider, super.key});

  @override
  Widget build(BuildContext context) {
    return _buildSliderItem(slider);
  }

  Widget _buildSliderItem(SliderData slider) => InkWell(
    child: Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10.r)),
      child: CachedImage(imageUrl: slider.image!),
    ),
    onTap: () {},
  );
}
