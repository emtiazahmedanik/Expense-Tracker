import 'package:get/get.dart';

class HomeScreenController extends GetxController{
  bool _isEditing = false;
  set isEditing(value){
    _isEditing = value;
    update();
  }
  bool get getIsEditing => _isEditing;
  String _name = 'Your Name';
  set setName(value){
    _name = value;
    update();
  }
  String get name => _name;


}