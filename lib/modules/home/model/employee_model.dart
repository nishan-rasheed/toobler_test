import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee_model.freezed.dart';
part 'employee_model.g.dart';


List<EmployeeModel> employeeModelFromJson(String str) => List<EmployeeModel>.from(json.decode(str).map((x) => EmployeeModel.fromJson(x)));

String employeeModelToJson(List<EmployeeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));



@freezed
class EmployeeModel with _$EmployeeModel{
  const factory EmployeeModel({
        int? id,
        String? name,
        String? username,
        String? email,
        Address? address,
        String? phone,
        String? website,
        Company? company,
  }) = _EmployeeModel;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => _$EmployeeModelFromJson(json);

}



@freezed
class Address with _$Address{
  const factory Address({
        String? street,
        String? suite,
        String? city,
        String? zipcode,
        Geo? geo,
  }) = _Address;


  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}


@freezed
class Geo with _$Geo{
  const factory Geo({
        String? lat,
        String? lng,
  }) = _Geo;

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
}



@freezed
class Company with _$Company{
  const factory Company({
        String? name,
        String? catchPhrase,
        String? bs,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
}