import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/repo/home_repo.dart';
import 'package:quotes_app/res/components/custom_chip.dart';
import 'package:quotes_app/res/components/custom_drawer.dart';
import 'package:quotes_app/res/components/home_card.dart';
import 'package:quotes_app/res/constants/app_fonts.dart';
import 'package:quotes_app/utils/utils.dart';
import 'package:quotes_app/view_model/download_view_model.dart';
import 'package:quotes_app/view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final Connectivity connectivity = Connectivity();

  @override
  void initState() {
    super.initState();
    HomeRepo.setStream(context);
    connectivity.onConnectivityChanged.listen(onConnectivityChanged);
  }

  void onConnectivityChanged(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      Utils.flushBarMessage(context, 'No Internet Connection');
    } else {
      Utils.flushBarMessage(context, 'Intenet Connected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, homeViewModel, child) {
        return Scaffold(
          key: scaffoldKey,
          drawer: const CustomDrawer(),
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  if (scaffoldKey.currentState!.isDrawerOpen) {
                    scaffoldKey.currentState!.closeDrawer();
                  } else {
                    scaffoldKey.currentState!.openDrawer();
                  }
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                )),
            iconTheme: const IconThemeData(color: Colors.white),
            // foregroundColor: Colors.white,
            // actionsIconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.black,
            centerTitle: true,
            title: const Text(
              "Quotes",
              style: TextStyle(
                color: Colors.white,
                fontFamily: adelia,
                fontSize: 16,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    CustomChip(labelText: 'Attitude'),
                    CustomChip(labelText: 'Travel'),
                    CustomChip(labelText: 'Love'),
                    CustomChip(labelText: 'Gym'),
                    CustomChip(labelText: 'Motivational'),
                  ],
                ),
              ),
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
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: StreamBuilder(
                          stream: homeViewModel.stream,
                          builder: (context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (snapshot.data!.docs.isEmpty) {
                              return const Center(
                                  child: Text("There isn't any data."));
                            } else {
                              return SizedBox(
                                height: MediaQuery.of(context).size.height * 1,
                                child: Consumer<DownloadViewModel>(
                                  builder: (BuildContext context,
                                      downloadViewModel, child) {
                                    return ListView.builder(
                                      padding: const EdgeInsets.all(5),
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        return HomeCard(
                                          imageUrl: snapshot.data!.docs[index]
                                              ['imageUrl'],
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
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
