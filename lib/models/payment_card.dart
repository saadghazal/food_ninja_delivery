class PaymentCard {
   String? cardNumber;
   String? cardHolderName;
   String? expiryDate;
   String? cvv;

   PaymentCard({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cvv,
  });

  Map<String, dynamic> toJson() {
    return {
      'cardNumber': cardNumber,
      'cardHolderName': cardHolderName,
      'expiryDate': expiryDate,
      'cvv': cvv,
    };

  }

  factory PaymentCard.fromJson(Map<String, dynamic> map) {
    return PaymentCard(
      cardNumber: map['cardNumber'] as String,
      cardHolderName: map['cardHolderName'] as String,
      expiryDate: map['expiryDate'] as String,
      cvv: map['cvv']??'',
    );
  }

  @override
  String toString() {
    return 'PaymentCard{cardNumber: $cardNumber, cardHolderName: $cardHolderName, expiryDate: $expiryDate, cvv: $cvv}';
  }
   factory PaymentCard.getVisaData({required String visaNumber ,required String visaCvv,required String visaExpiry,required String visaHolderName,}){
    return PaymentCard(cardNumber: visaNumber, cardHolderName: visaHolderName, expiryDate: visaExpiry, cvv: visaCvv);

  }
}