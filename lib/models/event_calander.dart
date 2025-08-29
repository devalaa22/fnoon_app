import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String documentId;
  final String clientPerson;
  final String title;
  final String price;
  final String deposit;
  final String subPrice;
  final String phoneNumber;
  final String state;
  final String qute;
  final String place;
  final String actor;
  final DateTime selectedDay;

  Event({
    required this.documentId,
    required this.clientPerson,
    required this.title,
    required this.price,
    required this.deposit,
    required this.subPrice,
    required this.phoneNumber,
    required this.state,
    required this.qute,
    required this.place,
    required this.actor,
    required this.selectedDay,
  });

  // تحويل الكائن إلى Map
  Map<String, dynamic> toMap() {
    return {
      'clientPerson': clientPerson,
      'title': title,
      'price': price,
      'deposit': deposit,
      'subPrice': subPrice,
      'phoneNumber': phoneNumber,
      'state': state,
      'qute': qute,
      'place': place,
      'actor': actor,
      'selectedDay': selectedDay,
    };
  }

  // إنشاء كائن من DocumentSnapshot
  factory Event.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Event(
      documentId: doc.id,
      clientPerson: data['clientperson'] ?? '',
      title: data['title'] ?? '',
      price: data['price'] ?? '',
      deposit: data['deposit'] ?? '',
      subPrice: data['subprice'] ?? '',
      phoneNumber: data['phonenumber'] ?? '',
      state: data['state'] ?? '',
      qute: data['qute'] ?? '',
      place: data['place'] ?? '',
      actor: data['actor'] ?? '',
      selectedDay: (data['SelectedDay'] as Timestamp).toDate(),
    );
  }

  // إنشاء كائن من JSON (Map)
  factory Event.fromJson(Map<String, dynamic> json, {String? documentId}) {
    return Event(
      documentId: documentId ?? '',
      clientPerson: json['clientperson'] ?? '',
      title: json['title'] ?? '',
      price: json['price'] ?? '',
      deposit: json['deposit'] ?? '',
      subPrice: json['subprice'] ?? '',
      phoneNumber: json['phonenumber'] ?? '',
      state: json['state'] ?? '',
      qute: json['qute'] ?? '',
      place: json['place'] ?? '',
      actor: json['actor'] ?? '',
      selectedDay: json['SelectedDay'] is Timestamp
          ? (json['SelectedDay'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  // نسخ الكائن مع إمكانية تعديل أي خاصية
  Event copyWith({
    String? documentId,
    String? clientPerson,
    String? title,
    String? price,
    String? deposit,
    String? subPrice,
    String? phoneNumber,
    String? state,
    String? qute,
    String? place,
    String? actor,
    DateTime? selectedDay,
  }) {
    return Event(
      documentId: documentId ?? this.documentId,
      clientPerson: clientPerson ?? this.clientPerson,
      title: title ?? this.title,
      price: price ?? this.price,
      deposit: deposit ?? this.deposit,
      subPrice: subPrice ?? this.subPrice,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      state: state ?? this.state,
      qute: qute ?? this.qute,
      place: place ?? this.place,
      actor: actor ?? this.actor,
      selectedDay: selectedDay ?? this.selectedDay,
    );
  }
}
