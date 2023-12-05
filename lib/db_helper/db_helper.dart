import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MyDBHelper {
  var Row_WallPaper_TABLE = "Wallpaper_Saved";
  var Colum_Wallpaper_ID = "wallpaper_id";
  var Colum_Wallpaper_Image = "img";

  Future<Database> openDB() async {
    var mDirectory = await getApplicationDocumentsDirectory();
    await mDirectory.create(recursive: true);
    var dbpath = "$mDirectory/wallpaperdb.db";

    return await openDatabase(dbpath, version: 1, onCreate: (db, version) {
      var createTableQuery =
          "CREATE TABLE $Row_WallPaper_TABLE ($Colum_Wallpaper_ID INTEGER PRIMARY KEY AUTOINCREMENT, $Colum_Wallpaper_Image text)";
      db.execute(createTableQuery);
    });
  }

  Future<bool> addNote({required String id, required String img}) async {
    var db = await openDB();

    var check = await db.insert(Row_WallPaper_TABLE,
        {Colum_Wallpaper_ID: id, Colum_Wallpaper_Image: img});
    return check > 0;
  }

  Future<List<Map<String, dynamic>>> fetchAllNotes() async {
    var db = await openDB();
    List<Map<String, dynamic>> notes = await db.query(Row_WallPaper_TABLE);
    return notes;
  }

  /*  Future<bool> updateNotes(int id, String title, String desc) async {
    var db = await openDB();
    var chack = await db.update(
        NOTE_TABLE, {COLUM_NOTE_TITLE: title, COLUM_NOTE_DESC: desc},
        where: "$COLUM_NOTE_ID = $id");
    return chack > 0;
  }

  Future<bool> deletNotes(int id) async {
    var db = await openDB();
    var check = await db
        .delete(NOTE_TABLE, where: "$COLUM_NOTE_ID = ?", whereArgs: ["$id"]);
    return check > 0;
  } */
}
