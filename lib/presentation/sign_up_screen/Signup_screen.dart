import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neu_social/presentation/sign_up_screen/controller/Signup_controller.dart';
import 'package:neu_social/presentation/sign_up_screen/widgets/Custom_textfield/Custom_textfield.dart';
import 'package:neu_social/routes/Page_list/Page_list.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final SignupController signupController = SignupController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: signupController.formKey,
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to Community',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Sign up to continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                child: CustomTextfield(
                  controllr: signupController.NameControl,
                  prefixIcon: Icon(Icons.person),
                  txt: 'Enter your name',
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required";
                    }
                    // Adjust the regex to match valid name characters
                    RegExp regex = RegExp(r'^[a-zA-Z\s-]+$');
                    if (!regex.hasMatch(value)) {
                      return "Enter a valid name";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                child: CustomTextfield(
                  controllr: signupController.EmailControl,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return ("Please Enter Your Email");
                    }
                    //reg exression for email validation
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@gmail.com")
                        .hasMatch(value)) {
                      return ("Please Enter valid Email");
                    }
                    return null;
                  },
                  prefixIcon: Icon(Icons.mail),
                  txt: 'Enter your e-mail address',
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                child: Obx(
                  () => CustomTextfield(
                    controllr: signupController.PasswordControl,
                    prefixIcon: Icon(Icons.password),
                    txt: 'Enter your Password',
                    validation: (value) {
                      RegExp regex =
                          RegExp(r'^.{6,}$'); //entering minimum value 6
                      if (value!.isEmpty) {
                        return ("Password Is Required");
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Enter Valid Password (Min. 6 Characters)");
                      }
                      return null;
                    },
                    obscure: signupController.isObscure.value,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          signupController.isObscure.value =
                              !signupController.isObscure.value;
                        },
                        child: Icon(signupController.isObscure.value
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                      backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      fixedSize: WidgetStatePropertyAll(Size(250, 60))),
                  onPressed: () {
                    if (signupController.formKey.currentState!.validate()) {
                      // If all fields are valid, perform some action, e.g., submit the form
                      Get.snackbar("Success", "Successfully signed in");
                      signupController.saveData(
                        signupController.NameControl.text,
                        signupController.EmailControl.text,
                      );
                      Get.toNamed(PageList.CustomizeIntrest);
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
