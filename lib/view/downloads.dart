import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/repo/downloads_repo.dart';
import 'package:quotes_app/res/components/custom_appbar.dart';
import 'package:quotes_app/res/components/custom_drawer.dart';
import 'package:quotes_app/utils/routes/routes_name.dart';
import 'package:quotes_app/view_model/download_view_model.dart';

class DownlaodScreen extends StatelessWidget {
  const DownlaodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DownloadViewModel>(
      builder: (BuildContext context, downloadViewModel, child) {
        if (downloadViewModel.downloads.isEmpty) {
          DownloadsRepo.getDownloadedFiles(context);
        }
        return Scaffold(
          drawer: const CustomDrawer(),
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  color: Colors.white,
                  child: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        const CustomAppbar(
                          title: "Downloads",
                        )
                      ];
                    },
                    body: Stack(
                      children: [
                        Container(
                          height: 20,
                          color: Colors.black,
                        ),
                        Container(
                          height: 30,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 1,
                          child: GridView.builder(
                            padding: const EdgeInsets.all(5),
                            itemCount: downloadViewModel.downloads.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: .6,
                              crossAxisCount: 3,
                            ),
                            itemBuilder: (context, index) {
                              index = downloadViewModel.downloads.length -
                                  index -
                                  1;
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RoutesName.previewScreen,
                                      arguments: {
                                        'images': downloadViewModel.downloads,
                                        'initialImage': downloadViewModel
                                            .downloads
                                            .indexOf(downloadViewModel
                                                .downloads[index])
                                      });
                                },
                                child: Card(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Hero(
                                      tag:
                                          'image${downloadViewModel.downloads[index]}',
                                      child: Image.file(
                                        downloadViewModel.downloads[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
