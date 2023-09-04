import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/res/constants/app_fonts.dart';
import 'package:quotes_app/utils/routes/routes_name.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Drawer(
      width: w * 0.7,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Center(
                  child: Text(
                'Quotes',
                style: TextStyle(
                    fontFamily: adelia, color: Colors.white, fontSize: 22),
              )),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutesName.homeScreen,
                  (Route<dynamic> route) =>
                      route.settings.name ==
                      ModalRoute.of(context)!.settings.name),
            ),
            ListTile(
              leading: const Icon(Icons.favorite_border_sharp),
              title: const Text('Favorites'),
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutesName.favoritesScreen,
                  (Route<dynamic> route) =>
                      route.settings.name ==
                      ModalRoute.of(context)!.settings.name),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.arrow_down_to_line),
              title: const Text('Downloads'),
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutesName.downloadsScreen,
                  (Route<dynamic> route) =>
                      route.settings.name ==
                      ModalRoute.of(context)!.settings.name),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(CupertinoIcons.star),
              title: Text('Rate App'),
              onTap: null,
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.mail),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pushNamed(context, RoutesName.contactUsScreen);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.info),
              title: const Text('About Us'),
              onTap: () {
                Navigator.pushNamed(context, RoutesName.aboutUsScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
