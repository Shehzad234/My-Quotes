import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/res/components/custom_button.dart';
import 'package:quotes_app/utils/utils.dart';
import 'package:quotes_app/view_model/home_view_model.dart';
class HomeRepo {
  static void setStream(context) async {
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    final stream = FirebaseFirestore.instance.collection('quotes').snapshots();
    await homeViewModel.setStream(stream);
  }

  static Future<void> checkStoragePermission(context) async {
    await Permission.storage.status.then((value) {
      if (!value.isGranted) {
        Permission.storage.request().then((value) {
          if (value.isDenied) {
            Utils.flushBarMessage(context, 'Storage permission is denied');
          }
        });
      } else if (value.isPermanentlyDenied) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text(
                  'Storage permission is permanently denied',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                actions: [
                  CustomButton(
                      text: 'No thanks',
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomButton(
                      text: 'Go to Settings',
                      onTap: () {
                        openAppSettings();
                      })
                ],
              );
            });
      }
    });
  }
}
