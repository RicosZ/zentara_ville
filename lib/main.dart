import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:zentara_ville/views/home_view.dart';

import 'bindings/home_bindings.dart';
import 'routes/app_pages.dart';

void main() async {
  await initializeDateFormatting();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //แตะที่ว่างแล้วไม่ focus
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
          //FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      child: GetMaterialApp(
        title: 'Zentara Ville',
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
        initialBinding: HomeBinding(),
        getPages: AppPage.routes,
        fallbackLocale:
            const Locale('th', 'TH'), //หากไม่มีภาษาที่เรียกใช้ให้มาภาษานี้แทน
      ),
    );
  }
}
