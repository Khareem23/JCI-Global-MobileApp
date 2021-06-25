import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/auth/login/login.dart';
import 'package:jci_remit_mobile/UI/auth/mobile/mobile_auth_screen.dart';
import 'package:jci_remit_mobile/UI/dashboard/dashboard_screen.dart';
import 'package:jci_remit_mobile/UI/splash/splash_screen.dart';
import 'package:jci_remit_mobile/controllers/auth_state.dart';
import 'package:jci_remit_mobile/services/storage/shared_prefs.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/values/values.dart';

import 'controllers/auth_controller.dart';
import 'utils/navigator.dart';

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? newValue) {
    print('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  await StorageUtil.getInstance();
  // HttpOverrides.global = new MyHttpOverrides();
  runApp(ProviderScope(observers: [Logger()], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigator.key,
      title: 'JCI Remit Mobile',
      theme: context.themeData,
      home: AuthPageContainer(),
      onGenerateRoute: (_) => SplashScreen.route(),
    );
  }
}

class AuthPageContainer extends HookWidget {
  const AuthPageContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final state = useProvider(authControllerProvider);
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
