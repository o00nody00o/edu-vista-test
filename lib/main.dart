// ignore_for_file: prefer_const_constructors

// import 'package:device_preview/device_preview.dart';
// import 'package:edu_vista_test/firebase_options.dart';
// import 'package:edu_vista_test/pages/loginPage.dart';
// import 'package:edu_vista_test/pages/signUpPage.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// void main() {
//   try {
//     Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//     print('SUCCESS >>>>>> FIREBASE CREATED');
//   } catch (e) {
//     print('FAILED to initialize firebase >>>>>>>>>>>>>>>> $e ');
//   }
//   runApp(DevicePreview(enabled: true, builder: (context) => MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home:  LoginPage(),
//     );
//   }
// }
import 'dart:ui';


import 'package:edu_vista_test/cubid/eng_auth_cubit.dart';
import 'package:edu_vista_test/firebase_options.dart';
import 'package:edu_vista_test/pages/eng_login_page.dart';
import 'package:edu_vista_test/pages/eng_signup.dart';
import 'package:edu_vista_test/widgets/eng_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await PreferencesService.init();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Failed to initialize Firebase: $e');
  }
  // await dotenv.load(fileName: ".env");

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (ctx) => AuthCubit()),
      // BlocProvider(create: (ctx) => CourseBloc()),
      // BlocProvider(create: (ctx) => LectureBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: _CustomScrollBehaviour(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorUtility.gbScaffold,
        fontFamily: ' PlusJakartaSans',
        colorScheme: ColorScheme.fromSeed(seedColor: ColorUtility.main),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        final String routeName = settings.name ?? '';
        final dynamic data = settings.arguments;
        switch (routeName) {
          case LoginPage.id:
            return MaterialPageRoute(builder: (context) => LoginPage());
          case SignUpPage.id:
            return MaterialPageRoute(builder: (context) => SignUpPage());
          // case ResetPasswordPage.id:
          //   return MaterialPageRoute(builder: (context) => ResetPasswordPage());
          // case OnBoardingPage.id:
          //   return MaterialPageRoute(builder: (context) => OnBoardingPage());
          // case HomePage.id:
          //   return MaterialPageRoute(builder: (context) => HomePage());
          // case CourseDetailsPage.id:
            // return MaterialPageRoute(
            //     builder: (context) => CourseDetailsPage(
            //           course: data,
            //         ));

          // default:
          //   return MaterialPageRoute(builder: (context) => SplashPage());
        }
      },
      // initialRoute: SplashPage.id,
    );
  }
}

class _CustomScrollBehaviour extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
      };
}