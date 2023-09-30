import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/core/extension/router.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/core/extension/screen_size.dart';
import 'package:lottie/lottie.dart';
import '../../../core/constants/assets.dart';
import '../../../main.dart';
import '../../../translations/locale_keys.g.dart';
import '../../bottom/app.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(pokemonViewModelImp).getPokemon().then((value) {
        const App().fadeTransitionReplace(context: context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: Container(
          height: context.screenHeight,
          width: context.screenWidth,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              Lottie.asset(Assets.pokemonLottie),
              Text(
                LocaleKeys.splash_pokemon.tr(),
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
              const Spacer(),
              const CupertinoActivityIndicator(radius: 20),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
