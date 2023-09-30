import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../core/constants/assets.dart';
import '../../translations/locale_keys.g.dart';

class AreYouSureExitPopup extends StatelessWidget {
  final Widget child;

  const AreYouSureExitPopup({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            barrierColor: Colors.black.withOpacity(.6),
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Column(
                  children: [
                     Text(LocaleKeys.splash_you_are_leaving.tr()),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Lottie.asset(Assets.animationAlert),
                    ),
                  ],
                ),
                content:  Text(LocaleKeys.splash_are_you_sure.tr()),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child:  Text(
                      LocaleKeys.splash_leave.tr(),
                      style: const TextStyle(color: Colors.black),
                    ),
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                  CupertinoDialogAction(
                    child:  Text(
                      LocaleKeys.splash_cancel.tr(),
                      style: const TextStyle(color: Colors.black),
                    ),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                ],
              );
            },
          ) ??
          false;
    }

    return WillPopScope(onWillPop: showExitPopup, child: child);
  }
}
