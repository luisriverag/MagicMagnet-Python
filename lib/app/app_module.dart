import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:magic_magnet_engine/magic_magnet_engine.dart';
import 'package:shared_preferences_windows/shared_preferences_windows.dart';

import 'app_widget.dart';
import 'core/domain/usecases/get_enabled_usecases.dart';
import 'core/external/enabled_usecases_datasource_implementation.dart';
import 'core/infrastructure/repositories/enabled_usecases_repository_implementation.dart';
import 'core/presentation/controllers/app_controller.dart';
import 'modules/search/search_module.dart';
import 'modules/settings/settings_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController(i())),
        Bind((i) => http.Client()),
        Bind((i) => SharedPreferencesWindows()),
        Bind((i) => HttpClientImplementation(i())),
        Bind((i) => GoogleDataSourceImplementation(i())),
        Bind((i) => GoogleRepositoryImplementation(i())),
        Bind((i) => GetMagnetLinksFromGoogle(i())),
        Bind((i) => TPBDataSourceImplementation(i())),
        Bind((i) => TPBRepositoryImplementation(i())),
        Bind((i) => GetMagnetLinksFromTPB(i())),
        Bind((i) => I337XDataSourceImplementation(i())),
        Bind((i) => I337XRepositoryImplementation(i())),
        Bind((i) => GetMagnetLinksFrom1337X(i())),
        Bind((i) => NyaaDataSourceImplementation(i())),
        Bind((i) => NyaaRepositoryImplementation(i())),
        Bind((i) => GetMagnetLinksFromNyaa(i())),
        Bind((i) => EZTVDataSourceImplementation(i())),
        Bind((i) => EZTVRepositoryImplementation(i())),
        Bind((i) => GetMagnetLinksFromEZTV(i())),
        Bind((i) => YTSDataSourceImplementation(i())),
        Bind((i) => YTSRepositoryImplementation(i())),
        Bind((i) => GetMagnetLinksFromYTS(i())),
        Bind((i) => UsecasesDataSourceImplementation(i())),
        Bind((i) => EnabledUsecasesRepositoryImplementation(i())),
        Bind((i) => GetEnabledUsecases(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', module: SearchModule()),
        ModularRouter('/settings', module: SettingsModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
