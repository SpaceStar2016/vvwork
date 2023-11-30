import 'cache/database.dart';


class AppSettings {

  static var db =  AppDatabase();

  static late List<VocabularyData> vocabularies;

  static initData() async {
    final database = AppSettings.db;
    vocabularies = await database.select(database.vocabulary).get();
  }
}
