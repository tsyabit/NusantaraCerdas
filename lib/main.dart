
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation/app_routes.dart';
import 'models/favorit_model.dart';
import 'models/pengajuan_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FavoritModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => PengajuanModel(),
        ),
      ],

      child: MaterialApp(
        title: 'Nusantara Cerdas Mobile',
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF176B4D),
          ),
          useMaterial3: true,
          scaffoldBackgroundColor:
              const Color(0xFFF5F8F6),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF176B4D),
            foregroundColor: Colors.white,
            centerTitle: true,
          ),
        ),

        initialRoute: AppRoutes.utama,
        routes: AppRoutes.routes,
        onUnknownRoute: AppRoutes.onUnknownRoute,
      ),
    );
  }
}
