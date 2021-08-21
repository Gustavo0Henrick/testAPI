import 'package:api_teste/src/core/api/list_user_service.dart';
import 'package:api_teste/src/core/widgets/user_box_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future<List> fetchUsers() async {
      var users = await ListUser().getUsers();
      return users;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home Page"),
      ),
      body: FutureBuilder(
        future: fetchUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  String initialName = snapshot.data[index]['name'][0];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      margin: EdgeInsets.zero,
                      height: 80,
                      child: Card(
                        elevation: 5,
                        color: Colors.green[400],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            dialog(context, size, initialName,
                                snapshot.data[index]);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (builder) =>
                            //           UserPage(userData: snapshot.data[index]),
                            //     ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Text("${initialName}"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Container(
                                    width: size.width * .49,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                                  text:
                                                      '${snapshot.data[index]['name']}',
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
                                                  text:
                                                      '${snapshot.data[index]['email']}',
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
                                  width: size.width * .25,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                                text:
                                                    '${snapshot.data[index]['id']}',
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
                                                text:
                                                    '${snapshot.data[index]['job_title']}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )
                                            ]),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
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
