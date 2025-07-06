
import 'package:get/get.dart';
import 'package:hive/hive.dart';


class NameDatabaseController extends GetxController{
  final _nameDB = Hive.box<String>('nameDB');
  final String _key = 'name';

  void putNameInDB(String name){
    _nameDB.put(_key, name);
  }

  String get getName => _nameDB.get(_key) ?? 'Enter Your Name';

}