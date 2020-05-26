import 'package:flutter/foundation.dart';

class Customer{
   String id;
   String companyName;
   String custName;
   String custPhone;
   String managerName;
   String managerPhone;
   String companyPhone;
   String gudownPhone;
   String companyCategory;
   String companyLandline;
   String branchName;
   String gudownAddress;
   String companyAddress;
   String logoFileName;
   DateTime startDt;
   DateTime makerDt;
  
  setVals(Map json){
    this.id= json['id'];
    this.companyName = json['companyName'];
    this.companyLandline = json['companyLandline'];
    this.companyLandline = json['companyLandline'];
    this.companyCategory = json['companyCategory'];
    this.companyPhone = json['companyPhone'];
    this.custName = json['custName'];
    this.custPhone = json['custPhone'];
    this.managerName = json['managerName'];
    this.managerPhone = json['managerPhone'];
    this.gudownAddress = json['gudownAddress'];
    this.gudownPhone = json['gudownPhone'];
    this.branchName = json['branchName'];
    this.logoFileName = json['logoFileName'];
    this.makerDt = json['makerDt'];
    this.makerDt = json['makerDt'];
  }
  Customer({
    this.id,
    this.companyName,
    this.companyAddress,
    this.companyLandline,
    this.companyCategory,
    this.companyPhone,
    this.custName,
    this.custPhone,
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