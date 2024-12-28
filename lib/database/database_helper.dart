import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:media_hub/audio/playlist_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper(){
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'media_hub_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE audio_playlist(
    playlistId TEXT PRIMARY KEY,
     )
    ''');
  }
}

//Tables
//Playlist
//playback history (audio play history, video play history)