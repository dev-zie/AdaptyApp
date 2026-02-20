import 'package:adapty_app/presentation/views/main_view.dart';
import 'package:adapty_app/presentation/widgets/button_widget.dart';
import 'package:adapty_app/presentation/widgets/text_widget.dart';
import 'package:adapty_app/state/premium_state.dart';
import 'package:flutter/material.dart';

class InAppView extends StatelessWidget {
  const InAppView({super.key});

  void buy(BuildContext context, bool succes) async {
    await Future.delayed(Duration(seconds: 1));
    if (succes) {
      await PremiumState.savePremiumStatus(true);
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (_) => AlertDialog(
          title: TextWidget(
            fontsize: 30,
            text: 'Payment Completed',
            textAlign: TextAlign.center,
          ),
        ),
      );
      await Future.delayed(Duration(seconds: 2));

      Navigator.pop(context);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MainView();
          },
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: TextWidget(
            text: 'Your payment has not been made',
            fontsize: 30,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  void restorePurchase(BuildContext context) async {
    await PremiumState.loadPremiumStatus();
    if (PremiumState.isPremium) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainView()),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: TextWidget(
            text: 'No previous purchase found',
            fontsize: 24,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              text: 'Per Month Price\n \$19.99',
              fontsize: 28,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ButtonWidget(onPressed: () => buy(context, true), text: 'Buy'),
            ButtonWidget(
              text: 'Restore Purchase',
              onPressed: () => restorePurchase(context),
            ),
          ],
        ),
      ),
    );
  }
}
