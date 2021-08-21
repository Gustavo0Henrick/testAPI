import 'package:api_teste/src/core/widgets/user_box_widget.dart';
import 'package:flutter/material.dart';

class UserTileWidget extends StatelessWidget {
  final size;
  final initialName;
  final userData;
  final VoidCallback voidCallback;
  UserTileWidget(
      {Key? key,
      this.size,
      this.initialName,
      this.userData,
      required this.voidCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      height: 80,
      child: Card(
        elevation: 5,
        color: Colors.green[400],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            dialog(context, size, initialName, userData);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("${initialName}"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: size.width * .49,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Name: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                              children: [
                                TextSpan(
                                  text: '${userData['name']}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ]),
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Email: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                              children: [
                                TextSpan(
                                  text: '${userData['email']}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.08,
                  width: size.width * .18,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'ID: ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                            children: [
                              TextSpan(
                                text: '${userData['id']}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Job: ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                            children: [
                              TextSpan(
                                text: '${userData['job_title']}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: voidCallback,
                    icon: Icon(
                      Icons.delete,
                      size: 16,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  dynamic dialog(context, size, initialName, userData) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => UserBoxWidget(
        initialName: initialName,
        size: size,
        userData: userData,
      ),
    );
  }
}
