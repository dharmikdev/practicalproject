
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Apiservice.dart';
import 'Userdetails.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen( {Key? key}) : super(key: key);

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {

  bool isloading = false;
  List eventlist = [];
  var basicdetailslistres;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Userdetails();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User List'),
      ),
      body: Column(
        children: [
      Expanded(
        child: ListView.builder(
        itemCount: eventlist.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>UserDetailsScreen(eventlist[index]['name'])));
                      },
                      title: Text(eventlist[index]['name']),
                      subtitle: Text(eventlist[index]['description']),
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              eventlist[index]['avatar'])),
                     ));
            }),
      )
        ],
      ),

    );
  }

  Future<void> Userdetails() async {
    setState(() {
      isloading = true;
    });
    ApiService apiService = ApiService();
    apiService.UserList().then(
          (value) => setState(() {
        isloading = false;
        basicdetailslistres = value;
        eventlist =  basicdetailslistres ;
        print(eventlist.toString());
        print("success");

      }),
    );
  }

}
