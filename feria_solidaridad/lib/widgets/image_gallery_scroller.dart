import 'dart:async';

import 'package:feria_solidaridad/modules/home/model/images_response.dart';
import 'package:feria_solidaridad/widgets/image_loader.dart';
import "package:flutter/material.dart";

class ImageGalleryScroller extends StatefulWidget {
  const ImageGalleryScroller(
      {super.key, required this.imagesData, required this.delay});

  final List<ImagesData> imagesData;
  final Duration delay;

  @override
  State<ImageGalleryScroller> createState() => _ImageGalleryScrollerState();
}

class _ImageGalleryScrollerState extends State<ImageGalleryScroller> {
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.33);
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(widget.delay).then((_) {
      _timer =
          Timer.periodic(const Duration(milliseconds: 7000), (Timer timer) {
        if (_currentPage < (widget.imagesData.length - 3)) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        if (mounted) {
          _pageController.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 6900),
            curve: Curves.easeInOut,
          );
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 150),
      child: PageView.builder(
        padEnds: false,
        pageSnapping: false,
        controller: _pageController,
        itemBuilder: (context, index) {
          return AspectRatio(
            aspectRatio: 1,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: index % 2 == 0 ? Colors.red : Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ImageLoader(imageUrl: widget.imagesData[index].url),
              ),
            ),
          );
        },
        itemCount: widget.imagesData.length,
      ),
    );
  }
}
