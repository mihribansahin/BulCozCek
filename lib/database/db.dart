import 'package:bul_coz_cek_game/database/tables.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class db {
  static Database? _MyDb;

  static final String DATABASE_NAME = "bulcozcekdb";
  static final String TAG = (db).toString as String; //db.class.getName()
  static final int DATABASE_VERSION = 1;

  Future<Database?> get database async {
    if (_MyDb == null) {
      _MyDb = await initializeDatabase();
    }
    return _MyDb;
  }

  Future<Database> initializeDatabase() async {
    String dbDir = await getDatabasesPath();
    String dbPath = join(dbDir, DATABASE_NAME);
    var db = await openDatabase(dbPath, version: DATABASE_VERSION, onCreate: createDb);
    return await db;
  }

  //TabelCari id si yok!
  void createDb(Database db, int version) async {
    await db.execute("CREATE TABLE ${Users.tableName} (${Users.id} INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ${Users.username} TEXT, ${Users.point}  INTEGER DEFAULT 0 NOT NULL)");
    await db.execute("CREATE TABLE ${KarsilasmaAni.tableName}(${KarsilasmaAni.game_id}   INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT , ${KarsilasmaAni.first_player_id} INTEGER, ${KarsilasmaAni.first_player_name} TEXT,${KarsilasmaAni.second_player_id} INTEGER ,${KarsilasmaAni.second_player_name} TEXT, ${KarsilasmaAni.que_id} INTEGER DEFAULT 0 NOT NULL )");
    await db.execute("CREATE TABLE ${GecmisKarsilasmalar.tableName}(${GecmisKarsilasmalar.finished_game_id} INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ${GecmisKarsilasmalar.game_id} INTEGER,  ${GecmisKarsilasmalar.game_date} TEXT,${GecmisKarsilasmalar.score} INTEGER, ${GecmisKarsilasmalar.winner_player_name}  TEXT )");
    await db.execute("CREATE TABLE ${Questions.tableName}(${Questions.que_id}  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ${Questions.answer} TEXT, ${Questions.que_point} INTEGER ,${Questions.question} TEXT)");
  }
}