import 'dart:io';
import 'package:flutter/material.dart';

class DownloadViewModel with ChangeNotifier{
  List<FileSystemEntity> _downloads = [];
  get downloads => _downloads;

  setDownloads(downloads){
    _downloads = downloads;
    notifyListeners();
  }
}