import 'package:amazon_clone_nodejs/common/widgets/bottom_navbar.dart';
import 'package:amazon_clone_nodejs/constants/global_variables.dart';
import 'package:amazon_clone_nodejs/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone_nodejs/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_nodejs/features/auth/services/auth_service.dart';

import 'package:amazon_clone_nodejs/providers/user_provider.dart';
import 'package:amazon_clone_nodejs/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amazon CLone',
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: GlobalVariables.secondaryColor),
          appBarTheme: const AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (settings) => genrateRoute(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type == 'user'
                ? BottomBar()
                : AdminScreen()
            : AuthScreen());
  }
}


//5:47
