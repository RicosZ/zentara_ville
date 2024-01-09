import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zentara_ville/views/home_view.dart';

import 'bindings/home_bindings.dart';
import 'routes/app_pages.dart';

void main() {
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
        //showPerformanceOverlay: true, //กดเปิดเพื่อดูประสิทธิภาพ ms per frame
        // theme: Palette.themeData,
        home: HomeView(),
        initialBinding: HomeBinding(),
        //initialRoute: '/',// Route เริ่มต้น
        //unknownRoute: GetPage(name : '/notfound',page: (() => UnknownRoutePage())), //กรณีไม่มี Route ที่อยู่ใน GetPage
        getPages: AppPage.routes,
        // translations: AppTranslations(),
        // locale: const Locale('th', 'TH'),
        //locale: LocalStorage().getLocale(),
        // fallbackLocale:
        //     const Locale('th', 'TH'), //หากไม่มีภาษาที่เรียกใช้ให้มาภาษานี้แทน
        // ใช้เปลี่ยนภาษาของ calender
        // supportedLocales: const [Locale('th', 'TH'), Locale('en', 'GB')],
        //localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
        // localizationsDelegates: const [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
      ),
    );
  }
}
