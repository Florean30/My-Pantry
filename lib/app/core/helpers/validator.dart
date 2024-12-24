class Validator {
  // Fungsi umum untuk validasi dengan parameter required
  static String? rule(
    String? value, {
    bool required = false,
  }) {
    if (required && value!.isEmpty) {
      return "form ini wajib diisi";
    }
    return null;
  }

  // Fungsi untuk memvalidasi field yang wajib diisi
  static String? required(
    dynamic value, {
    String? fieldName,
  }) {
    if (value == null) {
      return "form ini wajib diisi";
    }

    // Validasi untuk tipe String
    if (value is String || value == null) {
      if (value.toString() == "null") return "form ini wajib diisi";
      if (value.isEmpty) return "form ini wajib diisi";
    }

    // Validasi untuk tipe List
    if (value is List) {
      if (value.isEmpty) return "form ini wajib diisi";
    }
    return null;
  }

  // Fungsi untuk memvalidasi format email
  static String? email(String? value) {
    if (value == null || value.isEmpty) return "masukkan email";

    // Validasi format email valid
    final bool isValidEmail =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$')
            .hasMatch(value);

    if (!isValidEmail) {
      return "format email tidak valid";
    }
    return null;
  }

  // Fungsi untuk memvalidasi password
  // Minimal 8 karakter
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "masukkan password";
    } else if (value.length < 8) {
      return "kata sandi harus 8 karakter atau lebih";
    }
    return null;
  }

  // Fungsi untuk memvalidasi input angka
  static String? number(String? value) {
    if (value == null || value.isEmpty) return "form ini wajib diisi";

    // Memastikan input hanya berisi angka
    final bool isNumber = RegExp(r"^[0-9]+$").hasMatch(value);
    if (!isNumber) {
      return "This field is not in a valid number format";
    }
    return null;
  }
}
