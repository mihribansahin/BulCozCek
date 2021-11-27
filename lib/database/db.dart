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
    await db.execute("CREATE TABLE ${TableUsers.tableName} (${TableUsers.id} INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ${TableUsers.username} TEXT, ${TableUsers.point}  INTEGER DEFAULT 0 NOT NULL)");
    await db.execute("CREATE TABLE ${TableKarsilasmaAni.tableName}(${TableKarsilasmaAni.game_id}   INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT , ${TableKarsilasmaAni.first_player_id} INTEGER, ${TableKarsilasmaAni.first_player_name} TEXT,${TableKarsilasmaAni.second_player_id} INTEGER ,${TableKarsilasmaAni.second_player_name} TEXT, ${TableKarsilasmaAni.que_id} INTEGER DEFAULT 0 NOT NULL )");
    await db.execute("CREATE TABLE ${TableGecmisKarsilasmalar.tableName}(${TableGecmisKarsilasmalar.finished_game_id} INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ${TableGecmisKarsilasmalar.game_id} INTEGER,  ${TableGecmisKarsilasmalar.game_date} TEXT,${TableGecmisKarsilasmalar.score} INTEGER, ${TableGecmisKarsilasmalar.winner_player_name}  TEXT )");
    await db.execute("CREATE TABLE ${TableQuestions.tableName}(${TableQuestions.que_id}  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ${TableQuestions.answer} TEXT, ${TableQuestions.que_point} INTEGER ,${TableQuestions.question} TEXT)");
  }
}