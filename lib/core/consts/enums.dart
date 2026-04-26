// ignore_for_file: constant_identifier_names

enum Language {
  ar,
  en,
}

enum UserType {
  student,
}

Language checkLanguage(String language) {
  switch (language) {
    case 'en':
      return Language.en;

    default:
      return Language.ar;
  }
}
