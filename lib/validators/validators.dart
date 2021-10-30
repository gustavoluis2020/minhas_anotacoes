class Validator {
  static String? validadeField({required String value}) {
    if (value.isEmpty) {
      return 'Campo nao pode ser vazio';
    }
    return null;
  }

  static String? validadeUserId({required String uid}) {
    if (uid.isEmpty) {
      return 'ID do usuario nao poder vazio';
    } else if (uid.length <= 5) {
      return 'ID do usuario tem que ser maior que 5 caracteres';
    }
    return null;
  }
}
