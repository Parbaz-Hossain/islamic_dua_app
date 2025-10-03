import 'package:flutter/material.dart';

class Reminder {
  final int? id;
  final String title;
  final TimeOfDay time;
  final List<int> selectedDays; // 1=Monday, 2=Tuesday, ..., 7=Sunday
  final bool isEnabled;
  final int? duaId;

  Reminder({
    this.id,
    required this.title,
    required this.time,
    required this.selectedDays,
    this.isEnabled = true,
    this.duaId,
  });

  // Convert Reminder object to Map for database insertion
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'time': '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
      'selected_days': selectedDays.join(','),
      'is_enabled': isEnabled ? 1 : 0,
      'dua_id': duaId,
    };
  }

  // Create Reminder object from database Map
  factory Reminder.fromMap(Map<String, dynamic> map) {
    final timeParts = (map['time'] as String).split(':');
    return Reminder(
      id: map['id'] as int?,
      title: map['title'] as String? ?? '',
      time: TimeOfDay(
        hour: int.parse(timeParts[0]),
        minute: int.parse(timeParts[1]),
      ),
      selectedDays: map['selected_days'] != null && 
                    map['selected_days'].toString().isNotEmpty
          ? map['selected_days']
              .toString()
              .split(',')
              .map<int>((e) => int.parse(e))
              .toList()
          : [],
      isEnabled: map['is_enabled'] == 1,
      duaId: map['dua_id'] as int?,
    );
  }

  // Create a copy of Reminder with updated fields
  Reminder copyWith({
    int? id,
    String? title,
    TimeOfDay? time,
    List<int>? selectedDays,
    bool? isEnabled,
    int? duaId,
  }) {
    return Reminder(
      id: id ?? this.id,
      title: title ?? this.title,
      time: time ?? this.time,
      selectedDays: selectedDays ?? this.selectedDays,
      isEnabled: isEnabled ?? this.isEnabled,
      duaId: duaId ?? this.duaId,
    );
  }

  // Get formatted time string (12-hour format)
  String getFormattedTime12Hour() {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  // Get formatted time string (24-hour format)
  String getFormattedTime24Hour() {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  // Get day names in Bengali
  String getSelectedDaysBengali() {
    if (selectedDays.isEmpty) return 'কোন দিন নির্বাচিত নয়';
    if (selectedDays.length == 7) return 'প্রতিদিন';

    final dayNames = {
      1: 'সোম',
      2: 'মঙ্গল',
      3: 'বুধ',
      4: 'বৃহঃ',
      5: 'শুক্র',
      6: 'শনি',
      7: 'রবি',
    };

    return selectedDays.map((day) => dayNames[day] ?? '').join(', ');
  }

  // Get day names in English
  String getSelectedDaysEnglish() {
    if (selectedDays.isEmpty) return 'No days selected';
    if (selectedDays.length == 7) return 'Every day';

    final dayNames = {
      1: 'Mon',
      2: 'Tue',
      3: 'Wed',
      4: 'Thu',
      5: 'Fri',
      6: 'Sat',
      7: 'Sun',
    };

    return selectedDays.map((day) => dayNames[day] ?? '').join(', ');
  }

  // Check if reminder should fire today
  bool shouldFireToday() {
    final today = DateTime.now().weekday; // 1=Monday, 7=Sunday
    return isEnabled && selectedDays.contains(today);
  }

  // Convert to JSON (useful for debugging)
  Map<String, dynamic> toJson() => toMap();

  // Create from JSON
  factory Reminder.fromJson(Map<String, dynamic> json) => 
      Reminder.fromMap(json);

  @override
  String toString() {
    return 'Reminder{id: $id, title: $title, time: ${getFormattedTime24Hour()}, enabled: $isEnabled}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Reminder && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}