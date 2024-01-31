import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class DBWord extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get word => text().withLength(min: 1, max: 32)();
  TextColumn get translation => text().named('body')();
  IntColumn get category => integer().nullable()();
}

@DriftDatabase(tables: [DBWord])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  // Future<int> deleteUser(int id) {
  //   return (delete(DBWord)..where((t) => t.id.equals(userId))).go();
  // }

}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
