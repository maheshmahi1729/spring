import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spring/screens/vendor/scan_screen.dart';

import '../../providers/profile_provider.dart';
import '../../ui_utils.dart';

class PaymentStart extends StatefulWidget {
  const PaymentStart({Key? key}) : super(key: key);

  @override
  State<PaymentStart> createState() => _PaymentStartState();
}

class _PaymentStartState extends State<PaymentStart> {
  var _init = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ProfileProvider>(context).getProductList().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;
  }

  int amount = 0;

  @override
  Widget build(BuildContext context) {
    var profile = Provider.of<ProfileProvider>(context).profile;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: SizedBox(
              width: width * 0.9,
              height: height * 0.9,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: UiUtils.medium)),
                      child: FloatingActionButton(
                          elevation: 0,
                          onPressed: () {},
                          backgroundColor: Colors.white,
                          mini: true,
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 18,
                            color: UiUtils.medium,
                          )),
                    ),
                  ),
                  Text(
                    "$amount",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: UiUtils.dark,
                      fontSize: 36,
                      fontFamily: UiUtils.fontFamily,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.18,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  Container(
                    width: width * 0.8,
                    height: 66,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 196, 196, 196),
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20, top: 30),
                          hintStyle: TextStyle(
                            color: Color(0xff363853),
                            fontSize: 20,
                            fontFamily: UiUtils.fontFamily,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.08,
                          ),
                          hintText: "Reason",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  NumericKeyboard(
                    onKeyboardTap: (val) {
                      setState(() {
                        amount = int.parse("$amount" + val);
                      });
                    },
                    textColor: UiUtils.dark,
                    rightButtonFn: () {
                      setState(() {
                        amount = "$amount".substring(0, -1) as int;
                      });
                    },
                    rightIcon: Icon(
                      Icons.cancel_outlined,
                      size: 25,
                      color: UiUtils.dark,
                    ),
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    width: width * 0.6,
                    height: height * 0.08,
                    decoration: BoxDecoration(
                      color: UiUtils.medium,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: MaterialButton(
                          onPressed: () async {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ScanScreen(amount: "$amount")),
                                (route) => false);
                          },
                          child: Center(
                            child: Text(
                              "Scan",
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
