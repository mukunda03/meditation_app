import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/splash/presentation/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pranic Healing Sanctuary',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.app,
      home: const SplashScreen(),
    );
  }
}
