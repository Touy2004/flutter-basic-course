import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Diary {
  String text; // detail
  DateTime createdAt; // creation time

  Diary({
    required this.text,
    required this.createdAt,
  });

  /// Diary -> Change Map
  Map<String, dynamic> toJson() {
    return {
      "text":
          text, // DateTime must be converted to a string to be converted to jsonString.
      "createdAt": createdAt.toString(),
    };
  }

  /// Map -> Diary change
  factory Diary.fromJson(Map<String, dynamic> jsonMap) {
    return Diary(
      text: jsonMap[
          'text'], // Converts the time passed as a string back to DateTime.
      createdAt: DateTime.parse(jsonMap['createdAt']),
    );
  }
}

class DiaryService extends ChangeNotifier {
  /// Constructor
  DiaryService(this.prefs) {
// When the constructor is called, load the diaryList saved as SharedPreferences.
// Contrary to when saving, convert to String -> Map -> Diary.
    List<String> strintDiaryList = prefs.getStringList("diaryList") ?? [];
    for (String stringDiary in strintDiaryList) {
// String -> Map
      Map<String, dynamic> jsonMap = jsonDecode(stringDiary);
// Map -> Diary
      Diary diary = Diary.fromJson(jsonMap);
      diaryList.add(diary);
    }
  }

  /// SharedPreferences instance
  SharedPreferences prefs;

  /// Diary list
  List<Diary> diaryList = [];

  /// Search diary for a specific date
  List<Diary> getByDate(DateTime date) {
    return diaryList
        .where((diary) => isSameDay(date, diary.createdAt))
        .toList();
  }

  /// Create Diary
  void create(String text, DateTime selectedDate) {
    DateTime now = DateTime.now();
// Add current time to selected date
    DateTime createdAt = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      now.hour,
      now.minute,
      now.second,
    );

    Diary diary = Diary(
      text: text,
      createdAt: createdAt,
    );
    diaryList.add(diary);
    notifyListeners();

// Saves diary information every time it changes.
    _saveDiaryList();
  }

  /// Modify Diary
  void update(DateTime createdAt, String newContent) {
// createdAt is not duplicated, so createdAt is used as a unique identifier
// Look up diaries that match createdAt
    Diary diary = diaryList.firstWhere((diary) => diary.createdAt == createdAt);
// Edit text
    diary.text = newContent;
    notifyListeners();
// Saves diary information every time it changes.
    _saveDiaryList();
  }

  /// Delete Diary
  void delete(DateTime createdAt) {
    // Since createdAt is not duplicated, use createdAt as a unique identifier
    // Delete diary matching createdAt
    diaryList.removeWhere((diary) => diary.createdAt == createdAt);
    notifyListeners();

// Saves diary information every time it changes.
    _saveDiaryList();
  }

  /// Save the changed Diary as SharedPreferences /
// If you start the function name with _, it can only be called from inside DiaryService.
  void _saveDiaryList() {
// A self-created class called Diary cannot be saved in shared preferences.
// We will convert it into a String format that can be saved in SharedPreferences.
    // You can create your own rule to convert Diary to String format, but usually a rule called json is used.

// Convert in the following order: Diary -> Map -> String.
    List<String> stringDiaryList = [];
    for (Diary diary in diaryList) {
// Diary -> Map
      Map<String, dynamic> jsonMap = diary.toJson();
// Map -> String
      String stringDiary = jsonEncode(jsonMap);
      stringDiaryList.add(stringDiary);
    }
    prefs.setStringList("diaryList", stringDiaryList);
  }
}
