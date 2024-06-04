import 'dart:js_interop';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:http/http.dart' as http;
import 'package:printing/printing.dart';

class InspectionReportPDF extends StatefulWidget {
  const InspectionReportPDF({super.key});

  @override
  State<InspectionReportPDF> createState() => _InspectionReportPDFState();
}

class _InspectionReportPDFState extends State<InspectionReportPDF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: PdfPreview(
        pdfFileName: 'inspection_report.pdf',
        allowPrinting: true,
        allowSharing: true,
        canChangeOrientation: false,
        previewPageMargin: const EdgeInsets.all(16),
        canChangePageFormat: false,
        canDebug: false,
        dynamicLayout: false,
        actionBarTheme: PdfActionBarTheme(
          backgroundColor: Colors.grey.shade200,
          iconColor: Colors.black,
        ),
        enableScrollToPage: true,
        shouldRepaint: false,
        useActions: true,
        build: (format) => _createPDF(format),
      ),
    );
  }

  Future<Uint8List> _createPDF(PdfPageFormat format) async {
    final pdf = p.Document(
      version: PdfVersion.pdf_1_4,
      compress: true,
    );

    final imageUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTILstzE4n4jxRaa2LcTb5Uf_JKLVtXIZjL3w&s";
    final response = await http.get(Uri.parse(imageUrl));
    final image =
        response.statusCode == 200 ? p.MemoryImage(response.bodyBytes) : null;

    pdf.addPage(
      p.MultiPage(
        build: (context) => [
          p.Column(
            children: [
              if (image != null)
                p.Row(
                  children: [
                    p.Image(image, height: 50, width: 50),
                    p.Spacer(),
                    p.Image(image, height: 50, width: 50),
                  ],
                ),
              _buildTable([
                ['Inspection Report'],
              ], p.Alignment.center),
              _buildTable([
                ['Project', ''],
              ], null),
              _buildTable([
                ['Client', '', 'Inspection Report No', ''],
                ['PMC', '', 'Date', ''],
                ['Vendor', '', '', ''],
                ['Package', '', 'Inspection Report No', ''],
                ['Description of Work', '', 'Quantity', ''],
              ], null),
              _buildTable([
                ['Location', ''],
              ], null),
              _buildTable([
                ['Level', '', 'Grid', '', 'Inspected by', ''],
              ], null),
              _buildTable(
                  [
                    ['S.NO', 'Description', 'YES', 'NO', 'N/A', 'Remarks'],
                  ],
                  p.Alignment.center,
                  columnWidths: const {
                    0: p.FixedColumnWidth(12),
                    1: p.FixedColumnWidth(100),
                    2: p.FixedColumnWidth(15),
                    3: p.FixedColumnWidth(15),
                    4: p.FixedColumnWidth(15),
                    5: p.FixedColumnWidth(50),
                  }),
              _buildTable([
                ['Before Excavation'],
              ], p.Alignment.center),
              _buildTable(
                  [
                    [
                      '1',
                      'Method Statement Submitted',
                      'YES',
                      'NO',
                      'NA',
                      'Remarks'
                    ],
                    [
                      '1',
                      'Method Statement Submitted',
                      'YES',
                      'NO',
                      'NA',
                      'Remarks'
                    ],
                    [
                      '1',
                      'Method Statement Submitted',
                      'YES',
                      'NO',
                      'NA',
                      'Remarks'
                    ],
                    [
                      '1',
                      'Method Statement Submitted',
                      'YES',
                      'NO',
                      'NA',
                      'Remarks'
                    ],
                    [
                      '1',
                      'Method Statement Submitted',
                      'YES',
                      'NO',
                      'NA',
                      'Remarks'
                    ],
                    [
                      '1',
                      'Method Statement Submitted',
                      'YES',
                      'NO',
                      'NA',
                      'Remarks'
                    ],
                    [
                      '1',
                      'Method Statement Submitted',
                      'YES',
                      'NO',
                      'NA',
                      'Remarks'
                    ],
                    [
                      '1',
                      'Method Statement Submitted',
                      'YES',
                      'NO',
                      'NA',
                      'Remarks'
                    ],
                    [
                      '1',
                      'Method Statement Submitted',
                      'YES',
                      'NO',
                      'NA',
                      'Remarks'
                    ],
                    [
                      '1',
                      'Method Statement Submitted',
                      'YES',
                      'NO',
                      'NA',
                      'Remarks'
                    ],
                  ],
                  null,
                  columnWidths: const {
                    0: p.FixedColumnWidth(12),
                    1: p.FixedColumnWidth(100),
                    2: p.FixedColumnWidth(15),
                    3: p.FixedColumnWidth(15),
                    4: p.FixedColumnWidth(15),
                    5: p.FixedColumnWidth(50),
                  }),
              _buildTable([
                ['After Excavation'],
              ], p.Alignment.center),
              _buildTable(
                  [
                    [
                      '1',
                      'Method Statement Submitted',
                      'YES',
                      'NO',
                      'NA',
                      'Remarks'
                    ],
                    [
                      '1',
                      'Method Statement Submitted',
                      'YES',
                      'NO',
                      'NA',
                      'Remarks'
                    ],
                    [
                      '1',
                      'Method Statement Submitted',
                      'YES',
                      'NO',
                      'NA',
                      'Remarks'
                    ],
                    [
                      '1',
                      'Method Statement Submitted',
                      'YES',
                      'NO',
                      'NA',
                      'Remarks'
                    ],
                    [
                      '1',
                      'Method Statement Submitted',
                      'YES',
                      'NO',
                      'NA',
                      'Remarks'
                    ],
                  ],
                  null,
                  columnWidths: const {
                    0: p.FixedColumnWidth(12),
                    1: p.FixedColumnWidth(100),
                    2: p.FixedColumnWidth(15),
                    3: p.FixedColumnWidth(15),
                    4: p.FixedColumnWidth(15),
                    5: p.FixedColumnWidth(50),
                  }),
              _buildTable([
                ['Observations (if any)', ''],
              ], null),
              _buildTable(
                  [
                    [
                      '',
                      'Above Observations attended to and completed',
                      'YES',
                      'NO',
                      'N/A',
                      'Remarks'
                    ],
                  ],
                  null,
                  columnWidths: const {
                    0: p.FixedColumnWidth(12),
                    1: p.FixedColumnWidth(100),
                    2: p.FixedColumnWidth(15),
                    3: p.FixedColumnWidth(15),
                    4: p.FixedColumnWidth(15),
                    5: p.FixedColumnWidth(50),
                  }),
              _buildTable([
                [
                  'Note: The quantity mentioned above is approximate measure and cannot be considered for any billing purpose. Only JMS to be considered for billing else GFC drawings are to be referred for quantity.'
                ],
              ], null),
              _buildTable([
                ['The above works have been completed and accepted'],
              ], null),
              _buildTable(
                  [
                    ['Vendor', 'CBRE', 'Client'],
                  ],
                  p.Alignment.center,
                  columnWidths: const {
                    0: p.FixedColumnWidth(100),
                    1: p.FixedColumnWidth(100),
                    2: p.FixedColumnWidth(100),
                    3: p.FixedColumnWidth(100),
                  }),
              _buildTable(
                  [
                    ['Signature', '', 'Signature', '', 'Signature', ''],
                    ['Name', '', 'Name', '', 'Name', ''],
                    ['Date', '', 'Date', '', 'Date', ''],
                  ],
                  null,
                  columnWidths: const {
                    0: p.FixedColumnWidth(100),
                    1: p.FixedColumnWidth(100),
                    2: p.FixedColumnWidth(100),
                    3: p.FixedColumnWidth(100),
                    4: p.FixedColumnWidth(100),
                    5: p.FixedColumnWidth(100),
                    6: p.FixedColumnWidth(100),
                  }),
              _buildTable(
                  [
                    ['Distribution', 'Original: CBRE - QS', 'cc : Vendor'],
                  ],
                  null,
                  columnWidths: const {
                    0: p.FixedColumnWidth(100),
                    1: p.FixedColumnWidth(100),
                    2: p.FixedColumnWidth(100),
                    3: p.FixedColumnWidth(100),
                  }),
            ],
          ),
        ],
      ),
    );

    return pdf.save();
  }

  p.Table _buildTable(List<List<String>> data, p.Alignment? alignment,
      {Map<int, p.TableColumnWidth>? columnWidths}) {
    return p.Table(
      border: const p.TableBorder(
        top: p.BorderSide(width: 1, color: PdfColors.black),
        bottom: p.BorderSide(width: 1, color: PdfColors.black),
        left: p.BorderSide(width: 1, color: PdfColors.black),
        right: p.BorderSide(width: 1, color: PdfColors.black),
        horizontalInside: p.BorderSide(width: 1, color: PdfColors.grey),
        verticalInside: p.BorderSide(width: 1, color: PdfColors.grey),
      ),
      columnWidths: columnWidths ?? const {0: p.IntrinsicColumnWidth()},
      children: data.map((row) {
        return p.TableRow(
          children: row.map((cell) {
            return p.Container(
              alignment: alignment ?? p.Alignment.centerLeft,
              padding: const p.EdgeInsets.all(4),
              child: p.Text(cell, style: const p.TextStyle(fontSize: 8)),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
