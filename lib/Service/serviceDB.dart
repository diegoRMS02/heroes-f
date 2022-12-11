import '../Helpers/exportsClass.dart';

class serviceDB {
  static Database? _dataBase;
  static final serviceDB DB = serviceDB.constDB();
  serviceDB.constDB();

  get dataBase async {
    if (_dataBase != null) return _dataBase;
    _dataBase = await iniciarDb();
    return _dataBase;
  }

  iniciarDb() async {
    //Ejecutaremos operaciones SQL
    //dEFINIR DONDE SE GUARDARA LA BASE DE DATOS
    Directory rutaDb = await getApplicationDocumentsDirectory();
  }
}
