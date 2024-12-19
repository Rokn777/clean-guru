# Flutter wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
-keep class io.flutter.plugin.editing.** { *; }

# Keep permissions classes
-keep class android.app.** { *; }
-keep class androidx.core.app.** { *; }

# Keep your custom classes
-keep class com.cleanguru.clean_guru.** { *; }

# Keep permission handler classes
-keep class com.baseflow.permissionhandler.** { *; }

# Keep battery plus classes
-keep class dev.fluttercommunity.plus.battery.** { *; }

# Keep disk space classes
-keep class com.baseflow.diskspace.** { *; }

# Keep app usage classes
-keep class com.example.app_usage.** { *; }