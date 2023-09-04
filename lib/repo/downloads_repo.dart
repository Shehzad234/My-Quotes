import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/repo/home_repo.dart';
import 'package:quotes_app/utils/utils.dart';
import 'package:quotes_app/view_model/download_view_model.dart';

class DownloadsRepo {
  static Future<ConnectivityResult> checkInternetConectivity() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    return result;
  }

  static Future downloadFile(
      {required BuildContext context, required String url}) async {
    await HomeRepo.checkStoragePermission(context).then((value){
      isImageFileDownloaded(url, context).then((value) async {
      if (value.isNotEmpty) {
        Utils.flushBarMessage(context, 'Quote Image Already Downloaded');
      } else {
        await checkInternetConectivity().then((value) async {
          if (value == ConnectivityResult.none) {
            Utils.flushBarMessage(context, 'No Internet Connection');
          } else {
            Utils.flushBarMessage(context, 'Downloading...');
            await GallerySaver.saveImage(url, albumName: 'Quotes')
                .then((value) {
              Utils.flushBarMessage(context, 'Downloaded Successfully!');
            }).onError((error, stackTrace) {
              Utils.flushBarMessage(context, 'Error Downloading Quote');
            });
          }
        });
      }
    });
    });
  }

  static List<FileSystemEntity> getDownloadedFiles(context) {
    final downloadsViewModel =
        Provider.of<DownloadViewModel>(context, listen: false);
    Directory downloadsDirectory =
        Directory('storage/emulated/0/Pictures/Quotes');
    final condition = downloadsDirectory.existsSync();
    if (condition) {
      List<FileSystemEntity> files = downloadsDirectory.listSync();
      downloadsViewModel.setDownloads(files);
      return files;
    }
    return [];
  }

  static Future<String> isImageFileDownloaded(String fileName, context) async {
    final urlFileName = fileName.split('/').last.split('.').first;
    List<FileSystemEntity> files = getDownloadedFiles(context);

    if (files.isNotEmpty) {
      for (FileSystemEntity file in files) {
        if (file.absolute.path
            .split('/')
            .last
            .split('.')
            .first
            .contains(urlFileName)) {
          return file.absolute.path;
        }
      }
    }
    return '';
  }
}
