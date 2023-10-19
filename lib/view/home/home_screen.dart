import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobboard/constants/utils/jobboard_appbar/home_appbar.dart';
import 'package:jobboard/controller/user_controller.dart';
import 'package:jobboard/view/user/user_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserController userController = Get.put(UserController());

  @override
  void initState() {
    userController.getAllUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Obx(() {
          return SingleChildScrollView(
            child: SafeArea(
                child:
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        child:  userController.isLoading.value == true ? const Center(child: CircularProgressIndicator(),): ListView.builder(
                          itemCount: userController.allUserDataModel.value.data!.length,
                            itemBuilder: (context, index){
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: ListTile(
                                  onTap: () async{
                                    Future.delayed(const Duration(seconds: 0),(){
                                      userController.getUserDetail(userController.allUserDataModel.value.data![index].id!);
                                    });

                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const UserScreen()));
                                  },
                                  leading: CircleAvatar(
                                    radius: 15,
                                    backgroundImage: NetworkImage(userController.allUserDataModel.value.data![index].avatar!),
                                  ),
                                  title: Text(userController.allUserDataModel.value.data![index].firstName!),
                                  subtitle: Text(userController.allUserDataModel.value.data![index].email!),
                                ),
                              );
                            }
                        ),
                      )

                    ],
                  ),
                )
            ),
          );
        }
      ),
    );
  }
}
