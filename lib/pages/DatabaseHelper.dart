import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class User {
  final String username;
  final String password;
  final String email;
  final String phone;

  User({
    required this.username,
    required this.password,
    required this.email,
    required this.phone,
  });
}

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'your_database.db');
    return await openDatabase(path, version: 1, onCreate: _createTable);
  }

  Future<void> _createTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY,
        username TEXT,
        email TEXT,
        phone TEXT,
        password TEXT
      )
    ''');
  }

  Future<User?> getUserr(String username) async {
    Database db = await database;
    List<Map<String, dynamic>> users = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
    );

    if (users.isNotEmpty) {
      // Convert the map to a User object
      return User(
        username: users.first['username'],
        password: users.first['password'],
        email: users.first['email'],
        phone: users.first['phone'],
      );
    } else {
      return null;
    }
  }
  Future<Map<String, dynamic>?> getUser(String username) async {
    Database db = await database;
    List<Map<String, dynamic>> users = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
    );

    if (users.isNotEmpty) {
      return users.first;
    } else {
      return null;
    }
  }


  Future<void> insertUser(User user) async {
    Database db = await database;
    await db.insert(
      'users',
      {
        'username': user.username,
        'email': user.email,
        'phone': user.phone,
        'password': user.password,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    Database db = await database;
    return await db.query('users');
  }
  Future<void> updateUser(int id, String username, String password) async {
    Database db = await database;
    await db.update(
      'users',
      {'id': id, 'username': username, 'password': password},
      where: 'id = ?',
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteUser(int userId) async {
    Database db = await database;
    await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [userId],
);
}
}
