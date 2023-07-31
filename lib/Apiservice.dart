
import 'dart:convert';

import 'package:http/http.dart'as http;
class ApiService{

  Future UserList() async {
    var responseData;
    Map<String, String> Header = {
      'Content-Type': 'application/json',
    };
    try {
      print(("https://64c3a2f967cfdca3b660078c.mockapi.io/api/v1/usertable"));
      http.Response response = await http.get(
        Uri.parse("https://64c3a2f967cfdca3b660078c.mockapi.io/api/v1/usertable"),
        headers: Header,
      );
      // print("Event Data :=" + response.body);
      if (response.statusCode != "" ) {
        responseData =  json.decode(response.body);
        print("User Data :=" + response.body);
        return responseData;
      }
    } catch (E) {
      print("Error.." + E.toString());
    }
  }
  Future UserdetailsList(String Username) async {
    var responseData;
    Map<String, String> Header = {
      'Content-Type': 'application/json',
    };
    try {
      print(("https://64c3a2f967cfdca3b660078c.mockapi.io/api/v1/usertable?name=$Username"));
      http.Response response = await http.get(
        Uri.parse("https://64c3a2f967cfdca3b660078c.mockapi.io/api/v1/usertable?name=$Username"),
        headers: Header,
      );
      // print("Event Data :=" + response.body);
      if (response.statusCode != "" ) {
        responseData =  json.decode(response.body);
        print("User Data :=" + response.body);
        return responseData;
      }
    } catch (E) {
      print("Error.." + E.toString());
    }
  }

}