import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:islamic_dua_app/models/dua.dart';
import 'package:islamic_dua_app/models/reminder.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'islamic_app.db');
    
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Create duas table
    await db.execute('''
      CREATE TABLE duas(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        arabic_text TEXT NOT NULL,
        bengali_translation TEXT,
        english_translation TEXT,
        transliteration TEXT,
        category TEXT,
        audio_url TEXT,
        tags TEXT
      )
    ''');

    // Create reminders table
    await db.execute('''
      CREATE TABLE reminders(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        time TEXT NOT NULL,
        selected_days TEXT,
        is_enabled INTEGER DEFAULT 1,
        dua_id INTEGER,
        FOREIGN KEY (dua_id) REFERENCES duas (id)
      )
    ''');

    // Insert sample data
    await _insertSampleData(db);
  }

  Future<void> _insertSampleData(Database db) async {
    final sampleDuas = [
      {
        'arabic_text': 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
        'bengali_translation': 'পরম করুণাময় অসীম দয়ালু আল্লাহর নামে শুরু করছি',
        'english_translation': 'In the name of Allah, the Most Gracious, the Most Merciful',
        'transliteration': 'Bismillahir Rahmanir Rahim',
        'category': 'general',
        'tags': 'daily,bismillah,start'
      },
      {
        'arabic_text': 'اللَّهُمَّ بِكَ أَصْبَحْنَا وَبِكَ أَمْسَيْنَا',
        'bengali_translation': 'হে আল্লাহ! আপনার নামেই আমরা সকাল করেছি এবং আপনার নামেই সন্ধ্যা করি',
        'english_translation': 'O Allah, by You we have reached the morning and by You we reach the evening',
        'transliteration': 'Allahumma bika asbahna wa bika amsayna',
        'category': 'morning',
        'tags': 'morning,daily,protection'
      },
    ];

    for (var dua in sampleDuas) {
      await db.insert('duas', dua);
    }
  }

  // CRUD operations for Duas
  Future<List<Dua>> getAllDuas() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('duas');
    return List.generate(maps.length, (i) => Dua.fromMap(maps[i]));
  }

  Future<List<Dua>> getDuasByCategory(String category) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'duas',
      where: 'category = ?',
      whereArgs: [category],
    );
    return List.generate(maps.length, (i) => Dua.fromMap(maps[i]));
  }

  Future<int> insertDua(Dua dua) async {
    final db = await database;
    return await db.insert('duas', dua.toMap());
  }

  // CRUD operations for Reminders
  Future<List<Reminder>> getAllReminders() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('reminders');
    return List.generate(maps.length, (i) => Reminder.fromMap(maps[i]));
  }

  Future<int> insertReminder(Reminder reminder) async {
    final db = await database;
    return await db.insert('reminders', reminder.toMap());
  }

  Future<int> updateReminder(Reminder reminder) async {
    final db = await database;
    return await db.update(
      'reminders',
      reminder.toMap(),
      where: 'id = ?',
      whereArgs: [reminder.id],
    );
  }

  Future<int> deleteReminder(int id) async {
    final db = await database;
    return await db.delete(
      'reminders',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}