import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String table = "clientes";
final String idColumn = "id_cliente";
final String nomeColumn = "nome_cliente";
final String emailColumn = "email_cliente";
final String cidadeColumn = "cidade_cliente";
final String enderecoColumn = "endereco_cliente";
final String cnpjColumn = "cnpj_cliente";
final String phoneColumn = "telefone_cliente";
final String senhaColumn = "senha_cliente";
final String imgColumn = "imgColumn";

class ContactHelper {
  static final ContactHelper _instance = ContactHelper.internal();

  factory ContactHelper() => _instance;

  ContactHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "clientes.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $table($idColumn INTEGER PRIMARY KEY, $nomeColumn TEXT, $emailColumn TEXT,"
          "$cidadeColumn TEXT, $enderecoColumn TEXT, $cnpjColumn TEXT, $phoneColumn TEXT, $senhaColumn TEXT, $imgColumn TEXT)");
    });
  }

  Future<Cliente> saveContact(Cliente contact) async {
    Database dbContact = await db;
    contact.id = await dbContact.insert(table, contact.toMap());
    return contact;
  }

  Future<Cliente> getContact(int id) async {
    Database dbContact = await db;
    List<Map> maps = await dbContact.query(table,
        columns: [idColumn, nomeColumn, emailColumn, cidadeColumn, enderecoColumn, cnpjColumn, phoneColumn, senhaColumn, imgColumn],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Cliente.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteContact(int id) async {
    Database dbContact = await db;
    return await dbContact
        .delete(table, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateContact(Cliente contact) async {
    Database dbContact = await db;
    return await dbContact.update(table, contact.toMap(),
        where: "$idColumn = ?", whereArgs: [contact.id]);
  }

  Future<List> getAllContacts() async {
    Database dbContact = await db;
    List listMap = await dbContact.rawQuery("SELECT * FROM $table");
    List<Cliente> listContact = List();
    for (Map m in listMap) {
      listContact.add(Cliente.fromMap(m));
    }
    return listContact;
  }

  Future<int> getNumber() async {
    Database dbContact = await db;
    return Sqflite.firstIntValue(
        await dbContact.rawQuery("SELECT COUNT(*) FROM $table"));
  }

  Future close() async {
    Database dbContact = await db;
    dbContact.close();
  }
}

class Cliente {
  int id;
  String name;
  String email;
  String cidade;
  String endereco;
  String cnpj;
  String phone;
  String senha;
  String img;

  Cliente();

  Cliente.fromMap(Map map) {
    id = map[idColumn];
    name = map[nomeColumn];
    email = map[emailColumn];
    cidade = map[cidadeColumn];
    endereco = map[enderecoColumn];
    cnpj = map[cnpjColumn];
    phone = map[phoneColumn];
    senha = map[senhaColumn];
    img = map[imgColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nomeColumn: name,
      emailColumn: email,
      cidadeColumn: cidade,
      enderecoColumn: endereco,
      cnpjColumn: cnpj,
      phoneColumn: phone,
      senhaColumn: senha,
      imgColumn: img
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Contact(id: $id, name: $name, email: $email, phone: $phone, img: $img)";
  }
}
