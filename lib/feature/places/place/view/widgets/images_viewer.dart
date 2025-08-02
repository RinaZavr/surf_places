import 'package:flutter/material.dart';
import 'package:surf_places/common/widgets/back_button.dart';
import 'package:surf_places/common/widgets/custom_image_widget.dart';

class ImagesViewer extends StatefulWidget {
  const ImagesViewer({required this.images, super.key});

  final List<String> images;

  @override
  State<ImagesViewer> createState() => _ImagesViewerState();
}

class _ImagesViewerState extends State<ImagesViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomBackButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: PageView.builder(
        itemCount: widget.images.length,
        itemBuilder: (context, index) =>
            CustomImageWidget(path: widget.images[index], fit: BoxFit.contain),
      ),
    );
  }
}
