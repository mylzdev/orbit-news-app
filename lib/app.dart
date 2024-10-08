import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/utils/constant/colors.dart';
import 'app/features/article/presentation/article_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light()
          .copyWith(scaffoldBackgroundColor: TColors.scaffoldColor),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: const ArticlePage(),
    );
  }
}
