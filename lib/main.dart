import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/auth/login/login.dart';
import 'package:jci_remit_mobile/UI/auth/mobile/mobile_auth_screen.dart';
import 'package:jci_remit_mobile/UI/dashboard/dashboard_screen.dart';
import 'package:jci_remit_mobile/UI/splash/splash_screen.dart';
import 'package:jci_remit_mobile/controllers/auth_state.dart';
import 'package:jci_remit_mobile/services/storage/shared_prefs.dart';
import 'package:jci_remit_mobile/values/values.dart';

import 'controllers/auth_controller.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      title: 'JCI Remit Mobile',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        accentColor: AppColors.accentColor,
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: AppColors.accentColor)),
        textTheme: GoogleFonts.dmSansTextTheme(
            Theme.of(context)
                .textTheme
                .copyWith(
                    headline2: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        letterSpacing: -0.165,
                        color: AppColors.accentColor),
                    headline4: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        letterSpacing: -0.165,
                        color: AppColors.accentColor),
                    headline3: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        letterSpacing: -0.165,
                        color: AppColors.accentColor.withOpacity(0.8)))),
      ),
      home: AuthPageContainer(),
      onGenerateRoute: (_) => SplashScreen.route(),
    );
  }
}

class AuthPageContainer extends HookWidget {
  const AuthPageContainer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final state = useProvider(authControllerProvider.state);
    return Consumer(builder: (context, watch, child) {
      if (state is AuthAuthenticated) {
        return DashboardScreen();
      } else if (state is AuthUnauthenticated) {
        return LoginScreen();
      } else if (state is AuthNotVerified) {
        return MobileAuthScreen();
      }
      return LoginScreen();
    });
  }
}
