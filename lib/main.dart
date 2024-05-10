import 'package:countries/provider/country_provider.dart';
import 'package:countries/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // Using MultiProvider to provide multiple providers to the widget tree
    MultiProvider(
      providers: [
        // Providing the ChangeNotifierProvider for managing state using the CountryProvider
        ChangeNotifierProvider(create: (_) => CountryProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage());
  }
}
