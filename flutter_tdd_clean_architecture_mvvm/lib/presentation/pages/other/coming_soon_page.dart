import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../core/constants/assets.dart';
import '../../../translations/locale_keys.g.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              Assets.animationDeveloper,
              fit: BoxFit.fill,
              repeat: false,
              width: MediaQuery.of(context).size.width * .6,
            ),
            const SizedBox(height: 15),
             Text(
              LocaleKeys.splash_coming_soon.tr(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
