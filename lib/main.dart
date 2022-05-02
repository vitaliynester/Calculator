import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calculator_provider.dart';
import 'calculator_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalculatorProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: CalculatorView(),
        ),
      ),
    );
  }
}
