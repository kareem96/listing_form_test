import 'package:flutter/material.dart';
import 'package:form_listing_test/core/routes/router_import.dart' as app_router;
import 'package:form_listing_test/core/utils/theme/theme.dart';
import 'package:form_listing_test/presentation/provider/detail_provider.dart';
import 'package:form_listing_test/presentation/provider/home_provider.dart';
import 'package:form_listing_test/presentation/provider/input_provider.dart';
import 'package:form_listing_test/presentation/provider/page_provider.dart';
import 'package:provider/provider.dart';
import 'package:form_listing_test/core/resources/injector/di.dart' as di;

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final _router = app_router.AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PageProvider>(create: (_) => di.sl<PageProvider>()),
        ChangeNotifierProvider<HomeProvider>(create: (_) => di.sl<HomeProvider>()),
        ChangeNotifierProvider<InputProvider>(create: (_) => di.sl<InputProvider>()),
        ChangeNotifierProvider<DetailProvider>(create: (_) => di.sl<DetailProvider>()),
      ],
      child: MaterialApp.router(
        theme: AppTheme.light,
        locale: const Locale('id'),
        routerDelegate: _router.delegate(
          navigatorObservers: () => [app_router.RouterObserver()],
        ),
        routeInformationParser: _router.defaultRouteParser(),
      ),
    );
  }
}
