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
      body: Image.network(data['largeImageURL']),
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
