import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagementapp/utils/appcolot.dart';
import 'package:get/get.dart';
class Message {
  static void taskErrorOrWarning(String taskName,String taskErrorOrWarning){
    Get.snackbar(taskName,taskErrorOrWarning,
    backgroundColor :AppColors.mainColor,
      titleText: Text(taskName, style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),

      ),
      messageText: Text(taskErrorOrWarning, style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
      )
    );
  }
}