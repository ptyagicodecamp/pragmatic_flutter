import 'dart:io';

import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as paths;

import '../theme_prefs.dart';

//Note: Implementation borrowed from this To Do App Template project
//https://github.com/appleeducate/moor_shared
MyDatabase constructDb({bool logStatements = false}) {
  if (Platform.isIOS || Platform.isAndroid) {
    final executor = LazyDatabase(() async {
      final dataDir = await paths.getApplicationDocumentsDirectory();
      final dbFile = File(p.join(dataDir.path, 'db.sqlite'));
      return VmDatabase(dbFile, logStatements: logStatements);
    });
    return MyDatabase(executor);
  }
  if (Platform.isMacOS || Platform.isLinux) {
    final file = File('db.sqlite');
    return MyDatabase(VmDatabase(file, logStatements: logStatements));
  }
  if (Platform.isWindows) {
    final file = File('db.sqlite');
    return MyDatabase(VmDatabase(file, logStatements: logStatements));
  }
  return MyDatabase(VmDatabase.memory(logStatements: logStatements));
}
