🎶 Fnoon App

Fnoon هو تطبيق مبني باستخدام Flutter يتيح للمستخدمين حجز المواعيد للحفلات والخدمات الفنية مثل (حجز قاعات، فنانين، فرق موسيقية، وخدمات إضافية).

🚀 تم تطوير المشروع بواجهة عصرية، ربط مباشر مع Firebase، وهيكلة مرتبة لسهولة التوسع والتطوير مستقبلاً.

✨ المميزات الرئيسية

🏠 إعادة تصميم الصفحة الرئيسية بالكامل لتكون أكثر وضوحاً وسهولة في التصفح.

📅 حجز المواعيد:

اختيار نوع الحفل أو المناسبة.

تحديد التاريخ والوقت المناسب.

إدخال بيانات التواصل.

🎭 الخدمات:

حجز قاعات.

حجز فنانين أو فرق.

خدمات إضافية للحفلات.

🔐 تسجيل الدخول والتسجيل:

دعم تسجيل الدخول عبر Google Sign-In.

حفظ بيانات الدخول محلياً (SharedPreferences).

🔔 إشعارات فورية (Push Notifications) عبر Firebase Cloud Messaging.

👤 الملف الشخصي:

عرض الحجوزات السابقة.

تعديل بيانات الحساب.

⚡ أداء محسن مع Firebase Firestore لعرض البيانات بسرعة وسلاسة.

🛠️ التقنيات المستخدمة

Framework: Flutter (Dart SDK)

State Management: Provider

Backend & Database: Firebase (Authentication, Firestore, Cloud Messaging)

Packages رئيسية:

firebase_core

firebase_auth

cloud_firestore

firebase_messaging

google_sign_in

provider

intl (للتواريخ)

📂 هيكلة المشروع
lib/
│
├── main.dart                  # نقطة تشغيل التطبيق
├── models/                    
│   └── booking.dart            # موديل بيانات الحجز
│
├── services/                  
│   ├── auth_service.dart       # تسجيل الدخول والخروج
│   ├── booking_service.dart    # التعامل مع الحجوزات
│   └── notification_service.dart # الإشعارات
│
├── screens/                   
│   ├── home_screen.dart        # الصفحة الرئيسية
│   ├── booking_screen.dart     # شاشة حجز المواعيد
│   ├── services_screen.dart    # شاشة عرض الخدمات
│   ├── profile_screen.dart     # شاشة الملف الشخصي
│   └── login_screen.dart       # شاشة تسجيل الدخول
│
├── widgets/                   
│   ├── booking_card.dart       # ويدجت لعرض تفاصيل الحجز
│   ├── service_card.dart       # ويدجت لعرض الخدمات
│   └── custom_button.dart      # أزرار مخصصة
│
└── utils/                     
    └── constants.dart          # ألوان وثيم التطبيق

📸 لقطات شاشة (Mockups)

(ضع هنا صور من التطبيق – مثلاً صور شاشة تسجيل الدخول، شاشة الحجز، شاشة الملف الشخصي)

شاشة تسجيل الدخول

شاشة حجز المواعيد

شاشة عرض الخدمات

شاشة الملف الشخصي

📦 أمثلة على الكلاسات
booking.dart
class Booking {
  final String id;
  final String eventType;
  final DateTime date;
  final String userId;

  Booking({required this.id, required this.eventType, required this.date, required this.userId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'eventType': eventType,
      'date': date.toIso8601String(),
      'userId': userId,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id'],
      eventType: map['eventType'],
      date: DateTime.parse(map['date']),
      userId: map['userId'],
    );
  }
}

🚀 كيفية التشغيل

تأكد من تثبيت Flutter
.

انسخ المستودع:

git clone https://github.com/devalaa22/fnoon_app.git


انتقل إلى مجلد المشروع:

cd fnoon_app


ثبّت الـ packages:

flutter pub get


شغل التطبيق:

flutter run