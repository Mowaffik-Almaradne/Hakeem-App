//? For Creation Time :
import 'package:intl/intl.dart';

String findDifference({DateTime? serverDate, DateTime? localDateRating}) {
  if (serverDate != null &&
      serverDate != DateTime(0) &&
      localDateRating != null &&
      localDateRating != DateTime(0)) {
    Duration difference = serverDate.difference(localDateRating);

    if (difference.inSeconds.abs() < 60) {
      return '${difference.inSeconds.abs()} seconde';
    } else if (difference.inMinutes.abs() < 60) {
      return '${difference.inMinutes.abs()} .minute';
    } else if (difference.inHours.abs() < 24) {
      return '${difference.inHours.abs()} .hour';
    } else {
      int differenceInDays = difference.inDays;
      return '$differenceInDays day  ${(difference - Duration(days: differenceInDays)).inHours.abs()} hour';
    }
  } else {
    return '';
  }
}

String formatDate(
  DateTime dateTime, {
  bool slasheFormate = false,
}) {
  final DateFormat dateFormatter = DateFormat('yyyy/M/d'); // Format for date
  return dateFormatter.format(dateTime);
}

//? For Show Time And Moring OR evnngig  :
String getTimePeriod({required String time, bool isShowPeriodtrue = true}) {
  List<String> timeParts = time.split(':');
  int hour = int.parse(timeParts[0]);
  String minute = timeParts[1];

  String period = hour < 12 ? 'صباحاً' : 'مساءً';
  hour = hour % 12;
  hour = hour == 0 ? 12 : hour;
  return '$hour:$minute ${isShowPeriodtrue ? period : ""}';
}

String formatTimeTo12Hour(DateTime time) {
  int hour = time.hour;
  String minute = time.minute.toString().padLeft(2, '0');
  hour = hour % 12;
  hour = hour == 0 ? 12 : hour;
  return '$hour:$minute';
}

//? Check Is Imae
bool isImageFile(String fileUrl) {
  final List<String> imageExtensions = [
    '.png',
    '.jpg',
    '.jpeg',
    '.gif',
    '.bmp',
    '.webp',
    '.svg'
  ];

  return imageExtensions
      .any((extension) => fileUrl.toLowerCase().endsWith(extension));
}

String getDayName({required DateTime date}) {
  String dayName = DateFormat('EEEE', 'ar').format(date);
  return dayName;
}

String getMonthName({required DateTime date}) {
  String dayName = DateFormat('MMMM', 'ar').format(date);

  return dayName;
}

String getFulllDate({required DateTime date}) {
  String fulllDate = DateFormat.yMEd('ar').add_jms().format(date);
  return fulllDate;
}

String getTime({required DateTime date}) {
  String time = DateFormat('hh:mm', 'en').format(date);
  return time;
}

String amAndPm(DateTime time) {
  String period = DateFormat('a', 'ar').format(time);
  return period;
}

String amAndPmFromStrnig({required String time}) {
  List<String> timeParts = time.split(':');
  int hour = int.parse(timeParts[0]);

  String period = hour < 12 ? 'ص' : 'م';
  return period;
}
