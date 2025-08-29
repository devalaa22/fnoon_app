plugins {
    id("com.android.application")
    id("kotlin-android")
    id("com.google.gms.google-services") // ✅ مهم لتشغيل Firebase
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.novelsoft.fnoon"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.novelsoft.fnoon"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = 2
        versionName = "2.1.2"
        multiDexEnabled = true
    }

 
  signingConfigs {
    create("release") {
        storeFile = file("C:\\Users\\momf\\fnoon\\android\\app\\AymanAltairi.jks")
        storePassword = "AymanAltairi"  // كلمة مرور keystore
        keyAlias = "AymanAltairi"  // اسم alias الخاص بالمفتاح
        keyPassword = "AymanAltairi"  // كلمة مرور المفتاح
    }
}

buildTypes {
    getByName("release") {
        signingConfig = signingConfigs.getByName("release")
        isMinifyEnabled = true  // لتقليص الكود
        isShrinkResources = true  // لتقليص الموارد
        proguardFiles(
            getDefaultProguardFile("proguard-android-optimize.txt"),
            "proguard-rules.pro"
        )
    }
}




}

flutter {
    source = "../.."
}
