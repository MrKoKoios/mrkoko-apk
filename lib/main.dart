import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:permission_handler/permission_handler.dart';

import 'screens/home_screen.dart';
import 'screens/overlay_screen.dart';

/// Entry point for the floating overlay.
///
/// IMPORTANT:
/// flutter_overlay_window starts this function in a separate
/// Flutter engine when the overlay is opened.
@pragma("vm:entry-point")
void overlayMain() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const OverlayApp());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(const MrKokoApp());
}

class MrKokoApp extends StatelessWidget {
  const MrKokoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MR KOKO Signal Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00FF88),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF020408),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class OverlayApp extends StatelessWidget {
  const OverlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OverlayScreen(),
    );
  }
}
