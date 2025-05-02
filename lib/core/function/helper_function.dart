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

//? Formate Data :
String formatDate(DateTime dateTime, {bool slasheFormate = false}) {
  final DateFormat formatter = slasheFormate == true
      ? DateFormat('yyy/MM/dd')
      : DateFormat('yyyy-MM-dd');
  return formatter.format(dateTime);
}

//? Get Name Month
String getMonthName(int? month) {
  if (month == null || month < 1 || month > 12) {
    return 'شهر غير صالح';
  }
  const List<String> arabicMonths = [
    'يناير', // January
    'فبراير', // February
    'مارس', // March
    'أبريل', // April
    'مايو', // May
    'يونيو', // June
    'يوليو', // July
    'أغسطس', // August
    'سبتمبر', // September
    'أكتوبر', // October
    'نوفمبر', // November
    'ديسمبر' // December
  ];

  return arabicMonths[month - 1];
}

//? For Show Time And Moring OR evnngig  :
String getTimePeriod(String time) {
  List<String> timeParts = time.split(':');
  int hour = int.parse(timeParts[0]); // Get the hour part
  String minute = timeParts[1]; // Get the minute part

  String period = hour < 12 ? 'صباحاً' : 'مساءً';

  hour = hour % 12;
  hour = hour == 0 ? 12 : hour;
  return '$period $hour:$minute';
}

String getTimePeriodForReservation(String time) {
  List<String> timeParts = time.split(':');
  int hour = int.parse(timeParts[0]); // Get the hour part
  String minute = timeParts[1]; // Get the minute part

  String period = hour < 12 ? 'Am' : 'Pm';

  hour = hour % 12;
  hour = hour == 0 ? 12 : hour;
  return '$period$hour:$minute';
}

String formatTimeTo12Hour(DateTime time) {
  int hour = time.hour;
  String minute = time.minute.toString().padLeft(2, '0');

  String period = hour < 12 ? 'ص' : 'م';

  hour = hour % 12;
  hour = hour == 0 ? 12 : hour; // تحويل الساعة 0 إلى 12

  return '$hour:$minute$period';
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
