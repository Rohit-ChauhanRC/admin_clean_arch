import 'package:admin_clean_arch/core/constants/app_constants.dart';
import 'package:admin_clean_arch/core/theme/app_color.dart';
import 'package:admin_clean_arch/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:admin_clean_arch/features/auth/presentation/bloc/auth_event.dart';
import 'package:admin_clean_arch/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _mobileController = TextEditingController();
  GlobalKey<FormState>? loginFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _mobileController.dispose();
    super.dispose();
  }

  void _onLogin() {
    BlocProvider.of<AuthBloc>(
      context,
    ).add(LoginEvent(mobileNumber: _mobileController.text, userType: "A"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 10,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppConstants.verifyNumberTextForShowing,
                            textAlign: TextAlign.left,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.blackColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      SizedBox(
                        // width: Get.width * 0.8,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _mobileController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: AppColor.whiteColor,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 14,
                                bottom: 10,
                              ),
                              child: Image.asset("assets/flag.png"),
                            ),
                            hintText: 'Enter mobile number',
                            hintStyle: const TextStyle(
                              color: AppColor.greyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          validator:
                              (value) =>
                                  value!.length != 10
                                      ? "Please enter valid mobile number!"
                                      : null,
                          keyboardType: const TextInputType.numberWithOptions(
                            signed: false,
                            decimal: false,
                          ),
                        ),
                      ),
                      const SizedBox(height: 26),
                      BlocConsumer<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return SizedBox(
                            // width: Get.width * 0.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                // padding: const EdgeInsets.only(
                                //     left: 60, right: 60),
                                backgroundColor: const Color(0xff09AB47),
                              ),
                              onPressed: () {
                                if (!loginFormKey!.currentState!.validate()) {
                                  return;
                                }
                                _onLogin();
                                // Get.toNamed(Routes.HOME, arguments: "1002");
                              },
                              child: const Text(
                                "Continue",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                        listener: (context, state) {
                          if (state is AuthSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                            // Navigator.pushNamedAndRemoveUntil(
                            //   context,
                            //   '/conversationPage',
                            //   (route) => false,
                            // );
                          } else if (state is AuthError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.error)),
                            );
                          }
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20, top: 10),
                        child: const Text(
                          'By Signing up you agree to \n\t\t TnC and Privacy Policy',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
