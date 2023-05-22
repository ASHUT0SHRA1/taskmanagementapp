import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:taskmanagementapp/utils/appconstants.dart';

import '../services/service.dart';
class DataController extends GetxController{
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData =[];
  List<dynamic> get myData => _myData;
  Map<String , dynamic> _singleData = {};
  Map<String , dynamic> get singleData=> _singleData;
  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData(AppConstants.GET_TASKS);
    if(response.statusCode==200){
      _myData=response.body;
      print("we got the data");
    }else{
      print("we did not get any data");
    }
    _isLoading = false;
  }
  Future<void> getSingleData(String id) async {
    _isLoading = true;
    Response response = await service.getData('${AppConstants.GET_TASK}''?id=$id');
    if(response.statusCode==200){
      // _myData=response.body['data'];
      if(kDebugMode){
        print("we got the single data " + jsonEncode(response.body));
        _singleData=response.body;
      }
      update();

    }else{
      print("we could  not get any sigle  data");
    }
    _isLoading = false;

  }
  // Future<void> postData(String task_name,String taskDetail) async {
  //   _isLoading = true;
  //   Response response = await service.postData({
  //     "task_name" : task,
  //     "task-detail": taskDetail
  //   });
  //   if(response.statusCode==200){
  //     update();
  //     print("data post successful");
  //   }
  //   else{
  //     print("we fail get any data");
  //   }
  //
  // }
  Future<void> postData(String taskName,String taskDetail) async {
    _isLoading = true;
      Response response = await service.postData(AppConstants.POST_TASK,{
        "task_name" : taskName,
        "task_detail": taskDetail
      });
    if(response.statusCode==200){
      _myData=response.body['data'];
      print("data post suceesful");

    }else{
      print("we fail to get any data");
    }
    _isLoading = false;
    update();
  }
}