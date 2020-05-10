import 'package:flutter/foundation.dart';

class Customer{
  final String id;
  final String companyName;
  final String custName;
  final String custPhone;
  final String managerName;
  final String managerPhone;
  final String companyPhone;
  final String gudownPhone;
  final String companyCategory;
  final String companyLandline;
  final String branchName;
  final String gudownAddress;
  final String companyAddress;
  final String logoFileName;
  final DateTime startDt;
  final DateTime makerDt;
  
  Customer({
    this.id,
    this.companyName,
    this.companyAddress,
    this.companyLandline,
    this.companyCategory,
    this.companyPhone,
    @required this.custName,
    @required this.custPhone,
    this.managerName,
    this.managerPhone,
    this.gudownAddress,
    this.gudownPhone,
    this.branchName,
    this.logoFileName,
    this.startDt,
    this.makerDt,
  });

}