import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank.dart';

class BankAccount {
  final Bank bank;
  int balance;
  final String? accountTypeName;

  BankAccount(
    this.bank,
    this.balance, {
      this.accountTypeName, // 선언해도되고 선언 안해도됨
      });

  @override
  String toString() {
    return 'BankAccount { '
        'Bank: ${bank.name}, '
        'Balance: \$${balance.toStringAsFixed(2)}, '
        'Account Type: ${accountTypeName ?? "Unknown"} }';
  }
}
