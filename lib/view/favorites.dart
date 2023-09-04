import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/res/components/custom_appbar.dart';
import 'package:quotes_app/res/components/custom_drawer.dart';
import 'package:quotes_app/res/components/custom_grid.dart';
import 'package:quotes_app/view_model/favorites_view_model.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      title: "Favorites",
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
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                    ),
                    Consumer<FavoritesViewModel>(
                      builder: (context, value, child) {
                        if (value.favorites.isEmpty) {
                          return const Center(
                              child: Text(
                                  "There isn't any quote selected as Favorite."));
                        } else {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 1,
                            child: CustomGrid(
                              crossAxisCount: 2,
                              itemCount: value.favorites.length,
                              images: value.favorites,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
