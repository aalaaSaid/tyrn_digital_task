import 'package:intl/intl.dart';

String getDayAndMonth(DateTime date){
  return DateFormat("d MMMM").format(date);
}

String getDay(DateTime date) {
  String day = DateFormat('dd').format(date);
  return day;
}

String getMonth(DateTime date) {
  String month = DateFormat('MMMM').format(date);
  return month;
}

String getDayName(DateTime date) {
  return DateFormat('EEEE').format(date);
}

String getDate(DateTime date) {
  return DateFormat('d MMMM ,y').format(date);
}

String getTime(DateTime date) {
  return DateFormat('hh:mm a').format(date);
}
