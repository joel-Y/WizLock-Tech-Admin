# -----------------------------------------------------------
# WIZSMITH TECHNICIAN & ADMIN APP - PROGUARD CONFIG
# Fully merged & optimized for TTLock V3 SDK + DFU + Gson + Retrofit
# -----------------------------------------------------------

# AndroidX settings
android.enableJetifier=true
android.useAndroidX=true

# -----------------------------------------------------------
# GENERAL SETTINGS
# -----------------------------------------------------------
-dontoptimize
-dontpreverify
-ignorewarnings
-verbose

# Mapping file for debugging obfuscation output
-printmapping mapping.txt

# Keep annotations & debugging info
-keepattributes *Annotation*
-keepattributes Signature
-keepattributes LineNumberTable

# -----------------------------------------------------------
# CORE ANDROID COMPONENTS (Activities, Services, etc.)
# -----------------------------------------------------------
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider

# Custom Views
-keep public class * extends android.view.View { *; }
-keepclassmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}
-keepclassmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

# -----------------------------------------------------------
# PARCELABLE + ENUM SUPPORT
# -----------------------------------------------------------
-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# -----------------------------------------------------------
# JSON / RETROFIT / GSON SUPPORT
# -----------------------------------------------------------
-keepattributes Signature
-keepattributes *Annotation*

# Gson needs model classes kept
-keep public class **.*entity*.** { *; }
-keep public class **.*constant*.** { *; }

# Gson internals
-keep class sun.misc.Unsafe { *; }

# Keep TypeAdapter classes
-keep class * extends com.google.gson.TypeAdapter { *; }

# -----------------------------------------------------------
# TTLOCK SDK (Bluetooth, API, Models)
# IMPORTANT: These lines ALLOW TTLock SDK to function!
# -----------------------------------------------------------
-keep class com.ttlock.** { *; }
-keepclassmembers class com.ttlock.** { *; }

# TTLock DFU (Firmware Upgrade)
-keep class com.ttlock.bl.sdk.service.DfuService.** { *; }
-keep class no.nordicsemi.android.dfu.** { *; }

# Bluetooth stack
-keepclasseswithmembernames class * {
    native <methods>;
}

# -----------------------------------------------------------
# NETWORK + OKHTTP / OKIO
# -----------------------------------------------------------
-dontwarn com.squareup.okhttp3.**
-keep class com.squareup.okhttp3.** { *; }

-dontwarn okio.**

# -----------------------------------------------------------
# R FILES
# -----------------------------------------------------------
-keepclassmembers class **.R$* {
    public static <fields>;
}

# -----------------------------------------------------------
# LICENSING (Required by Android build tools)
# -----------------------------------------------------------
-keep public class com.android.vending.licensing.ILicensingService
-keep public class com.google.vending.licensing.ILicensingService
