import 'package:ekyc_test/components/navigation.dart';
import 'package:ekyc_test/components/verify_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'components/logo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      title: 'eKYC Test',
      themeMode: ThemeMode.light,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              NavBar(),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return constraints.maxWidth < 600
                        ? Column(
                            children: [
                              Expanded(
                                child: FittedBox(
                                    fit: BoxFit.scaleDown, child: Logo()),
                              ),
                              Expanded(
                                child: FittedBox(
                                    fit: BoxFit.scaleDown, child: VerifyForm()),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: FittedBox(
                                    fit: BoxFit.scaleDown, child: Logo()),
                              ),
                              Expanded(
                                child: FittedBox(
                                    fit: BoxFit.scaleDown, child: VerifyForm()),
                              ),
                            ],
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
