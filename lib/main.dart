import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:wc_dart_framework/wc_dart_framework.dart';
import 'blocs/singleton_bloc.dart';
import 'router/app_router.dart';
import 'themes/themes.dart';
import 'translations/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LoggingUtils.initialize();

  await dotenv.load();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory(
              (await path_provider.getApplicationDocumentsDirectory()).path,
            ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: singletonBloc.profileBloc)],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp.router(
          title: 'Hun Nest',
          theme: getTheme(),
          routerConfig: appRouter,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
  }
}
