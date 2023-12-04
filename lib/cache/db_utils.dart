import '../Model/vocabulary.dart';
import 'database.dart';

class DBUtils {
  static var db =  AppDatabase();
  static late List<DBWordData> dbWords;
  static List<Vocabulary> vocabularies = [];
  static initData() async {
    final database = DBUtils.db;
    dbWords = await database.select(database.dBWord).get();
    for(DBWordData data in dbWords){
      final vv = Vocabulary(word: data.word, translation: data.translation);
      vocabularies.add(vv);
    }
  }
  static addVocabulary(Vocabulary vv) async{
     await db.into(db.dBWord).insert(DBWordCompanion.insert(
      word: vv.word,
      translation: vv.translation,
    ));
  }
}