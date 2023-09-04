import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/repo/downloads_repo.dart';
import 'package:quotes_app/repo/favorite_repo.dart';
import 'package:quotes_app/view_model/favorites_view_model.dart';
import 'package:share_plus/share_plus.dart';

class ActionsRow extends StatelessWidget {
  final String imageUrl;
  const ActionsRow({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {
            DownloadsRepo.downloadFile(
                context: context, url: imageUrl);
          },
          icon: const Icon(
            Icons.download,
            color: Colors.white,
          ),
        ),
        Consumer<FavoritesViewModel>(
          builder: (context, value, child) {
            return IconButton(
              onPressed: () {
                FavoritesRepo.addRemoveFavoriteSharedPreferences(
                    context: context, imageUrl: imageUrl);
              },
              icon: Icon(
                value.favorites.contains(imageUrl)
                    ? Icons.favorite
                    : Icons.favorite_outline,
                color: value.favorites.contains(imageUrl)
                    ? Colors.red
                    : Colors.white,
              ),
            );
          },
        ),
        IconButton(
          onPressed: () async {
            DownloadsRepo.isImageFileDownloaded(imageUrl, context)
                .then((value) async {
              if (value.isNotEmpty) {
                Share.shareXFiles([XFile(value)]);
              } else {
                await DownloadsRepo.downloadFile(
                        context: context, url: imageUrl)
                    .then((value) {
                  DownloadsRepo.isImageFileDownloaded(imageUrl, context)
                      .then((value) {
                    if (value.isNotEmpty) {
                      Share.shareXFiles([XFile(value)]);
                    }
                  });
                });
              }
            });
          },
          icon: const Icon(
            Icons.share,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
