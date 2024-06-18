import 'package:flutter/material.dart';

import 'app/app.dart';
import 'data/local/storage_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.init();

  runApp(const App());
}
