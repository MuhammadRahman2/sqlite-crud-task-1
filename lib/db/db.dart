import 'package:crud_sqflite/model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteDatabaseHelper {
  final String _tableName = "users";

  Future<Database> getDatabase() async {
    return openDatabase(
      // Created one _tableName String variable and give the required parameters to openDatabase().
      // join(await getDatabasesPath(),“usersDatabase.db”) this Code provides the String database location.
      // And in the inverted commas there is a database name given getDatabasesPath() function comes from the PathProvider plugin
      join(await getDatabasesPath(), "usersDatabase.db"),
      version: 1,
      onCreate: (db, version) async {
        // So this function contains the db.execute() function which executes our SQL query of creating a table
        db.execute('''CREATE TABLE IF NOT EXISTS $_tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,phoneNumber TEXT,imageUrl TEXT )
        ''');
      },
    );
  }

  // First Insert Function Which will take values and add them inside the Database
  Future<int> insertUser(User user) async {
    int userId = 0;
    Database db = await getDatabase();
    await db.insert(_tableName, user.toMap()).then((value) => userId = value);
    return userId;
  }

  Future<List<User>> getAllUsers() async {
    Database db = await getDatabase();
    List<Map<String, dynamic>> usersMaps = await db.query(_tableName);
    return List.generate(usersMaps.length, (index) {
      return User(
          id: usersMaps[index]["id"],
          name: usersMaps[index]["name"],
          phoneNumber: usersMaps[index]["phoneNumber"],
          imageUrl: usersMaps[index]["imageUrl"]);
    });
  }
}
