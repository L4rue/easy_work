import 'package:flutter/material.dart';
import 'package:lunar/lunar.dart';

typedef DayBuilder = Widget? Function(BuildContext context, DateTime day, DateTime focusedDay);

DayBuilder getCellBuilder({
  bool? isHoliday,
  bool? isOutside,
  bool? isToday,
  bool? isSelected,
  bool? isRangeStart,
  bool? isRangeEnd,
  bool? isWithinRange,
  duration = const Duration(milliseconds: 300),
}) {
  DayBuilder cell;
  if (isToday ?? false) {
    cell = (context, day, focusedDay) {
      return AnimatedContainer(
        duration: duration,
        width: 45,
        decoration: const BoxDecoration(color: Colors.lightBlue, shape: BoxShape.circle),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(day.day.toString(), style: const TextStyle(color: Colors.red)),
            Text(Lunar.fromDate(day).getDayInChinese().toString(), style: const TextStyle(color: Colors.red)),
          ],
        ),
      );
    };
  } else if (isHoliday ?? false) {
    cell = (context, day, focusedDay) {
      return AnimatedContainer(
        duration: duration,
        width: 45,
        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(day.day.toString(), style: const TextStyle(color: Colors.red)),
            Text(Lunar.fromDate(day).getDayInChinese().toString(), style: const TextStyle(color: Colors.red)),
          ],
        ),
      );
    };
  } else if (isOutside ?? false) {
    cell = (context, day, focusedDay) {
      return AnimatedContainer(
        duration: duration,
        width: 45,
        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(day.day.toString(), style: const TextStyle(color: Colors.grey)),
            Text(Lunar.fromDate(day).getDayInChinese().toString(), style: const TextStyle(color: Colors.grey)),
          ],
        ),
      );
    };
  } else if (isSelected ?? false) {
    cell = (context, day, focusedDay) {
      return AnimatedContainer(
        duration: duration,
        width: 45,
        decoration: const BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(day.day.toString(), style: const TextStyle(color: Colors.white)),
            Text(Lunar.fromDate(day).getDayInChinese().toString(), style: const TextStyle(color: Colors.white)),
          ],
        ),
      );
    };
  } else {
    cell = (context, day, focusedDay) {
      return AnimatedContainer(
        duration: duration,
        width: 45,
        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(day.day.toString(), style: const TextStyle(color: Colors.black)),
            Text(Lunar.fromDate(day).getDayInChinese().toString(), style: const TextStyle(color: Colors.black)),
          ],
        ),
      );
    };
  }
  return cell;
}
