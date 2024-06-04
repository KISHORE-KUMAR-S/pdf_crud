// ignore_for_file: prefer_const_constructors, library_prefixes, library_private_types_in_public_api

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfWid;
import 'package:printing/printing.dart';

class PDFView extends StatefulWidget {
  const PDFView({super.key});

  @override
  _PDFViewState createState() => _PDFViewState();
}

class _PDFViewState extends State<PDFView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PdfPreview(
        allowPrinting: true,
        allowSharing: true,
        canChangeOrientation: false,
        canChangePageFormat: false,
        enableScrollToPage: true,
        pdfFileName: 'abc',
        dynamicLayout: true,
        shouldRepaint: false,
        build: (format) => _createPdf(
          format,
        ),
      ),
    );
  }

  Future<Uint8List> _createPdf(
    PdfPageFormat format,
  ) async {
    final pdf = pdfWid.Document(
      version: PdfVersion.pdf_1_4,
      compress: true,
      pageMode: PdfPageMode.fullscreen,
    );

    final List<String> tips = [
      "Tip 1: Use widgets effectively",
      "Tip 2: Leverage the power of Flutter packages",
      "Tip 3: Build beautiful and responsive UIs",
      "Tip 4: Master state management",
      "Tip 5: Utilize animations for a smooth user experience",
      // ... Add more tips here
    ];

    pdf.addPage(
      pdfWid.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pdfWid.Column(
            children: [
              pdfWid.Text("Follow",
                  style: pdfWid.TextStyle(
                      fontSize: 35, fontWeight: pdfWid.FontWeight.bold)),
              pdfWid.Container(
                height: 1.5,
                margin: pdfWid.EdgeInsets.symmetric(vertical: 5),
                color: PdfColors.black,
              ),
              pdfWid.Container(
                child: pdfWid.Text("#30FlutterTips",
                    style: pdfWid.TextStyle(
                      fontSize: 35,
                      fontWeight: pdfWid.FontWeight.bold,
                    ),
                    textAlign: pdfWid.TextAlign.center,
                    maxLines: 5),
              ),
              pdfWid.Container(
                height: 1.5,
                margin: pdfWid.EdgeInsets.symmetric(vertical: 10),
                color: PdfColors.black,
              ),
              pdfWid.Text("Lakshydeep Vikram",
                  style: pdfWid.TextStyle(
                      fontSize: 25, fontWeight: pdfWid.FontWeight.bold)),
              pdfWid.Text("Follow on Medium, LinkedIn, GitHub",
                  style: pdfWid.TextStyle(
                      fontSize: 25, fontWeight: pdfWid.FontWeight.bold)),
            ],
          );
        },
      ),
    );

    if (tips.length > 4) {
      int currentPage = 1;
      for (var i = 4; i < tips.length; i++) {
        pdf.addPage(
          pdfWid.Page(
            pageFormat: PdfPageFormat.a4,
            build: (context) => pdfWid.Column(
              children: [
                if (currentPage == 1)
                  pdfWid.Text("More Flutter Tips",
                      style: pdfWid.TextStyle(
                          fontSize: 30, fontWeight: pdfWid.FontWeight.bold)),
                if (currentPage == 2)
                  pdfWid.Text(tips[1], style: pdfWid.TextStyle(fontSize: 20)),
                pdfWid.Text(tips[2], style: pdfWid.TextStyle(fontSize: 20)),
                pdfWid.Text(tips[2], style: pdfWid.TextStyle(fontSize: 20)),
                pdfWid.Text(tips[2], style: pdfWid.TextStyle(fontSize: 20)),
                pdfWid.Text(tips[2], style: pdfWid.TextStyle(fontSize: 20)),
              ],
            ),
          ),
        );
        currentPage++;
      }
    }

    return pdf.save();
  }
}
