import 'package:code_tutoorial/3/one-line_diary/diary_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// Calendar display format

  CalendarFormat calendarFormat = CalendarFormat.month;
// Selected Date
  DateTime selectedDate = DateTime.now();
// create text controller
  TextEditingController createTextController = TextEditingController();
// update text controller
  TextEditingController updateTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<DiaryService>(
      builder: (context, diaryService, child) {
        List<Diary> diaryList = diaryService.getByDate(selectedDate);
        return Scaffold(
// Prevent the screen from sliding when the keyboard comes up
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: [
                /// Calendar
                TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: selectedDate,
                  calendarFormat: calendarFormat,
                  onFormatChanged: (format) {
// Change calendar format
                    setState(() {
                      calendarFormat = format;
                    });
                  },
                  eventLoader: (date) {
                    // Show diaryList corresponding to each date
                    return diaryService.getByDate(date);
                  },
                  calendarStyle: const CalendarStyle(
                    // remove today color today

                    todayTextStyle: TextStyle(color: Colors.black),
                    todayDecoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  selectedDayPredicate: (day) {
                    return isSameDay(selectedDate, day);
                  },
                  onDaySelected: (_, focusedDay) {
                    setState(() {
                      selectedDate = focusedDay;
                    });
                  },
                ),

                const Divider(height: 1),

                /// Diary list for selected date
                Expanded(
                  child: diaryList.isEmpty
                      ? const Center(
                          child: Text(
                            "Please write a one-line diary.",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        )
                      : ListView.separated(
                          itemCount: diaryList.length,
                          itemBuilder: (context, index) {
// Show in reverse order
                            int i = diaryList.length - index - 1;
                            Diary diary = diaryList[i];
                            return ListTile(
                              /// text

                              title: Text(
                                diary.text,
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                ),
                              ),

                              /// createdAt
                              trailing: Text(
                                DateFormat('kk:mm').format(diary.createdAt),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),

                              /// Click to update \
                              onTap: () {
                                showUpdateDialog(diaryService, diary);
                              },

                              /// If you press hard, delete
                              onLongPress: () {
                                showDeleteDialog(diaryService, diary);
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            // Add Divider between items
                            return const Divider(height: 1);
                          },
                        ),
                ),
              ],
            ),
          ),

          /// Floating Action Button
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.indigo,
            onPressed: () {
              showCreateDialog(diaryService);
            },
            child: const Icon(Icons.create),
          ),
        );
      },
    );
  }

  /// Write /// Called when Enter is pressed or the Write button is pressed

  void createDiary(DiaryService diaryService) {
// Delete leading and trailing spaces
    String newText = createTextController.text.trim();
    if (newText.isNotEmpty) {
      diaryService.create(newText, selectedDate);
      createTextController.text = "";
    }
  }

  /// Edit /// Called when Enter is pressed or the Edit button is pressed

  void updateDiary(DiaryService diaryService, Diary diary) {
// Delete leading and trailing spaces
    String updatedText = updateTextController.text.trim();
    if (updatedText.isNotEmpty) {
      diaryService.update(
        diary.createdAt,
        updatedText,
      );
    }
  }

  /// Show creation dialog void
  showCreateDialog(DiaryService diaryService) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Write a diary"),
          content: TextField(
            controller: createTextController, autofocus: true, // Cursor color
            cursorColor: Colors.indigo,
            decoration: const InputDecoration(
              hintText:
                  "Please write a one-line diary.", // Underline color when focused
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo),
              ),
            ),
            onSubmitted: (_) {
// Create when you press Enter
              createDiary(diaryService);
              Navigator.pop(context);
            },
          ),
          actions: [
            /// Cancel button

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.indigo),
              ),
            ),

            /// Compose button

            TextButton(
              onPressed: () {
                createDiary(diaryService);
                Navigator.pop(context);
              },
              child: const Text(
                "Create",
                style: TextStyle(color: Colors.indigo),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Show update dialog void
  showUpdateDialog(DiaryService diaryService, Diary diary) {
    showDialog(
      context: context,
      builder: (context) {
        updateTextController.text = diary.text;
        return AlertDialog(
          title: const Text("EditDiary"),
          content: TextField(
            autofocus: true,
            controller: updateTextController,
// Cursor Color
            cursorColor: Colors.indigo,
            decoration: const InputDecoration(
              hintText:
                  "Please write a one-line diary.", // Underline color when focused
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo),
              ),
            ),
            onSubmitted: (v) {
// Edit when pressing enter
              updateDiary(diaryService, diary);
              Navigator.pop(context);
            },
          ),
          actions: [
            ///Cancel button

            TextButton(
              child: const Text(
                "Cancel",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.indigo,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),

            /// Edit button
            TextButton(
              child: const Text(
                "Edit",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.indigo,
                ),
              ),
              onPressed: () {
                // Edit
                updateDiary(diaryService, diary);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  /// Show delete dialog void
  showDeleteDialog(DiaryService diaryService, Diary diary) {
    showDialog(
      context: context,
      builder: (context) {
        updateTextController.text = diary.text;
        return AlertDialog(
          title: const Text("Delete Diary"),
          content: Text('Do you want to delete "${diary.text}"?'),
          actions: [
            TextButton(
              child: const Text(
                "Cancel",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.indigo,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),

            /// Delete
            TextButton(
              child: const Text(
                "Delete",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.indigo,
                ),
              ),
              onPressed: () {
                diaryService.delete(diary.createdAt);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
