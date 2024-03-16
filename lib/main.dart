import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_listing_test/app.dart';
import 'package:form_listing_test/core/resources/injector/di.dart' as di;
import 'package:form_listing_test/core/resources/repositories/repository.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await di.initializeDI();
  print('Initialized DI. Checking Repository registration: ${di.sl.isRegistered<Repository>()}');

  runApp(const AppWidget());
}
