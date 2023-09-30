// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> tr = {
  "bottom": {
    "pokemon": "Pokemonlar",
    "berry": "Meyveler",
    "locations": "Konumlar"
  },
  "pokemon": {
    "all_pokemon": "Tüm Pokemonlar",
    "all_favorites": "Tüm Favoriler",
    "successful": "Başarılı",
    "saved_to_favorites": "Favorilere kaydedildi",
    "deleted_from_favorites": "Favorilerden silindi",
    "delete": "Sil",
    "pokemon": "Pokemon",
    "ekstra": "+20",
    "an_error_occurred": "Bir Hata Oluştu",
    "try_again": "Tekrar Dene!",
    "search_pokemon": "Pokemon Ara",
    "hp": "Can Puanı",
    "attack": "Saldırı",
    "defense": "Savunma",
    "special_attack": "Özel Saldırı",
    "special_defense": "Özel Savunma",
    "speed": "Hız",
    "average_power": "Ortalama Güç",
    "height": "Yükseklik:",
    "weight": "Ağırlık:",
    "bmi": "Vücut Kitle İndeksi:",
    "occurred_pokemon": "Pokemon getirilirken bir hata oluştu.",
    "detail_page": "Detay Sayfası"
  },
  "splash": {
    "pokemon": "Pokemon",
    "you_are_leaving": "Ayrılıyorsunuz.",
    "are_you_sure": "Ayrılmak istediğinize emin misiniz?",
    "leave": "Ayrıl",
    "cancel": "İptal et",
    "coming_soon": "Çok yakında"
  }
};
static const Map<String,dynamic> en = {
  "bottom": {
    "pokemon": "Pokemons",
    "berry": "Berries",
    "locations": "Locations"
  },
  "pokemon": {
    "all_pokemon": "All Pokemon",
    "all_favorites": "All Favorites",
    "successful": "Successful",
    "saved_to_favorites": "Saved to Favorites",
    "deleted_from_favorites": "Deleted from favorites",
    "delete": "Delete",
    "pokemon": "Pokemon",
    "ekstra": "+20",
    "an_error_occurred": "An Error Occurred",
    "try_again": "Try Again!",
    "search_pokemon": "Search Pokemon",
    "hp": "Hp",
    "attack": "Attack",
    "defense": "Defense",
    "special_attack": "Special Attack",
    "special_defense": "Special Defense",
    "speed": "Speed",
    "average_power": "Average Power",
    "height": "Height:",
    "weight": "Weight:",
    "bmi": "Bmi:",
    "occurred_pokemon": "An error occurred while fetching the Pokemon.",
    "detail_page": "Detail Page"
  },
  "splash": {
    "pokemon": "Pokemon",
    "you_are_leaving": "You are leaving.",
    "are_you_sure": "Are you sure you want to leave?",
    "leave": "Leave",
    "cancel": "Cancel",
    "coming_soon": "Coming Soon"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"tr": tr, "en": en};
}
