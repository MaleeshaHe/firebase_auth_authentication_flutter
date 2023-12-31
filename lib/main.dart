import 'package:firebase_auth_authentication_flutter/firebase_options.dart';
import 'package:firebase_auth_authentication_flutter/models/user_model.dart';
import 'package:firebase_auth_authentication_flutter/providers/checking_provider.dart';
import 'package:firebase_auth_authentication_flutter/providers/error_add_provider.dart';
import 'package:firebase_auth_authentication_flutter/providers/machine_add_provider.dart';
import 'package:firebase_auth_authentication_flutter/screens/wrapper.dart';
import 'package:firebase_auth_authentication_flutter/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MachineAddProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ErrorAddProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckingProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      initialData: UserModel(uid: "uid"),
      value: AuthServices().user,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
