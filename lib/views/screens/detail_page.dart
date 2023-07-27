import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.network(
                "https://i.pinimg.com/564x/f1/99/db/f199db479672d76c3c439901fcc9415a.jpg",
                fit: BoxFit.fitHeight,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 640,
                    width: 310,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        data['largeImageURL'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AsyncWallpaper.setWallpaper(
            url: data['largeImageURL'],
            goToHome: true,
            wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
            toastDetails: ToastDetails.success(),
            errorToastDetails: ToastDetails.error(),
          );
        },
        child: const Icon(Icons.settings_system_daydream_rounded),
      ),
    );
  }
}
