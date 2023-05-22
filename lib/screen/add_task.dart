import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanagementapp/controller/datacontroller.dart';
import 'package:taskmanagementapp/error_warning.dart';
import 'package:taskmanagementapp/screen/all_task.dart';

import '../utils/appcolot.dart';
import '../widget/buttonwidget.dart';
import '../widget/textfieldwidget.dart';
class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameControler = TextEditingController();
    TextEditingController detailController = TextEditingController();

    bool _dataValidation(){
      if(nameControler.text.trim() == ''){
      Message.taskErrorOrWarning("task_name", "your task name is empty");
        return false;
      }
      else if(detailController.text.trim() == ' '){
        Message.taskErrorOrWarning("task detail", "your task detailk is empty");

        return false;
      }
      return true;
    }
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20,right: 20),
        decoration: BoxDecoration(

            image: DecorationImage(
                fit: BoxFit.cover,
                image:AssetImage(
                    "assets/3.jpg"
                )
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 60,),
                IconButton(onPressed: (){
                  Get.back();
                }, icon: Icon(Icons.arrow_back , color: AppColors.secondaryColor,))

              ],

            ),
            Column(
              children: [
                TextFieldWidget(textController: nameControler, hintText: 'Task Name', borderRadius: 25 ,),
                SizedBox(height: 20,),
                TextFieldWidget(textController: detailController,maxLines: 4 , hintText: 'Task Details', borderRadius: 20),
                SizedBox(height: 15,),
                GestureDetector(
                  onTap: (){
                    _dataValidation();
                    if(_dataValidation()){
                      Get.find<DataController>().postData(
                      nameControler.text.trim(),detailController.text.trim() );
                      Get.to(()=>AllTask(),transition: Transition.cupertino);
                    }
                  },
                  child: ButtonWidget(backgroundcolor: AppColors.textGrey,
                         text: 'ADD', textColor: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/6,
            )
          ],
        ),
      ),
    );
  }
}