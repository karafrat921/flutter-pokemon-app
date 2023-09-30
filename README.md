# flutter-pokemon-app

The purpose of this project is to create a template that adheres to standards for projects
initiated with Flutter. As much as possible, the project has been developed in a clean
architectural and test-driven development (TDD) compatible manner. While the project has been
attempted to be written in accordance with atomic design principles, design considerations have not 
been prioritized as much, as the focus has been on emphasizing logical processes.


## Features

- Clean Architecture
- MVVM
- Dependency Injection
- State Management
- Test Driven Development
- Localization
  
## License

[MIT](https://choosealicense.com/licenses/mit/)

  
## Screenshots

![Uygulama Ekran Görüntüsü](https://github.com/karafrat921/flutter-pokemon-app/blob/main/flutter_tdd_clean_architecture_mvvm/screenshot/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202023-09-30%20at%2015.13.16.png?raw=true)

![Uygulama Ekran Görüntüsü](https://github.com/karafrat921/flutter-pokemon-app/blob/main/flutter_tdd_clean_architecture_mvvm/screenshot/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202023-09-30%20at%2015.33.17.png?raw=true)


![Uygulama Ekran Görüntüsü](https://github.com/karafrat921/flutter-pokemon-app/blob/main/flutter_tdd_clean_architecture_mvvm/screenshot/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202023-09-30%20at%2015.13.25.png?raw=true)

![Uygulama Ekran Görüntüsü](https://github.com/karafrat921/flutter-pokemon-app/blob/main/flutter_tdd_clean_architecture_mvvm/screenshot/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202023-09-30%20at%2015.15.31.png?raw=true)


![Uygulama Ekran Görüntüsü](https://github.com/karafrat921/flutter-pokemon-app/blob/main/flutter_tdd_clean_architecture_mvvm/screenshot/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202023-09-30%20at%2015.16.53.png?raw=true)
## Technologies Used

**dependencies:**   
    flutter_svg,
    flutter_riverpod,
    lottie,
    http,
    equatable,
    get_it,
    hive_flutter,
    easy_localization,

**dev_dependencies:** 
    flutter_lints,
    mockito,
    build_runner,
    hive_generator,

  
## Folder Structure
lib
├── core
│   ├── api_helper
│   │   ├── api_base_helper.dart
│   │   ├── api_response.dart
│   │   └── app_exception.dart
│   ├── certificates
│   │   └── network_certificates.dart
│   ├── constants
│   │   ├── assets.dart
│   │   ├── color.dart
│   │   └── constants.dart
│   ├── enums
│   │   ├── snack_bar_type.dart
│   │   └── tab_item.dart
│   ├── extension
│   │   ├── response_event.dart
│   │   ├── router.dart
│   │   └── screen_size.dart
│   ├── helper
│   │   └── keyboard_unfocus.dart
│   ├── theme
│   │   └── my_theme.dart
│   ├── usecase
│   │   └── base_usecase.dart
│   └── utils
│       └── utils.dart
├── data
│   ├── datasources
│   │   ├── local_datasource
│   │   │   ├── local_datasource_imp.dart
│   │   │   └── local_datasource.dart
│   │   └── remote_datasource
│   │       ├── remote_datasource_imp.dart
│   │       └── remote_datasource.dart
│   ├── models
│   │   ├── pokemon_detail_model.dart
│   │   ├── pokemon_list_model.dart
│   │   └── pokemon_list_model.g.dart
│   └── repositories
│       └── pokemon_repository_impl.dart
├── domain
│   ├── entities
│   │   ├── basestat_entity.dart
│   │   ├── pokemon_detail_entity.dart
│   │   ├── pokemon_item_entity.dart
│   │   └── pokemon_list_entity.dart
│   ├── repositories
│   │   └── pokemon_repository.dart
│   └── usecases
│       ├── add_pokemon_by_name.dart
│       ├── clear_all_favorite_pokemon.dart
│       ├── get_favori_pokemon_list.dart
│       ├── get_pokemon_by_name.dart
│       ├── get_pokemons.dart
│       ├── is_pokemon_in_favorites.dart
│       └── remove_pokemon_by_name.dart
├── presentation
│   ├── bottom
│   │   ├── app.dart
│   │   ├── bottom_navigation.dart
│   │   ├── tab_item.dart
│   │   └── tab_navigator.dart
│   ├── pages
│   │   ├── other
│   │   │   └── coming_soon_page.dart
│   │   ├── pokemon
│   │   │   ├── components
│   │   │   │   ├── all_pokemon_widget.dart
│   │   │   │   └── favorite_pokemon_widget.dart
│   │   │   ├── pokemon_page.dart
│   │   │   ├── pokemon_viewmodel_imp.dart
│   │   │   └── pokemon_viewmodel.dart
│   │   ├── pokemon_detail
│   │   │   ├── pokemon_attributes.dart
│   │   │   ├── pokemon_detail_page.dart
│   │   │   ├── pokemon_detail_viewmodel_imp.dart
│   │   │   ├── pokemon_detail_viewmodel.dart
│   │   │   └── pokemon_size.dart
│   │   └── splash
│   │       └── splash_page.dart
│   └── widget
│       ├── animated_percentage_indicator.dart
│       ├── are_you_sure_exit_popup.dart
│       ├── custom_floating_action_button.dart
│       ├── custom_grid_delegate.dart
│       ├── custom_loading_widget.dart
│       ├── custom_sliver_appbar.dart
│       ├── custom_snack_bar.dart
│       ├── error_widget.dart
│       ├── favorite_item_widget.dart
│       ├── item_widget.dart
│       ├── percentage_painter.dart
│       ├── sliver_appbar_delegate_widget.dart
│       └── visibility_widget.dart
├── translations
│   ├── codegen_loader.g.dart
│   └── locale_keys.g.dart
├── injection.dart
└── main.dart

test
├── data
│   ├── datasources
│   │   ├── local_datasource
│   │   │   ├── local_datasource_test.dart
│   │   │   └── local_datasource_test.mocks.dart
│   │   └── remote_datasource
│   │       ├── remote_datasource_test.dart
│   │       └── remote_datasource_test.mocks.dart
│   ├── models
│   │   ├── pokemon_detail_json_mock.dart
│   │   └── pokemon_list_json_mock.dart
│   └── repositories
│       ├── pokemon_repository_impl_test.dart
│       └── pokemon_repository_impl_test.mocks.dart
├── domain
│   ├── entities
│   │   ├── pokemon_detail_entity_mock.dart
│   │   ├── pokemon_item_entity_mock.dart
│   │   └── pokemon_list_entity_mock.dart
│   └── usecases
│       ├── add_pokemon_by_name_test.dart
│       ├── add_pokemon_by_name_test.mocks.dart
│       ├── clear_all_favorite_pokemon_test.dart
│       ├── clear_all_favorite_pokemon_test.mocks.dart
│       ├── get_favori_pokemon_list_test.dart
│       ├── get_favori_pokemon_list_test.mocks.dart
│       ├── get_pokemon_by_name_test.dart
│       ├── get_pokemon_by_name_test.mocks.dart
│       ├── get_pokemons_test.dart
│       ├── get_pokemons_test.mocks.dart
│       ├── is_pokemon_in_favorites_test.dart
│       ├── is_pokemon_in_favorites_test.mocks.dart
│       ├── remove_pokemon_by_name_test.dart
│       └── remove_pokemon_by_name_test.mocks.dart
└── widget_test.dart
## Feedback

"If you have any feedback, please contact me at karafrat921@gmail.com"

  
## Authors and Acknowledgments

- [@Iamstanlee](https://github.com/Iamstanlee) I benefited from the data flow of the details page for Pokémon from the 'Iamstanlee' repository

  

