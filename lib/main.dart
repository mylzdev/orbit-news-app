import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app.dart';
import 'app/core/di/injection_container.dart' as di;
import 'app/core/di/injection_container.dart';
import 'app/core/utils/environment/environment.dart';
import 'app/features/article/data/datasources/local/article_local_datasource.dart';

void main() async {
  await dotenv.load(fileName: Environment.filename);
  di.init();
  await sl<ArticleLocalDatasource>().initDb();
  runApp(const App());
}
