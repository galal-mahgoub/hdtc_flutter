import 'package:hdtc_on/core/services/language_service.dart';

class ApiUrls {
  static const String baseUrl = 'https://hdtc-on.com/api/development';
  static const String baseUrlWithoutDevelopment = 'https://hdtc-on.com/api';

  static String get userData => '$baseUrl/public/user-auth-data';

  static String get verifyForgotPassCode =>
      '$baseUrl/public/password/reset/check-single-code';

  // new-----------------------------
  static String get login => '$baseUrl/login';
  static String get changePassword => '$baseUrl/panel/profile-setting/password';
  static String get logout => '$baseUrl/logout';
  static String get register => '$baseUrl/register';
  static String get verifyCode => '$baseUrl/register/step/2';
  static String get resendVerifyCode => '$baseUrl/resend-verification';
  static String get sendForgotPassCode => '$baseUrl/forget-password';
  static String resetForgotPass({required String token}) =>
      '$baseUrl/reset-password/$token';
  static String get updateProfile => '$baseUrl/panel/profile-setting';
  static String get updateProfileImg => '$baseUrl/panel/profile-setting/images';
  static String get changeLanguage => '$baseUrl/panel/profile-setting';
  static String get allNotifications => '$baseUrl/panel/notifications';
  static String get certificates => '$baseUrl/panel/webinars/certificates';
  static String get classCertificates => '$baseUrl/panel/certificates/created';
  static String get favorites => '$baseUrl/panel/favorites';
  static String get comments => '$baseUrl/panel/comments';
  static String get subscribes => '$baseUrl/panel/subscribe';
  static String get summerys => '$baseUrl/panel/financial/summary';
  static String get checkSubscribes => '$baseUrl/panel/subscribe/web_pay';
  static String get tickets => '$baseUrl/panel/support/tickets';
  static String get myClassTickets => '$baseUrl/panel/support/my_class_support';
  static String get departments => '$baseUrl/panel/support/departments';
  static String get sendTicket => '$baseUrl/panel/support';
  static String get allCategories => '$baseUrl/categories';
  static String get trendCategories => '$baseUrl/trend-categories';

  static String get instructors => '$baseUrl/providers/instructors';
  static String get cartList => '$baseUrl/panel/cart/list';
  static String get deletecartItem => '$baseUrl/panel/cart/';
  static String get checkCoupon => '$baseUrl/panel/cart/coupon/validate';
  static String get checkout => '$baseUrl/panel/cart/web_checkout';
  static String get quickInfo => '$baseUrl/panel/quick-info';
  static String get createMeeting => '$baseUrl/meetings/reserve';
  static String get getCountry => '$baseUrlWithoutDevelopment/get-country';
  static String get businessConsultations =>
      '$baseUrl/providers/businessConsultations';
  static String providerInfo({required String? providerId}) =>
      '$baseUrl/users/$providerId/profile';
  static String closeTicket({required String ticketId}) =>
      '$baseUrl/panel/support/$ticketId/close';
  static String replyTicket({required String ticketId}) =>
      '$baseUrl/panel/support/$ticketId/conversations';
  static String followProvider({required int providerId}) =>
      '$baseUrl/panel/users/$providerId/follow';
  static String consultantMeetingsDate({required int providerId}) =>
      '$baseUrl/users/$providerId/meetings';
  static String categoryCourses({required String categoryId}) =>
      '$baseUrl/categories/$categoryId/webinars';
  static String get blogs => '$baseUrl/blogs';
  static String get sendBlogComment => '$baseUrl/panel/comments';
  static String get timezones => '$baseUrl/timezones';
  static String get countries => '$baseUrl/regions/countries';
  static String get blogsCategories => '$baseUrl/blogs/categories';
  static String get courses => '$baseUrl/courses';
  static String get searchCourses => '$baseUrl/search';
  static String get courseDetails => '$baseUrl/courses/';
  static String get addFavorite => '$baseUrl/panel/favorites/toggle/';
  static String get reasons => '$baseUrl/courses/reports/reasons';
  static String get addCourseComment => '$baseUrl/panel/comments';
  static String get addCourseReview => '$baseUrl/panel/reviews';
  static String get editQuestion => '$baseUrl/panel/webinars/forums/';
  static String get purchasesCourses => '$baseUrl/panel/webinars/purchases';
  static String replyToComment({required String commentId}) =>
      '$baseUrl/panel/comments/$commentId/reply';
  static String getProvinces({required String countryId}) =>
      '$baseUrl/regions/provinces/$countryId';
  static String getCities({required String provinceId}) =>
      '$baseUrl/regions/cities/$provinceId';
  static String getDistricts({required String cityId}) =>
      '$baseUrl/regions/districts/$cityId';
  static String readLesson({required String courseId}) =>
      '$baseUrl/courses/$courseId/toggle';
  static String storeResult({required String quizId}) =>
      '$baseUrl/panel/quizzes/$quizId/store-result';
  static String addCourseFree({required String courseId}) =>
      '$baseUrl/panel/webinars/$courseId/free';
  static String forums({required String courseId}) =>
      '$baseUrl/panel/webinars/$courseId/forums';
  static String notices({required String courseId}) =>
      '$baseUrl/panel/webinars/$courseId/noticeboards';
  static String getQuizResult({required String quizId}) =>
      '$baseUrl/panel/quizzes/$quizId/result';
  static String startQuiz({required String quizId}) =>
      '$baseUrl/panel/quizzes/$quizId/start';

  static String addReport({required String courseId}) =>
      '$baseUrl/courses/$courseId/report';
  static String courseContent({required String courseId}) =>
      '$baseUrl/courses/$courseId/content';
  static String get featuredCourses => '$baseUrl/featured-courses';
  static String get myCourses => '$baseUrl/panel/webinars/purchases';
  static String get meetings => '$baseUrl/panel/meetings';
  static String get createMeetingLink =>
      '$baseUrl/instructor/meetings/create-link';
  static String finishMeetings({required String meetingId}) =>
      '$baseUrl/panel/meetings/$meetingId/finish';

  static Map<String, String> getHeaders({String? token, String? lang}) => {
        if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
        'x-locale': LanguageService.to.savedLang.value.name,
        'x-api-key': '1234',
      };
}
