import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:surf_places/common/widgets/custom_image_widget.dart';
import 'package:surf_places/config/router/routes.dart';

class ImagesCarousel extends StatelessWidget {
  const ImagesCarousel({required this.images, super.key});
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) {
        return InkWell(
          onTap: () {
            ImagesViewerRoute(images: images).push(context);
          },
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: CustomImageWidget(path: images[index]),
          ),
        );
      },
      itemCount: images.length,
      options: CarouselOptions(autoPlay: true, enlargeCenterPage: true),
    );
  }
}
