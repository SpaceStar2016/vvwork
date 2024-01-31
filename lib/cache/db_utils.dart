import 'package:drift/drift.dart';

import '../Model/vocabulary.dart';
import 'database.dart';

class DBUtils {
  static var db = AppDatabase();
  static int maxId = 1;
  static late List<DBWordData> dbWords;
  static List<Vocabulary> vocabularies = [];
  static initData() async {
    vocabularies.clear();
    final database = DBUtils.db;
    dbWords = await database.select(database.dBWord).get();
    for (DBWordData data in dbWords.reversed) {
      final vv = Vocabulary(word: data.word, translation: data.translation);
      maxId = maxId > data.id ? maxId : data.id;
      vv.id = data.id;
      vocabularies.add(vv);
    }
  }

  static addVocabulary(Vocabulary vv) async {
    maxId = maxId + 1;
    vv.id = maxId;
    await db.into(db.dBWord).insert(DBWordCompanion.insert(
          id: Value(maxId),
          word: vv.word,
          translation: vv.translation,
        ));
    vocabularies.insert(0, vv);
  }

  static deleteVocabulary(Vocabulary vv) async {
    if (vv.id == null) {
      return;
    }
    final id = vv.id!;
    // go 方法必须要
    (db.delete(db.dBWord)..where((t) => t.id.equals(id))).go();
    //
    vocabularies.remove(vv);
  }
}
