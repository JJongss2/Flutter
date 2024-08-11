import '../../../screen/main/tab/home/bank_accounts_dummy.dart';
import '../../../screen/main/tab/home/vo/vo_bank_account.dart';
import '../../../screen/main/tab/home/vo/vo_user.dart';

void main(){
  final accounts = getAccounts();
  final list = <String>[];
  for(final account in accounts){
    final user = getUser(account.userId);
    list.add(user.name);
  }
  print(list);
}


List<BankAccount> getAccounts(){
  return bankAccounts;
}

User getUser(int id){
  return switch (id) {
    1 => User(id, 'Json'),
    2 => User(id, 'Dart'),
    3 => User(id, 'Baby'),
    4 => User(id, 'Love'),
    5 => User(id, 'Popcorn'),
    _ => throw Exception('404 not found'),
  };
}