import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:places_api/api_client.dart';
import 'package:surf_places/feature/app.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton<Talker>(talker);

  await dotenv.load();

  GetIt.I.registerSingleton<DioClient>(
    DioClient(
      baseUrl: dotenv.env['API_URL']!,
      logger: TalkerDioLogger(
        talker: talker,
        settings: TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseData: false,
        ),
      ),
    ),
  );

  Bloc.observer = TalkerBlocObserver(talker: talker);

  runApp(const App());
}
