import 'package:flutter/material.dart';

import '../../ui_utils.dart';
import '../../widgets/notification_tile.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: width * 0.9,
          height: height * 0.91,
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      backgroundColor: Colors.white,
                      mini: true,
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 18,
                        color: UiUtils.medium,
                      )),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Notifications",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: UiUtils.dark,
                            fontSize: 24,
                            fontFamily: UiUtils.fontFamily,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.12,
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: Icon(
                      //     Icons.filter_alt_outlined,
                      //     color: UiUtils.dark,
                      //   ),
                      // ),
                      // Expanded(
                      //   child: Align(
                      //     alignment: FractionalOffset.centerRight,
                      //     child: Icon(
                      //       Icons.filter_alt_outlined,
                      //       color: UiUtils.dark,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.8,
                child: ListView.builder(itemBuilder: (context, index) {
                  return NotificationTile();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
