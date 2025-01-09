enum Quantity { kg, pcs, ikat }

extension QuantityExtension on Quantity {
  String get name {
    switch (this) {
      case Quantity.kg:
        return 'Kg';
      case Quantity.pcs:
        return 'Pcs';
      case Quantity.ikat:
        return 'Ikat';
    }
  }
}
