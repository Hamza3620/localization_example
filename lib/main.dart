import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
        Locale('fr', ''),
        Locale('ar', ''),
        Locale('ur', ''),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // SIGN UP

                // Full name
                // Email Address
                // Password
                // 5 digit code

                // Register

                // Translated ->
                const FlutterLogo(
                  size: 150,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.emailAddress,
                      label: Text(AppLocalizations.of(context)!.emailAddress)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.emailCannotBeEmpty;
                    } else if (!value.isValidEmail()) {
                      return AppLocalizations.of(context)!.emailFormatIncorrect;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.password,
                      label: Text(AppLocalizations.of(context)!.password)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!
                          .passwordCannotBeEmpty;
                    } else if (value.length < 6) {
                      return AppLocalizations.of(context)!.passwordLength;
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // add firebase login
                          // _formKey.currentState.
                        }
                      },
                      child: Text(AppLocalizations.of(context)!.login),
                    ))
                  ],
                ),
                ListTile(
                  title: Text(DateFormat('yyyy-MM-dd',
                          AppLocalizations.of(context)!.localeName)
                      .format(today)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
