import 'dart:io';

void main () {
  print("*** Welcome To Age Calculator! ***");
  print("");
  print("Enter your date of birth..");

  stdout.write("Year: ");
  int? year = int.tryParse(stdin.readLineSync() ?? '');

  stdout.write("Month: ");
  int? month = int.tryParse(stdin.readLineSync() ?? '');

  stdout.write("Day: ");
  int? day = int.tryParse(stdin.readLineSync() ?? '');

  if (year == null || month == null || day == null) {
    print("");
    print("Invalid Input!");
    return;
  }

  DateTime birthDate = DateTime(year, month, day);
  DateTime today = DateTime.now();

    if (birthDate.isAfter(today)) {
    print("");
    print("Invalid Input!");
    return;
  }

  int years = today.year - birthDate.year;
  int months = today.month - birthDate.month;
  int days = today.day - birthDate.day;

  if (days < 0) {
    months--;
    DateTime prevMonthDays = DateTime(today.year, today.month, 0);
    days+= prevMonthDays.day;
  }

  if (months < 0) {
    years--;
    months+= 12;
  }

  print("");
  print("=== Result ===");
  print("Your age is: $years years, $months months and $days days.");
}