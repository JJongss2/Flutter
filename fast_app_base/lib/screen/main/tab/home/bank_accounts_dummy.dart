import 'dart:collection';

import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/home/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';
import 'package:live_background/live_background.dart';

final bankAccountShinhan1 = BankAccount(1,bankShinhan, 300000000, accountTypeName: "신한 주거래 우대통장(저축예금)");
final bankAccountShinhan2 = BankAccount(2,bankShinhan, 300000000, accountTypeName: "저축예금");
final bankAccountShinhan3 = BankAccount(3,bankShinhan, 300000000, accountTypeName: "저축예금");
final bankAccountToss = BankAccount(4,bankToss, 12365456);
final bankAccountKakao = BankAccount(5,bankKakao, 213231, accountTypeName : "입출금통장");
final bankAccountKakao2 = BankAccount(5,bankKakao, 456789123, accountTypeName : "특별통장");

main(){
  // 삽입
  bankAccounts.insert(1, bankAccountKakao2);

  // 위치 이동
  final temp = bankAccounts.removeAt(4);
  bankAccounts.insert(0, temp);

  // 교환
  bankAccounts.swap(0, 5);

  // // 변환
  // final banks = bankAccounts.mapIndexed((e, index) => Row(children: [(index +1).text.make()])).toList();
  // for(final bank in banks){
  //   print(bank.toString());
  // }

  // map
  final map = HashMap<String, BankAccount>();
  map["ttoss"] = bankAccountToss;
  map["kakao"] = bankAccountKakao;
  map.putIfAbsent("kakao", ()=> bankAccountKakao2);

  for(final account in bankAccounts){
    print(account.toString());
  }

  // class generic
  final result = doTheWork();
  final result2 = doTheWork2();



  // method or function generic
  final result3 = doTheWork3<Cat>(()=> Cat());
  result3.eat();
}

abstract class Animal{
  void eat(){
    print("eat");
  }
}

class Cat extends Animal{
  @override
  void eat() {
    // TODO: implement eat
    super.eat();
  }
}

class Result<T>{
  final T data;
  Result(this.data);
}

class ResultString{
  final String data;
  ResultString(this.data);
}

class ResultDouble{
  final double data;
  ResultDouble(this.data);
}

Result<String> doTheWork(){
  return Result("중요한 데이터");
}

Result<double> doTheWork2(){
  return Result(5233.44);
}

Result doTheWork3<Result extends Animal>(Result Function() animalCreator){
  return animalCreator();
}


final bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountToss,
  bankAccountKakao
];