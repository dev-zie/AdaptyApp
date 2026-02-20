import 'package:adapty_app/presentation/views/in_app_view.dart';
import 'package:adapty_app/presentation/views/main_view.dart';
import 'package:adapty_app/state/premium_state.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PremiumState.loadPremiumStatus();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: PremiumState.isPremium ? MainView() : InAppView(),
    );
  }
}
