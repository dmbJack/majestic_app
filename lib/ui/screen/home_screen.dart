import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:majestic_app/ui/screen/movie_city_screen.dart';
import 'package:majestic_app/shared/widgets/drawer_list.dart';
import 'package:majestic_app/utils/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
        animationDuration: const Duration(milliseconds: 300),
        length: 4,
        child: Scaffold(
          drawer: Drawer(
            child: const DrawerList(),
            backgroundColor: kBackgroundColor.withOpacity(0.8),
          ),
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Image.asset(
              'assets/images/image_majestic.png',
              width: 50,
            ),
            bottom: tabListName(),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: TabBarView(
            children: [
              const MovieCityScreen(),
              Center(
                child: Lottie.asset(
                    'assets/lottie/lottie_loading_progress.json',
                    width: 95,
                    height: 95,
                    repeat: true),
              ),
              Center(
                child: Lottie.asset(
                    'assets/lottie/lottie_loading_progress.json',
                    width: 95,
                    height: 95,
                    repeat: true),
              ),
              Center(
                child: Lottie.asset(
                    'assets/lottie/lottie_loading_progress.json',
                    width: 95,
                    height: 95,
                    repeat: true),
              ),
            ],
          ),
        ));
  }

}
