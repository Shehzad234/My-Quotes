import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/res/components/actions_row.dart';
import 'package:share_plus/share_plus.dart';

class PreviewScreen extends StatelessWidget {
  final dynamic data;
  // ignore: prefer_const_constructors_in_immutables
  PreviewScreen({required this.data, super.key});
  late final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    _pageController = PageController(initialPage: data['initialImage']);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: PageView.builder(
            itemCount: data['images'].length,
            controller: _pageController,
            reverse: true,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Container()),
                  if (data['images'][index].runtimeType == String)
                    Card(
                      color: Colors.grey,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Hero(
                          tag: 'image${data['images'][index]}',
                          child: CachedNetworkImage(
                            imageUrl: data['images'][index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            progressIndicatorBuilder:
                                (context, url, progress) => SizedBox(
                              height: 300,
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: progress.progress,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  else
                    Card(
                      color: Colors.grey,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Hero(
                          tag: 'image${data['images'][index]}',
                          child: Image.file(
                            data['images'][index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  Expanded(child: Container()),
                  if (data['images'][index].runtimeType == String)
                    Card(
                      color: Colors.grey[900],
                      child: ActionsRow(imageUrl: data['images'][index]),
                    )
                  else
                    IconButton(
                      onPressed: () async {
                        Share.shareXFiles([XFile(data['images'][index].path)]);
                      },
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
