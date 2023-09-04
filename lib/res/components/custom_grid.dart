import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/utils/routes/routes_name.dart';

class CustomGrid extends StatelessWidget {
  final int crossAxisCount;
  final int itemCount;
  final List<String> images;
  const CustomGrid(
      {required this.crossAxisCount,
      required this.itemCount,
      required this.images,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(5),
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: .6,
        crossAxisCount: crossAxisCount,
      ),
      itemBuilder: (context, index) {
        index = images.length - index - 1;
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, RoutesName.previewScreen,
                arguments: {
                  'images' : images,
                  'initialImage' : images.indexOf(images[index])
                  });
          },
          child: Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: 'image${images[index]}',
                child: CachedNetworkImage(
                  imageUrl: images[index],
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
