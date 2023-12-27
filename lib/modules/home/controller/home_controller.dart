import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:toobler_test/modules/home/model/employee_model.dart';
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


getAllEmployees()async{
  
  var response = await ApiService() .apiRequest(method: 'get');

  if (response?.statusCode==200) {
    customPrint('shhhhhhhh');
    
    employeeFullList = employeeModelFromJson(response?.body??'');

    for (var item in employeeFullList) {
      employeeCityList.add(item.address?.city??'');
    }
  
    employeeFilterList = employeeFullList;

    customPrint(json.encode(employeeCityList));
    notifyListeners();
  }
  else{
    customPrint('ssssssssfail');
  }
}



 filterEmployeeByCity(String city){
 
  if (city=='All') {
    employeeFilterList = employeeFullList;
  }
  else{
  employeeFilterList = employeeFullList.where((e) => (e.address?.city??'') == (city??'')).toList();

  }
  
  
  notifyListeners();

 }


}