import 'package:get/get.dart';

class LocaleString extends Translations {
  @override

  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'currency sign': '\$',
      'total balance': 'Total Balance',
      'income': 'Income',
      'expense': 'Expense',
      'history': 'History'
    },
    'hi_IN': {
      'currency sign': '₹',
      'total balance': 'कुल शेष राशि',
      'income': 'आय',
      'expense': 'व्यय',
      'history': 'लेन-देन सूची'

    },
    'be_BA': {
      'currency sign': '৳',
      'total balance': 'মোট ব্যালেন্স',
      'income': 'আয়',
      'expense': 'খরচ',
      'history': 'লেনদেনের তালিকা'

    },
  };
}
