import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MyMasks{
  static final phoneMaskFormatter = MaskTextInputFormatter(
      mask: '(##) #########',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  static final cnpjMaskFormatter = MaskTextInputFormatter(
      mask: '##.###.###/####-##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  static final cpfMaskFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  static final cepMaskFormatter = MaskTextInputFormatter(
      mask: '## ###-###',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  static final yearMaskFormatter = MaskTextInputFormatter(
      mask: '####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  static final monthMaskFormatter = MaskTextInputFormatter(
      mask: '##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  static final dayMaskFormatter = MaskTextInputFormatter(
      mask: '##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class YearRangeInputFormatter extends TextInputFormatter {
  final int minYear;
  final int maxYear;

  YearRangeInputFormatter({required this.minYear, required this.maxYear});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Remove qualquer caractere não numérico
    String newText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    // Se o texto for vazio, retorne o valor original
    if (newText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Converta para um número
    int? newNumber = int.tryParse(newText);
    if (newNumber == null) {
      return oldValue;
    }

    // Verifique se está dentro do intervalo permitido
    if (newNumber < minYear) {
      newNumber = minYear;
    } else if (newNumber > maxYear) {
      newNumber = maxYear;
    }

    // Retorne o valor formatado
    return newValue.copyWith(
      text: newNumber.toString().padLeft(4, '0'),
      selection: TextSelection.collapsed(offset: newNumber.toString().length),
    );
  }
}

class MonthRangeInputFormatter extends TextInputFormatter {

  int? year;

  MonthRangeInputFormatter({this.year});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Remove qualquer caractere não numérico
    String newText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    // Se o texto for vazio, retorne o valor original
    if (newText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Converta para um número
    int? newNumber = int.tryParse(newText);
    if (newNumber == null) {
      return oldValue;
    }

    if(year == DateTime.now().year){
      if (newNumber < 1) {
        newNumber = 1;
      } else if (newNumber > DateTime.now().month) {
        newNumber = DateTime.now().month;
      }
    }else{
      if (newNumber < 1) {
        newNumber = 1;
      } else if (newNumber > 12) {
        newNumber = 12;
      }
    }

    // Retorne o valor formatado
    return newValue.copyWith(
      text: newNumber.toString().padLeft(2, '0'),
      selection: TextSelection.collapsed(offset: newNumber.toString().length),
    );
  }
}

class DayRangeInputFormatter extends TextInputFormatter {
  final int month;
  final int year;

  DayRangeInputFormatter({required this.month, required this.year});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Remove qualquer caractere não numérico
    String newText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    // Se o texto for vazio, retorne o valor original
    if (newText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Converta para um número
    int? newDay = int.tryParse(newText);
    if (newDay == null) {
      return oldValue;
    }

    int daysInMonth = _daysInMonth(month, year);

    if(year == DateTime.now().year && month == DateTime.now().month){
      daysInMonth = DateTime.now().day;
    }

    // Verifique se está dentro do intervalo permitido
    if (newDay < 1) {
      newDay = 1;
    } else if (newDay > daysInMonth) {
      newDay = daysInMonth;
    }

    // Retorne o valor formatado
    return newValue.copyWith(
      text: newDay.toString().padLeft(2, '0'),
      selection: TextSelection.collapsed(offset: newDay.toString().length),
    );
  }

  int _daysInMonth(int month, int year) {
    if (month < 1 || month > 12) return 0;
    List<int> daysInMonth = [31, 28 + (_isLeapYear(year) ? 1 : 0), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    return daysInMonth[month - 1];
  }

  bool _isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }
}