import 'package:flutter/material.dart';
import 'package:quotes_app/repo/about_repo.dart';
import 'package:quotes_app/res/components/custom_drawer.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.black,
            centerTitle: true,
            title: const Text(
              "About us",
              style: TextStyle(color: Colors.white),
            ),
      ),
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
              child: Stack(
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
                                top: Radius.circular(20)))),
                    ListView(
                      padding: const EdgeInsets.all(5),
                      physics: const BouncingScrollPhysics(),
                      children: [
                        InkWell(
                          onTap: () async {
                            const url =
                                'https://betabytetech.com/';
                            AboutRepo.visitWebsite(url: url);
                          },
                          child: Card(
                            color: Colors.grey[300],
                            child: ListTile(
                              title: const Text('Website'),
                              trailing: Text(
                                'Tap to visit',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.combine([
                                    TextDecoration.underline,
                                  ]),
                                  decorationColor: Colors.blue
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            const url =
                                'https://www.facebook.com/betabytetech/';
                            AboutRepo.visitWebsite(url: url);
                          },
                          child: Card(
                            color: Colors.grey[300],
                            child: ListTile(
                              title: const Text('Facebook'),
                              trailing: Text(
                                'Tap to visit',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.combine([
                                    TextDecoration.underline,
                                  ]),
                                  decorationColor: Colors.blue
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.grey[300],
                          child: const ListTile(
                            title: Text('Version'),
                            trailing: Text('1.0.0'),
                          ),
                        ),
                        Card(
                          color: Colors.grey[300],
                          child: const ListTile(
                            title: Text('File Path'),
                            trailing: Text('Images/Quotes'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
            ),
          ),
        ],
      ),
    );
  }
}
