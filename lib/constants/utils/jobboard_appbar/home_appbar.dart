import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobboard/constants/pref_strings/preferences_string.dart';
import 'package:jobboard/constants/utils/colors.dart';
import 'package:jobboard/controller/user_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../input_field/text_input_field.dart';
import '../jobboard_button/primary_button.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(55);
}

class _HomeAppBarState extends State<HomeAppBar> {

  UserController userController = Get.find<UserController>();

  String? userEmail;
  String selectedValue = "leader";
  late SharedPreferences preferences;

  @override
  void initState() {
    super.initState();
    initial();
  }
  void initial() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      userEmail = preferences.getString(PrefString.email)!;
    });
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return PreferredSize(
      preferredSize: const Size.fromHeight(75),
      child: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Job Board',
              style: TextStyle(
                  color: JobBoardColors.primaryColor,
                  //color: Color(0xFF047BFC),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700)),
            Text(
              "$userEmail",
              style: TextStyle(
                  color: JobBoardColors.primaryColor,
                fontFamily: 'Poppins',
                  fontSize: 10,
              )),
          ],
        ),
        actions: [
          // Add Vehicle
          IconButton(
              tooltip: 'Add user',
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    ),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding:
                      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 5.0,
                            width: width * 0.25,
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                            child: Text(
                              'User Regd',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Form(
                                child: Column(
                                  children: [
                                    TextInputField(
                                      maxLength: 10,
                                      readOnly: false,
                                      hintText: "Name",
                                      controller: userController.nameController,
                                    ),
                                    const SizedBox(height: 5),

                                    Container(
                                      height: 47,
                                      width: width,
                                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          border: Border.all(width: 1.0, color: Colors.grey.shade300)),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          hint: const Text("Choose job type"),
                                          value: selectedValue,
                                          style: Theme.of(context).textTheme.bodyMedium,
                                          icon: const Icon(Icons.keyboard_arrow_down),
                                          items: [
                                            'leader',
                                            'assistant',
                                            'manager',
                                          ].map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(
                                                items,
                                                style: Theme.of(context).textTheme.bodyLarge,
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedValue = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                    ),

                                    Obx(() {
                                        return userController.addUserLoading.value == true ? Container(
                                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                                          width: double.maxFinite,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: JobBoardColors.primaryColor,
                                            borderRadius: BorderRadius.circular(10.0)
                                          ),

                                          alignment: Alignment.center,
                                          child: const CircularProgressIndicator(
                                            strokeWidth: 2.5,
                                            color: Colors.white,
                                          ),
                                        ): PrimaryButton(
                                          label: 'Submit',
                                          onPressed: () async{
                                            Future.delayed(const Duration(seconds: 1), (){
                                              userController.addUser(selectedValue);
                                            });
                                          },
                                        );
                                      }
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                    );
                  },
                );

              },
              icon: const Icon(EvaIcons.plus)),
        ],
      ),
    );
  }
}
