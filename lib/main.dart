import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/app/features/article/data/datasources/local/article_local_datasource.dart';
import 'package:news_app/injection_container.dart' as di;

import 'app.dart';
import 'app/core/utils/environment/environment.dart';
import 'injection_container.dart';

void main() async {
  await dotenv.load(fileName: Environment.filename);
  di.init();
  // TODO : Put this inside di.init()
  await sl<ArticleLocalDatasource>().initDb();
  // TODO : Test
  runApp(const App());
}
