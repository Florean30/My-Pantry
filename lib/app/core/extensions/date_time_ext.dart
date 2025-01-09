// Extension untuk menambah fungsi format tanggal pada class DateTime
extension DateTimeExt on DateTime {
  // Mengubah format DateTime menjadi string dengan format "dd/MM/yyyy"
  String toFormattedDate() {
    return '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year';
  }
}
