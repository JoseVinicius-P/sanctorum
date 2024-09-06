class Validator<T>{
  String? validate(T? value){
    String? error;
    if(value == null){
      error = 'Este campo deve ser preenchido!';
    }
    return error;
  }
}

class StringValidator extends Validator<String>{

  @override
  String? validate(String? value) {
    String? error = super.validate(value);
    if(error == null){
      if(value!.isEmpty){
        error = 'Este campo deve ser preenchido!';
      }
    }
    return error;
  }
}

class EmailValidator extends StringValidator{

  @override
  String? validate(String? value) {
    String? error = super.validate(value);
    if(error == null){
      // Verifica se o email contém o caractere @
      if (!value!.contains('@')) {
        error = 'Email inválido';
      }else{
        // Divide o endereço de e-mail em nome de usuário e domínio
        final List<String> parts = value.split('@');
        final String username = parts[0];
        final String domain = parts[1];

        // Verifica se há caracteres especiais não permitidos no nome de usuário
        final RegExp usernameRegExp = RegExp(r'^[\w.]+$');
        if (!usernameRegExp.hasMatch(username)) {
          error = 'Email inválido';
        }

        // Verifica se há caracteres especiais não permitidos no domínio
        final RegExp domainRegExp = RegExp(r'^[\w-.]+$');
        if (!domainRegExp.hasMatch(domain)) {
          error = 'Email inválido';
        }
      }
    }
    return error;
  }
}

class NameValidator extends StringValidator{

  @override
  String? validate(String? value) {
    String? error = super.validate(value);
    if(error == null){
      // Verifica se o nome contém apenas caracteres alfabéticos, espaços, hífens e apóstrofos
      final RegExp nameRegExp = RegExp(r'^[a-zA-ZÀ-ÿ\s\-]+$');
      if (!nameRegExp.hasMatch(value!)) {
        error = 'O nome contém caracteres não permitidos';
      }
    }
    return error;
  }
}

class CpfValidator extends StringValidator{

  @override
  String? validate(String? value) {
    String? error = super.validate(value);
    if(error == null){
      // Remove caracteres não numéricos do CPF
      value = value!.replaceAll(RegExp(r'\D'), '');

      // Verifica se o CPF tem 11 dígitos
      if (value.length != 11) {
        error = 'O CPF deve conter 11 dígitos.';
      // Verifica se todos os dígitos são iguais, o que é inválido para um CPF válido
      }else if (value.split('').toSet().length == 1) {
        error = 'CPF inválido.';
      }else if (!_isValidCPF(value)) {
        error = 'CPF inválido.';
      }
    }
    return error;
  }

  bool _isValidCPF(String cpf) {
    List<int> numbers = cpf.split('').map(int.parse).toList();

    // Verifica o primeiro dígito verificador
    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += numbers[i] * (10 - i);
    }
    int rest = sum % 11;
    int firstVerifier;
    if(rest < 2){
      firstVerifier = 0;
    }else{
      firstVerifier = 11-rest;
    }

    if (firstVerifier != numbers[9]) {
      return false;
    }

    // Verifica o segundo dígito verificador
    sum = 0;
    for (int i = 0; i < 10; i++) {
      sum += numbers[i] * (11 - i);
    }

    int rest2 = sum % 11;
    int secondVerifier;
    if(rest2 < 2){
      secondVerifier = 0;
    }else{
      secondVerifier = 11-rest2;
    }
    if (secondVerifier != numbers[10]) {
      return false;
    }

    return true;
  }
}

class PasswordValidator extends StringValidator{

  @override
  String? validate(String? value) {
    String? error = super.validate(value);
    if(error == null){
      if(value!.length < 6){
        error = 'Senha deve no mínimo 6 caracteres';
      }
    }
    return error;
  }
}

class ConfirmPasswordValidator extends StringValidator{
  final String match;

  ConfirmPasswordValidator({required this.match});

  @override
  String? validate(String? value) {
    String? error = super.validate(value);

    if(error == null){
      if(value != match){
        error = "As senhas não conferem";
      }
    }

    return error;
  }
}

class CnpjValidator extends StringValidator{
  @override
  String? validate(String? value) {
    String? error = super.validate(value);

    if(error == null){
      // Remove caracteres não numéricos
      value = value!.replaceAll(RegExp(r'\D'), '');

      if (value.length != 14) {
        return 'CNPJ deve conter 14 dígitos.';
      }

      // Verifica se todos os dígitos são iguais
      if (RegExp(r'^(\d)\1*$').hasMatch(value)) {
        return 'CNPJ inválido.';
      }

      // Calcula os dígitos verificadores
      final List<int> multipliers = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
      final List<int> cnpjDigits = value.split('').map(int.parse).toList();

      int sum = 0;
      for (int i = 0; i < 12; i++) {
        sum += cnpjDigits[i] * multipliers[i];
      }

      int remainder = sum % 11;
      int firstCheckDigit = remainder < 2 ? 0 : 11 - remainder;

      if (cnpjDigits[12] != firstCheckDigit) {
        return 'CNPJ inválido.';
      }

      multipliers.insert(0, 6);
      sum = 0;
      for (int i = 0; i < 13; i++) {
        sum += cnpjDigits[i] * multipliers[i];
      }

      remainder = sum % 11;
      int secondCheckDigit = remainder < 2 ? 0 : 11 - remainder;

      if (cnpjDigits[13] != secondCheckDigit) {
        return 'CNPJ inválido.';
      }
    }

    return error;
  }
}

class PhoneValidator extends StringValidator{
  @override
  String? validate(String? value) {
    String? error = super.validate(value);

    if(error == null){
      // Remove caracteres não numéricos
      value = value!.replaceAll(RegExp(r'\D'), '');

      // Verifica se o número tem pelo menos 10 dígitos
      if (value.length < 10) {
        return 'Número de telefone inválido. Deve conter pelo menos 10 dígitos.';
      }

      // Verifica se o número tem no máximo 11 dígitos (para o formato (##) ####-####)
      if (value.length != 11 && value.length != 10) {
        return 'Número de telefone inválido.';
      }
    }

    return error;
  }
}