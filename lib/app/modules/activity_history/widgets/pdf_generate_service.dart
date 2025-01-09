import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_pantry/app/core/extensions/date_time_ext.dart';
import 'package:my_pantry/app/core/widgets/custom_snackbar.dart';
import 'package:my_pantry/app/data/models/storage/storages_model.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

// Service untuk generate PDF
class PdfGenerateService {
  // Membuat header untuk dokumen PDF
  PdfLayoutResult drawHeader(PdfPage page, Size pageSize, PdfGrid grid) {
    //Draw rectangle
    page.graphics.drawRectangle(
        brush: PdfSolidBrush(PdfColor(91, 126, 215)),
        bounds: Rect.fromLTWH(0, 0, pageSize.width - 115, 90));
    //Draw string
    page.graphics.drawString(
        'Aktivitas', PdfStandardFont(PdfFontFamily.helvetica, 30),
        brush: PdfBrushes.white,
        bounds: Rect.fromLTWH(25, 0, pageSize.width - 115, 90),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawRectangle(
        bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 90),
        brush: PdfSolidBrush(PdfColor(65, 104, 205)));

    page.graphics.drawString(r'' + getTotalAmount(grid).toString(),
        PdfStandardFont(PdfFontFamily.helvetica, 18),
        bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 100),
        brush: PdfBrushes.white,
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.middle));

    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);
    //Draw string
    page.graphics.drawString('Jumlah', contentFont,
        brush: PdfBrushes.white,
        bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 33),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.bottom));
    //Create data foramt and convert it to text.
    final DateFormat format = DateFormat.yMMMMd('en_US');
    final String invoiceNumber =
        'No Aktivitas: 2058557939\r\n\r\nTanggal: ${format.format(DateTime.now())}';
    final Size contentSize = contentFont.measureString(invoiceNumber);
    // ignore: leading_newlines_in_multiline_strings
    const String address = '''Mypantry.id''';

    PdfTextElement(text: invoiceNumber, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(pageSize.width - (contentSize.width + 30), 120,
            contentSize.width + 30, pageSize.height - 120));

    return PdfTextElement(text: address, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(30, 120,
            pageSize.width - (contentSize.width + 30), pageSize.height - 120))!;
  }

  // Menggambar grid/tabel pada dokumen PDF
  void drawGrid(PdfPage page, PdfGrid grid, PdfLayoutResult result) {
    Rect? totalPriceCellBounds;
    Rect? quantityCellBounds;
    //Invoke the beginCellLayout event.
    grid.beginCellLayout = (Object sender, PdfGridBeginCellLayoutArgs args) {
      final PdfGrid grid = sender as PdfGrid;
      if (args.cellIndex == grid.columns.count - 1) {
        totalPriceCellBounds = args.bounds;
      } else if (args.cellIndex == grid.columns.count - 2) {
        quantityCellBounds = args.bounds;
      }
    };
    //Draw the PDF grid and get the result.
    result = grid.draw(
        page: page, bounds: Rect.fromLTWH(0, result.bounds.bottom + 40, 0, 0))!;

    //Draw grand total.
    page.graphics.drawString('Grand Total',
        PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(
            quantityCellBounds!.left,
            result.bounds.bottom + 10,
            quantityCellBounds!.width,
            quantityCellBounds!.height));
    page.graphics.drawString(getTotalAmount(grid).toString(),
        PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(
            totalPriceCellBounds!.left,
            result.bounds.bottom + 10,
            totalPriceCellBounds!.width,
            totalPriceCellBounds!.height));
  }

  // Menggambar footer pada dokumen PDF
  void drawFooter(PdfPage page, Size pageSize) {
    final PdfPen linePen =
        PdfPen(PdfColor(142, 170, 219), dashStyle: PdfDashStyle.custom);
    linePen.dashPattern = <double>[3, 3];
    //Draw line
    page.graphics.drawLine(linePen, Offset(0, pageSize.height - 100),
        Offset(pageSize.width, pageSize.height - 100));

    const String footerContent =
        // ignore: leading_newlines_in_multiline_strings
        '''Mypantry.id''';

    //Added 30 as a margin for the layout
    page.graphics.drawString(
        footerContent, PdfStandardFont(PdfFontFamily.helvetica, 9),
        format: PdfStringFormat(alignment: PdfTextAlignment.right),
        bounds: Rect.fromLTWH(pageSize.width - 30, pageSize.height - 70, 0, 0));
  }

  // Membuat dan mengatur struktur grid/tabel PDF
  PdfGrid getGrid(RxList<StoragesModel> activities) {
    // Membuat grid PDF baru
    final PdfGrid grid = PdfGrid();
    grid.columns.add(count: 6);

    // Mengatur header tabel
    final PdfGridRow headerRow = grid.headers.add(1)[0];
    headerRow.style.backgroundBrush = PdfSolidBrush(PdfColor(68, 114, 196));
    headerRow.style.textBrush = PdfBrushes.white;

    // Mengatur nilai-nilai header
    headerRow.cells[0].stringFormat.alignment = PdfTextAlignment.center;
    headerRow.cells[0].value = 'No Aktivitas';
    headerRow.cells[1].value = 'Kategori';
    headerRow.cells[2].value = 'Nama Bahan';
    headerRow.cells[3].value = 'Aktivitas';
    headerRow.cells[4].value = 'Tanggal';
    headerRow.cells[5].value = 'Jumlah';

    // Menambahkan data aktivitas ke dalam grid
    for (var activity in activities) {
      addProducts(
        activity.id.toString(),
        activity.category!.nameCategory,
        activity.name,
        activity.activity,
        activity.activityDate!.toFormattedDate(),
        activity.quantity,
        grid,
      );
    }

    //Apply the table built-in style
    grid.applyBuiltInStyle(PdfGridBuiltInStyle.listTable4Accent5);
    //Set gird columns width
    grid.columns[1].width = 200;

    for (int i = 0; i < headerRow.cells.count; i++) {
      headerRow.cells[i].style.cellPadding =
          PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
    }
    for (int i = 0; i < grid.rows.count; i++) {
      final PdfGridRow row = grid.rows[i];
      for (int j = 0; j < row.cells.count; j++) {
        final PdfGridCell cell = row.cells[j];
        if (j == 0) {
          cell.stringFormat.alignment = PdfTextAlignment.center;
        }
        cell.style.cellPadding =
            PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
      }
    }
    return grid;
  }

  // Menambahkan baris baru ke dalam grid
  void addProducts(
    String noAktivitas,
    String kategori,
    String namaBahan,
    String aktivitas,
    String tanggal,
    int jumlah,
    PdfGrid grid,
  ) {
    final PdfGridRow row = grid.rows.add();
    row.cells[0].value = noAktivitas;
    row.cells[1].value = kategori;
    row.cells[2].value = namaBahan;
    row.cells[3].value = aktivitas;
    row.cells[4].value = tanggal;
    row.cells[5].value = jumlah.toString();
  }

  // Menghitung total jumlah dari semua baris
  double getTotalAmount(PdfGrid grid) {
    double total = 0;
    for (int i = 0; i < grid.rows.count; i++) {
      final String value =
          grid.rows[i].cells[grid.columns.count - 1].value as String;
      total += double.parse(value);
    }
    return total;
  }

  // Menyimpan dan membuka file PDF
  Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
    try {
      // Memeriksa izin penyimpanan untuk Android 10+
      if (Platform.isAndroid) {
        if (await Permission.manageExternalStorage.request().isGranted) {
          // Lanjutkan jika izin diberikan
        } else {
          CustomSnackBar.showCustomToastError(
            message: "Izin penyimpanan diperlukan untuk menyimpan file",
          );
          return;
        }
      }

      // Menentukan lokasi penyimpanan
      String path = '/storage/emulated/0/Download';

      // Membuat direktori jika belum ada
      Directory directory = Directory(path);
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      // Menyimpan file
      final file = File('$path/$fileName');
      await file.writeAsBytes(bytes, flush: true);

      // Mencoba membuka file yang sudah disimpan
      final result = await OpenFile.open('$path/$fileName');
      if (result.type != ResultType.done) {
        CustomSnackBar.showCustomToastError(
          message: "Gagal membuka file: ${result.message}",
        );
      }
    } catch (e) {
      // Menangani error
      log('Error menyimpan file: $e');
      CustomSnackBar.showCustomToastError(
        message: "Gagal menyimpan file: $e",
      );
    }
  }
}
