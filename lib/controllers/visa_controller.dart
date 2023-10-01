import 'package:get/get.dart';

class VisaController extends GetxController {
  String cardNumber = '';
  String cardHolderName = '';
  String cvv = '';
  String expiryDate = '';
  late String userCardNumber='';
  late String userCardHolderName='';
  late String userCardExpiryDate='';
  late String userCVV='';
  @override
  void onClose() {
    super.onClose();
    cardNumber = '';
    cardHolderName = '';
    cvv = '';
    expiryDate = '';
  }
  void onCardNumberChange(String value) {

    cardNumber = value.replaceAllMapped(
        RegExp(r".{4}"), (match) => "${match.group(0)}\t");

    update();
  }

  void onCardholderChange(String value) {

    cardHolderName = value;
    update();
  }

  void onExpiryDateChange(String value) {

    expiryDate = value;
    update();
  }
  void saveCardInfo(){
    userCardNumber=cardNumber;
    userCardExpiryDate=expiryDate;
    userCVV=cvv;
    userCardHolderName=cardHolderName;
    update();
  }

}
