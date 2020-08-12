import 'package:moor/moor.dart';

import '../themes.dart';

part 'theme_prefs.g.dart';

// It will generate a table called "theme_prefs" for us. The rows of that table will
// be represented by a class called "ThemePref".
class ThemePrefs extends Table {
  // AppThemes id
  IntColumn get themeId => integer()();
  TextColumn get themeName => text()();
}

// Moor prepares database table
@UseMoor(tables: [ThemePrefs])
class MyDatabase extends _$MyDatabase {
  MyDatabase(QueryExecutor e) : super(e);

  // Bump schemaVersion whenever there's change.
  @override
  int get schemaVersion => 1;

  //Keeping it simple
  //reset the database whenever there's update.
  // Add light theme as default theme after first launch and upgrade
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onCreate: (Migrator m) {
      return m.createAll();
    }, onUpgrade: (Migrator m, int from, int to) async {
      m.deleteTable(themePrefs.actualTableName);
      m.createAll();
    }, beforeOpen: (details) async {
      if (details.wasCreated) {
        await into(themePrefs).insert(ThemePrefsCompanion(
          themeId: const Value(0),
          themeName: Value(AppThemes.light.toString()),
        ));
      }
    });
  }

  void activateTheme(AppThemes theme) {
    ThemePref pref =
        ThemePref(themeId: theme.index, themeName: theme.toString());
    into(themePrefs).insert(pref);
  }

  void deactivateTheme(int i) =>
      (delete(themePrefs)..where((t) => t.themeId.equals(i))).go();

  //The stream will automatically emit new items whenever the underlying data changes.
  Stream<bool> themeIdExists(int id) {
    return select(themePrefs)
        .watch()
        .map((prefs) => prefs.any((pref) => pref.themeId == id));
  }

  Future<ThemePref> getActiveTheme() {
    return select(themePrefs).getSingle();
  }
}
