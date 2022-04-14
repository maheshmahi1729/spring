import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spring/ui_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
              height: height * 0.92,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Text(
                    "Welcome back",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: UiUtils.dark,
                      fontSize: 24,
                      fontFamily: UiUtils.fontFamily,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.12,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.3,
                  ),
                  Container(
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xfff2f2f2),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        // prefixIcon: SvgPicture.asset(
                        //   "assets/images/username.svg",
                        //   height: 3,
                        //   width: 5,
                        // ),
                        prefixIcon: Icon(Icons.person_outline_rounded),
                        hintText: "Username",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xfff2f2f2),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        // prefixIcon: SvgPicture.asset(
                        //   "assets/images/password.svg",
                        // ),
                        prefixIcon: Icon(Icons.key_outlined),
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.2,
                  ),
                  Container(
                    width: width * 0.5,
                    height: height * 0.1,
                    decoration: BoxDecoration(
                      color: UiUtils.medium,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: MaterialButton(
                          onPressed: () {},
                          child: Center(
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: UiUtils.fontFamily,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )),
                  ),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account yet?",
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: UiUtils.fontFamily,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.07,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: UiUtils.fontFamily,
                                color: Color(0xff81C2FF),
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.07,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
