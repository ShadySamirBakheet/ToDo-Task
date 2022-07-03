import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo/core/resources/routes_manager.dart';
import 'package:todo/core/resources/theme_manager.dart';
import 'package:todo/l10n/l10n.dart';
import 'package:todo/modules/todo/presentation/bloc/cubit/add_note_cubit.dart';
import 'package:todo/modules/todo/presentation/bloc/cubit/view_notes_cubit.dart';
import 'package:todo/modules/user/presentation/bloc/cubit/auth_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => AddNoteCubit(),
        ),
        BlocProvider(
          create: (context) => ViewNotesCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        // home: const LoginPage(),
        initialRoute: Routes.initRoute,
        onGenerateRoute: RouteGenerator.getRoute,
      ),
    );
  }
}
