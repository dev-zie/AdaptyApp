import 'package:adapty_app/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: TextWidget(text: 'Well done', fontsize: 28),
      )),
    );
  }
}