import 'package:expense_tracker/controller/home_screen_controller.dart';
import 'package:expense_tracker/controller/name_database_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildNameWidget extends StatelessWidget {
  const BuildNameWidget({
    super.key,
    required TextEditingController textEditingController,
  }) : _textEditingController = textEditingController;

  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.isEditing = true;
            _textEditingController.text = Get.find<NameDatabaseController>().getName;
          },
          child:
              controller.getIsEditing
                  ? TextField(
                    autofocus: true,
                    controller: _textEditingController,
                    onSubmitted: (value) {
                      String name = value.trim().isEmpty ? 'Your Name' : value.trim();
                      controller.setName = name;
                      controller.isEditing = false;
                      Get.find<NameDatabaseController>().putNameInDB(name);
                    },
                  )
                  : Text(
                Get.find<NameDatabaseController>().getName,
                    style: TextStyle(color: Colors.white, fontSize: 22),
                    overflow: TextOverflow.ellipsis,
                  ),
        );
      },
    );
  }
}
