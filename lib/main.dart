import 'package:flutter/material.dart';
import 'package:pdf_crud/inspection_report.dart';
import 'package:pdf_crud/pdf_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InspectionReportPDF(),
    );
  }
}
