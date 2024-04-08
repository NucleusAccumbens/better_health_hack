// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// DO NOT REMOVE OR MODIFY THE CODE ABOVE!';

import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mime_type/mime_type.dart';
import 'dart:typed_data';
import 'dart:convert';

Future savePdfNote(String? situation, String? thoughts, String? emotions,
    String? emotion, DateTime dateTime) async {
  // Add your function code here!
  final pdf = pw.Document();

  // Font
  final font = await PdfGoogleFonts.nunitoExtraLight();

  // Formatting function
  pw.Widget _buildParagraph(String title, String? text, {bool bold = false}) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(
              font: font,
              fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal),
        ),
        pw.SizedBox(height: 5),
        pw.Text(
          text ?? '',
          style: pw.TextStyle(font: font),
        ),
        pw.SizedBox(height: 10),
      ],
    );
  }

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Date and Time: ${dateTime?.toString()}'),
            _buildParagraph('Situation', situation, bold: true),
            _buildParagraph('Thoughts', thoughts),
            _buildParagraph('Emotions', emotions),
            _buildParagraph('Emotion', emotion),
          ],
        );
      },
    ),
  );

// Get the directory for the Downloads folder
  final directory = Platform.isAndroid
      ? await getExternalStorageDirectory()
      : await getApplicationDocumentsDirectory();

  final file = File('${directory!.path}/note.pdf');
  await file.writeAsBytes(await pdf.save());

  // Show user the path where the file was saved
  print('Note saved to: ${file.path}');
}
