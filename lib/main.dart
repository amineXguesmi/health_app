import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:health_app/core/services/user_service.dart';
import 'package:health_app/core/viewmodels/userVM.dart';
import 'package:health_app/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'core/services/auth_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServices();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserViewModel(),
        lazy: false,
      ),
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  ));
}

Future<void> setupServices() async {
  final getIt = GetIt.instance;
  getIt.registerSingletonAsync<AuthService>(
    () async {
      final authService = AuthService();
      await authService.init();
      debugPrint('auth service is READY');
      return authService;
    },
  );
  getIt.registerSingletonAsync<UserService>(() async {
    final userService = UserService();
    debugPrint('user service is READY');
    return userService;
  }, dependsOn: [InitDependency(AuthService)]);

  await getIt.allReady();
}
