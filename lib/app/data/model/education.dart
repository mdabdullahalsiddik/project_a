//
//
// import 'package:flutter/material.dart';
//
// class EducationModel {
//   String? level;
//   String? year;
//   String? institute;
//   String? board;
//   String? subject;
//   String? grade;
//   TextEditingController gradeController;
//
//   EducationModel({
//     this.level = '',
//     this.year = '',
//     this.institute = '',
//     this.board = '',
//     this.subject = '',
//     this.grade = '',
//     TextEditingController? gradeController,
//   }) : gradeController = gradeController ?? TextEditingController();
//
//   Map<String, dynamic> toJson() {
//     return {
//       'qualification': level,
//       'passing_year': year,
//       'institution_name': institute,
//       'board_name': board,
//       'subject_name': subject,
//       'grade_division': gradeController.text.isNotEmpty ? gradeController.text : grade,
//     };
//   }
//
//   factory EducationModel.fromJson(Map<String, dynamic> json) {
//     return EducationModel(
//       level: json['qualification'] ?? '',
//       year: json['passing_year']?.toString() ?? '',
//       institute: json['institution_name'] ?? '',
//       board: json['board_name'] ?? '',
//       subject: json['subject_name'] ?? '',
//       grade: json['grade_division'] ?? '',
//       gradeController: TextEditingController(text: json['grade_division'] ?? ''),
//     );
//   }
// }
