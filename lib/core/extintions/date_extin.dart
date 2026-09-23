import 'package:intl/intl.dart';

extension DateExtin on DateTime 
{
  /// =================== "24 sep" ===================
  String get toFormattedDate {
    return DateFormat("d MMM").format(this);
  }
  /// =================== "24/9/2026" ===================
  String get toFormattedDate2 {
    return DateFormat("dd/M/yyyy").format(this);
  }


}
