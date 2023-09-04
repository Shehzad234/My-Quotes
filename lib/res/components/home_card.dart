import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/res/components/actions_row.dart';

class HomeCard extends StatelessWidget {
  final String imageUrl;
  const HomeCard({
    required this.imageUrl,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,

      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
              progressIndicatorBuilder: (context, url, progress) => Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                  color: Colors.white,
                ),
              ),
            ),
            ActionsRow(imageUrl: imageUrl,),
          ],
        ),
      ),
    );
  }
}
