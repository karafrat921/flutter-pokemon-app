import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/certificates/network_certificates.dart';
import 'core/theme/my_theme.dart';
import 'data/models/pokemon_list_model.dart';
import 'injection.dart' as di;
import 'presentation/pages/pokemon/pokemon_viewmodel.dart';
import 'presentation/pages/pokemon/pokemon_viewmodel_imp.dart';
import 'presentation/pages/pokemon_detail/pokemon_detail_viewmodel.dart';
import 'presentation/pages/pokemon_detail/pokemon_detail_viewmodel_imp.dart';
import 'presentation/pages/splash/splash_page.dart';

Future<void> main() async {
  ///Ensure that the Flutter bindings are initialized before starting the application.
  WidgetsFlutterBinding.ensureInitialized();

  ///Ensure that EasyLocalization is initialized before using language localization.
  await EasyLocalization.ensureInitialized();

  ///WARNING: Use only with trusted testing APIs!.
  ///It is used to ignore some security measures.
  HttpOverrides.global = MyHttpOverrides();

  ///Initialize Hive database
  await Hive.initFlutter();


  ///Register the adapter for the 'PokemonItem' class to work with Hive.
  Hive.registerAdapter<PokemonItem>(PokemonItemAdapter());

  ///Open a Hive box named "pokemon" for data storage and retrieval.
  await Hive.openBox("pokemon");

  ///Initialize application dependencies using the 'di' (dependency injection) framework.
  di.initializeDependencies();



  ///Forces the app to be used only in portrait mode.
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(
      ///Configure EasyLocalization for language localization.
      EasyLocalization(
        ///Here is the list of languages supported by the app
        supportedLocales: const [
          Locale('en'),
          Locale('tr'),
        ],

        ///Fallback to English if a language is not available
        fallbackLocale: const Locale('en'),

        ///Use only the language code for localization
        useOnlyLangCode: true,

        ///Use fallback translations if a translation is missing
        useFallbackTranslations: true,

        ///Path to language translation files
        path: "assets/lang",

        ///Wrap the main app widget with a provider scope for state management.
        child: const ProviderScope(
          child: MyApp(),
        ),
      ),
    );
  });
}

/// Define a provider for the PokemonViewModel using the ChangeNotifierProvider.
final pokemonViewModelImp = ChangeNotifierProvider<PokemonViewModel>((ref) => PokemonViewModelImp());
final pokemonDetailViewModelImp = ChangeNotifierProvider<PokemonDetailViewModel>((ref) => PokemonDetailViewModelImp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'Pokemon',
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),

      ///Set the supported locales for language localization based on the context.
      supportedLocales: context.supportedLocales,

      ///Set the current locale for language localization based on the context.
      locale: context.locale,

      ///Define the localization delegates to use for language localization based on the context.
      localizationsDelegates: context.localizationDelegates,
    );
  }
}
