import 'package:api_teste/src/core/api/list_user_service.dart';
import 'package:api_teste/src/core/widgets/user_tile_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoaded = false;
  List users = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    Future<List> fetchUsers() async {
      if (isLoaded == false) {
        users = await ListUser().getUsers();
        isLoaded = true;
        return users;
      } else {
        return users;
      }
    }

    Future<List> refreshUsers() async {
      users = await ListUser().getUsers();
      setState(() {});

      return users;
    }

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return refreshUsers();
          },
          child: FutureBuilder(
            future: fetchUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      String initialName = snapshot.data[index]['name'][0];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: UserTileWidget(
                          size: size,
                          initialName: initialName,
                          userData: snapshot.data[index],
                          voidCallback: () {
                            setState(() {
                              users.remove(snapshot.data[index]);
                            });
                          },
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
        ),
      ),
    );
  }
}
