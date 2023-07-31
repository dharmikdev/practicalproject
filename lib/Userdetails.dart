import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Apiservice.dart';

class UserDetailsScreen extends StatefulWidget {
  String username;
  UserDetailsScreen(this.username,);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  bool isloading = false;
  List eventlist = [];
  var basicdetailslistres;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Userdetails();
    print(widget.username);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("UserProfileDetails"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color:
                    Colors.black12,
                    spreadRadius: -5.0,
                    blurRadius: 1.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(15)
              ),
              height: 300,
              child: ListView.builder(
                  itemCount: eventlist.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 25,top: 25,bottom: 25,right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: CircleAvatar(
                              maxRadius: 50,
                                backgroundImage: NetworkImage(
                                    eventlist[index]['avatar'])),
                          ),
                          SizedBox(height: 20,),
                          Text("User Id :-"+eventlist[index]['id'],style: TextStyle(
                            fontSize: 20,
                          ),),

                          Text("User Name :-",style: TextStyle(
                            fontSize: 20,
                          ),),
                          Text(eventlist[index]['name'],style: TextStyle(
                            fontSize: 20,
                          ),),
                          Text("Job Place:-",
                          style: TextStyle(
                            fontSize: 20
                          ),
                          ),
                          Text(eventlist[index]['description'],
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),

                        ],
                      ),
                    );
                  })
            )
          ],
        ),
      ),
    );
  }
  Future<void> Userdetails() async {
    setState(() {
      isloading = true;
    });
    ApiService apiService = ApiService();
    apiService.UserdetailsList(widget.username).then(
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
