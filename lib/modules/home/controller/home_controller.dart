import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:toobler_test/modules/home/model/employee_model.dart';
import 'package:toobler_test/utils/api_service/api_response.dart';
import 'package:toobler_test/utils/constants/custom_print.dart';

import '../../../utils/api_service/api_service.dart';

class HomeController extends ChangeNotifier{


int selectedCityIndex = 0;
chooseCity(int v){
  selectedCityIndex = v;
  notifyListeners();
}



List<EmployeeModel> employeeFullList = [];
List<EmployeeModel> employeeFilterList = []; 

List<String> employeeCityList = ['All'];

ApiResponse? apiResponse;


getAllEmployees()async{
  apiResponse = ApiResponse(loading: true);
  notifyListeners();
  
  var response = await ApiService() .apiRequest(method: 'get');

  if (response?.statusCode==200) {
    apiResponse = ApiResponse(loading: false);
    
    employeeFullList = employeeModelFromJson(response?.body??'');

    for (var item in employeeFullList) {
      employeeCityList.add(item.address?.city??'');
    }
    employeeCityList = employeeCityList.toSet().toList();
    employeeFilterList = employeeFullList;

    customPrint(json.encode(employeeCityList));
    notifyListeners();
  }
  else{
    employeeCityList= [];
    apiResponse = ApiResponse(loading: false);
    notifyListeners();
  }
}



 filterEmployeeByCity(String city){
 
  if (city=='All') {
    employeeFilterList = employeeFullList;
  }
  else{
  employeeFilterList = employeeFullList.where((e) => (e.address?.city??'') == city).toList();

  }
  notifyListeners();

 }


}