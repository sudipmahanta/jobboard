import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:jobboard/controller/user_controller.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  final UserController userController = Get.find();

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Obx(() {
              return userController.fetchUser.value == true? const Center(
                child: CircularProgressIndicator(),
              ) :  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                child: Column(
                  children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(userController.singleUserDataModel.value.data!.avatar!),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('First Name',
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    Text(userController.singleUserDataModel.value.data!.firstName!,
                                      style: Theme.of(context).textTheme.headlineMedium,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Last Name',
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    Text(userController.singleUserDataModel.value.data!.lastName!,
                                      style: Theme.of(context).textTheme.headlineMedium,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(userController.singleUserDataModel.value.data!.email!,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                    Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                    child: Text('Support Link',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                    Text(userController.singleUserDataModel.value.support!.text!,
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.justify,
                    ),
                    TextButton(
                        onPressed: () {
                          _launchURL(userController.singleUserDataModel.value.support!.url!);
                        },
                        child: const Text('Click here to contribute')
                    )
                  ],
                ),
              );
            }
          )
      ),
    );
  }
}
