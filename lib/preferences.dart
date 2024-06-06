import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class Preferences {
  static const String uuidKey = 'uuid';
  static const String firstLaunchKey = 'first-launch';

  late SharedPreferences _prefs;

  Preferences._();

  static final Preferences _preferences = Preferences._();

  factory Preferences() => _preferences;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String provideUuid() {
    final uuid = _uuid;
    _uuid = uuid;
    return uuid;
  }

  String get _uuid => _prefs.getString(uuidKey) ?? const Uuid().v1();

  set _uuid(String uuid) => _prefs.setString(uuidKey, uuid);
}
