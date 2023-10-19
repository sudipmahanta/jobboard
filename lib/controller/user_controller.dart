import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobboard/constants/api_strings/api_strings.dart';
import 'package:jobboard/constants/utils/colors.dart';
import 'package:jobboard/model/single_user_model.dart';
import 'package:jobboard/model/user_model.dart';

import '../model/add_user_model.dart';

class UserController extends GetxController {

  TextEditingController nameController = TextEditingController();

  Rx<AllUserModel> allUserDataModel = AllUserModel().obs;
  Rx<SingleUserModel> singleUserDataModel = SingleUserModel().obs;
  Rx<AddUserModel> addUserDataModel = AddUserModel().obs;

  RxBool isLoading = false.obs;
  RxBool fetchUser = false.obs;
  RxBool addUserLoading = false.obs;

  Future<void> getAllUser() async {

    try{
      AllUserModel allUserModel = AllUserModel();
      isLoading.value = true;

      http.Response response = await http.get(Uri.parse(ApiStrings.getUsers));
      allUserModel = allUserModelFromJson(response.body);
      debugPrint(response.statusCode.toString());
      if(response.statusCode == 200) {
        isLoading.value = false;
        allUserDataModel.value = allUserModel;
      }
    }catch(e){
      isLoading.value = false;
      Get.snackbar("User", e.toString(),
          colorText: Colors.black,
          backgroundColor: Colors.white54
      );
    }
  }

  Future<void> getUserDetail(int id) async{
    fetchUser.value = true;
    try{
      SingleUserModel singleUserModel = SingleUserModel();
      fetchUser.value = true;

      http.Response response = await http.get(Uri.parse("${ApiStrings.getUsers}/$id"));
      singleUserModel = singleUserModelFromJson(response.body);
      debugPrint(response.statusCode.toString());
      if(response.statusCode == 200) {
        fetchUser.value = false;
        singleUserDataModel.value = singleUserModel;
      }
    }catch(e){
      isLoading.value = false;
      Get.snackbar("User", e.toString(),
          colorText: Colors.black,
          backgroundColor: Colors.white54
      );
    }
  }

  Future<void> addUser(String job) async{
    try{
      addUserLoading.value = true;

      AddUserModel userModel = AddUserModel();
      Map<String, dynamic> body = {
        "name": nameController.text.toString(),
        "job": job.toString()
      };
      debugPrint(body.toString());
      http.Response response = await http.post(Uri.parse(ApiStrings.getUsers), body: jsonEncode(body));
      userModel = addUserModelFromJson(response.body);

      debugPrint(response.statusCode.toString());
      debugPrint(response.body);

      if(response.statusCode == 201) {
        addUserLoading.value = false;
        addUserDataModel.value = userModel;
        Get.snackbar('Success', 'New users added successfully',
            backgroundColor: JobBoardColors.white
        );
      }
    }catch(e){
      addUserLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }
}