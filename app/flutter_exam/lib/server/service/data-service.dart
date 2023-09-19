import 'dart:convert';
import 'package:flutter_exam/server/model/place-model.dart';
import 'package:http/http.dart' as http;

class DataService{
 
  String baseUrl = 'http://192.168.0.1:8080/api/v1/destination';
  Future<List<Place>> getAllDestination() async{
    String subUrl = '/getAll';
    http.Response response = await http.get(Uri.parse(baseUrl+subUrl));
    try{
      if(response.statusCode == 200){
        List<dynamic> destiantions = json.decode(response.body);
        return destiantions.map((e) => Place.fromJson(e)).toList();
      }
    }catch(e){
      print(e);
    }
    return <Place>[];
  }

}