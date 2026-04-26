import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'core/consts/k_strings.dart';
import 'core/network/network_info.dart';
import 'core/services/language_service.dart';
import 'core/services/user_service.dart';
import 'core/network/handler.dart';

import 'core/services/video_service.dart';
import 'features/auth_feature/data/data_source/auth_local_data_source.dart';
import 'features/auth_feature/data/data_source/auth_remote_data_source.dart';
import 'features/auth_feature/data/repositories/auth_repository.dart';
import 'features/auth_feature/domain/repositories/base_auth_repository.dart';
import 'features/auth_feature/domain/use_cases/get_country_use_case.dart';
import 'features/auth_feature/domain/use_cases/get_quick_info_use_case.dart';
import 'features/auth_feature/domain/use_cases/get_user_data_use_case.dart';
import 'features/blog_feature/data/data_source/blog_remote_data_source.dart';
import 'features/blog_feature/data/repositories/blog_repository.dart';
import 'features/blog_feature/domain/repositories/base_blog_repository.dart';
import 'features/blog_feature/domain/use_cases/blogs_categories_use_case.dart';
import 'features/blog_feature/domain/use_cases/blogs_use_case.dart';
import 'features/cart_feature/data/data_source/cart_remote_data_source.dart';
import 'features/cart_feature/data/repositories/cart_repository.dart';
import 'features/cart_feature/domain/repositories/base_cart_repository.dart';
import 'features/cart_feature/domain/use_cases/check_coupon_use_case.dart';
import 'features/cart_feature/domain/use_cases/checkout_use_case.dart';
import 'features/cart_feature/domain/use_cases/delete_cart_item_use_case.dart';
import 'features/cart_feature/domain/use_cases/get_cart_list_use_case.dart';
import 'features/category_feature/data/data_sources/category_remote_data_source.dart';
import 'features/category_feature/data/repositories/category_repository.dart';
import 'features/category_feature/domain/repositories/base_category_repository.dart';
import 'features/category_feature/domain/use_cases/get_all_categories_use_case.dart';
import 'features/category_feature/domain/use_cases/get_category_courses_use_case.dart';
import 'features/category_feature/domain/use_cases/get_trend_categories_use_case.dart';
import 'features/course_feature/data/data_source/course_local_data_source.dart';
import 'features/course_feature/data/data_source/course_remote_data_source.dart';
import 'features/course_feature/data/repositories/course_repository.dart';
import 'features/course_feature/domain/repositories/base_course_repository.dart';
import 'features/course_feature/domain/use_cases/add_course_free_use_case.dart';
import 'features/course_feature/domain/use_cases/add_course_review_use_case.dart';
import 'features/course_feature/domain/use_cases/add_favorite_use_case.dart';
import 'features/course_feature/domain/use_cases/add_report_use_case.dart';
import 'features/course_feature/domain/use_cases/course_details_use_case.dart';
import 'features/course_feature/domain/use_cases/courses_use_case.dart';
import 'features/course_feature/domain/use_cases/featured_courses_use_case.dart';
import 'features/course_feature/domain/use_cases/get_course_content_use_case.dart';
import 'features/course_feature/domain/use_cases/get_reasons_use_case.dart';
import 'features/course_feature/domain/use_cases/reply_to_comment_use_case.dart';
import 'features/course_feature/domain/use_cases/search_courses_use_case.dart';
import 'features/course_feature/domain/use_cases/send_course_comment_use_case.dart';
import 'features/language_feature/data/data_source/language_local_data_source.dart';
import 'features/language_feature/data/data_source/language_remote_data_source.dart';
import 'features/language_feature/data/repositories/language_repository.dart';
import 'features/language_feature/domain/repositories/base_language_repository.dart';
import 'features/language_feature/domain/use_cases/get_language_use_case.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'features/notification_feature/data/data_sources/notification_remote_data_source.dart';
import 'features/notification_feature/data/repositories/notification_repository.dart';
import 'features/notification_feature/domain/repositories/base_notification_repository.dart';
import 'features/notification_feature/domain/use_cases/get_all_notifications_use_case.dart';
import 'features/others_feature/data/data_sources/others_remote_data_source.dart';
import 'features/others_feature/data/repositories/others_repository.dart';
import 'features/others_feature/domain/repositories/base_others_repository.dart';
import 'features/provider_feature/data/data_source/provider_remote_data_source.dart';
import 'features/provider_feature/data/repositories/provider_repository.dart';
import 'features/provider_feature/domain/repositories/base_provider_repository.dart';
import 'features/provider_feature/domain/use_cases/business_consultations_use_case.dart';
import 'features/provider_feature/domain/use_cases/create_meeting_use_case.dart';
import 'features/provider_feature/domain/use_cases/follow_provider_use_case.dart';
import 'features/provider_feature/domain/use_cases/get_consultant_meetings_date_use_case.dart';
import 'features/provider_feature/domain/use_cases/instructors_use_case.dart';
import 'features/provider_feature/domain/use_cases/provider_info_use_case.dart';
import 'features/video_feature/data/data_sources/video_local_data_source.dart';
import 'features/video_feature/data/repositories/video_repository.dart';
import 'features/video_feature/domain/repositories/base_video_repository.dart';
import 'features/video_feature/domain/use_cases/get_all_videos_use_case.dart';
import 'features/video_feature/domain/use_cases/remove_videos_use_case.dart';
import 'features/video_feature/domain/use_cases/save_videos_use_case.dart';
import 'firebase_options.dart';

Future<void> init() async {
  //! External

  await FlutterDownloader.initialize();

  timeago.setLocaleMessages('ar', timeago.ArMessages());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await GetStorage.init(Kstrings.projectName);

  final messaging = FirebaseMessaging.instance;

  

  Get.lazyPut(
    () => GetStorage(Kstrings.projectName),
    fenix: true,
  );

  Get.lazyPut(
    () => messaging,
    fenix: true,
  );

  Get.lazyPut(
    () => const FlutterSecureStorage(),
    fenix: true,
  );

  Get.lazyPut(
    () => InternetConnectionChecker(),
    fenix: true,
  );

  //! Core
  Get.lazyPut<NetworkInfo>(
    () => NetworkInfoImpl(
      internetConnectionChecker: Get.find(),
    ),
    fenix: true,
  );

  ///--------------------------- AUTH FEATURE ----------------------------------

  // Data sources
  Get.lazyPut<BaseAuthLocalDataSource>(
    () => AuthLocalDataSource(
      getStorage: Get.find(),
      flutterSecureStorage: Get.find(),
    ),
    fenix: true,
  );
  Get.lazyPut<BaseAuthRemoteDataSource>(
    () => AuthRemoteDataSource(),
    fenix: true,
  );

  // Repository
  Get.lazyPut<BaseAuthRepository>(
    () => AuthRespoitory(
      baseAuthRemoteDataSource: Get.find(),
      firebaseMessaging: Get.find(),
      handler: Get.find(),
    ),
    fenix: true,
  );

  // Use cases
  Get.lazyPut(
    () => GetUserDataUseCase(baseAuthRepository: Get.find()),
    fenix: true,
  );

  Get.lazyPut(
    () => GetCountryUseCase(baseAuthRepository: Get.find()),
    fenix: true,
  );

  Get.lazyPut(
    () => GetQuickInfoUseCase(baseAuthRepository: Get.find()),
    fenix: true,
  );

  ///--------------------------- LANGUAGE FEATURE ------------------------------

  // Data sources
  Get.lazyPut<BaseLanguageRemoteDataSource>(
    () => LanguageRemoteDataSource(),
    fenix: true,
  );

  Get.lazyPut<BaseLanguageLocalDataSource>(
    () => LanguageLocalDataSource(
      getStorage: Get.find(),
    ),
    fenix: true,
  );

  // Repository
  Get.lazyPut<BaseLanguageRepository>(
    () => LanguageRespoitory(
      baseLanguageRemoteDataSource: Get.find(),
      errorHandler: Get.find(),
    ),
    fenix: true,
  );

  // Use cases
  Get.lazyPut(
    () => GetLanguageUseCase(baseLanguageRepository: Get.find()),
    fenix: true,
  );

  ///--------------------------- COURSE FEATURE ----------------------------------

  // Data sources
  Get.lazyPut<BaseCourseRemoteDataSource>(
    () => CourseRemoteDataSource(
        // dio: Get.find(),
        ),
    fenix: true,
  );

  Get.lazyPut<BaseCourseLocalDataSource>(
    () => CourseLocalDataSource(
      getStorage: Get.find(),
      flutterSecureStorage: Get.find(),
    ),
    fenix: true,
  );

  // Repository
  Get.lazyPut<BaseCourseRepository>(
    () => CourseRespoitory(
      baseCourseRemoteDataSource: Get.find(),
      baseCourseLocalDataSource: Get.find(),
      firebaseMessaging: Get.find(),
      handler: Get.find(),
    ),
    fenix: true,
  );

  // Use cases
  Get.lazyPut(
    () => FeaturedCoursesUseCase(
      baseCourseRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => CoursesUseCase(
      baseCourseRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => SearchCoursesUseCase(
      baseCourseRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => CourseDetailsUseCase(
      baseCourseRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => AddFavoriteUseCase(
      baseCourseRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => GetReasonsUseCase(
      baseCourseRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => AddReportUseCase(
      baseCourseRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => GetCourseContentUseCase(
      baseCourseRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => SendCourseCommentUseCase(
      baseCourseRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => ReplyToCommentUseCase(
      baseCourseRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => AddCourseReviewUseCase(
      baseCourseRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => AddCourseFreeUseCase(
      baseCourseRepository: Get.find(),
    ),
    fenix: true,
  );

  ///--------------------------- BLOG FEATURE ----------------------------------

  // Data sources
  Get.lazyPut<BaseBlogRemoteDataSource>(
    () => BlogRemoteDataSource(),
    fenix: true,
  );

  // Repository
  Get.lazyPut<BaseBlogRepository>(
    () => BlogRespoitory(
      baseAuthRemoteDataSource: Get.find(),
      firebaseMessaging: Get.find(),
      handler: Get.find(),
    ),
    fenix: true,
  );

  // Use cases
  Get.lazyPut(
    () => BlogsUseCase(
      baseBlogRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => BlogsCategoriesUseCase(
      baseBlogRepository: Get.find(),
    ),
    fenix: true,
  );

  ///--------------------------- PROVIDER FEATURE ----------------------------------

  // Data sources
  Get.lazyPut<BaseProviderRemoteDataSource>(
    () => ProviderRemoteDataSource(),
    fenix: true,
  );

  // Repository
  Get.lazyPut<BaseProviderRepository>(
    () => ProviderRespoitory(
      baseProviderRemoteDataSource: Get.find(),
      firebaseMessaging: Get.find(),
      handler: Get.find(),
    ),
    fenix: true,
  );

  // Use cases
  Get.lazyPut(
    () => InstructorsUseCase(
      baseProviderRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => GetConsultantMeetingsUseCase(
      baseProviderRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => BusinessConsultationsUseCase(
      baseProviderRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => ProviderInfoUseCase(
      baseProviderRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => FollowProviderUseCase(
      baseProviderRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => CreateMeetingUseCase(
      baseProviderRepository: Get.find(),
    ),
    fenix: true,
  );

  ///--------------------------- CART FEATURE ----------------------------------

  // Data sources
  Get.lazyPut<BaseCartRemoteDataSource>(
    () => CartRemoteDataSource(),
    fenix: true,
  );

  // Repository
  Get.lazyPut<BaseCartRepository>(
    () => CartRespoitory(
      baseCartRemoteDataSource: Get.find(),
      firebaseMessaging: Get.find(),
      handler: Get.find(),
    ),
    fenix: true,
  );

  // Use cases
  Get.lazyPut(
    () => GetCartListUseCase(
      baseCartRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => DeleteCartItemUseCase(
      baseCartRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => CheckCouponUseCase(
      baseCartRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => CheckoutUseCase(
      baseCartRepository: Get.find(),
    ),
    fenix: true,
  );

  ///--------------------------- CART FEATURE ----------------------------------

  // Data sources
  Get.lazyPut<BaseNotificationRemoteDataSource>(
    () => NotificationRemoteDataSource(),
    fenix: true,
  );

  // Repository
  Get.lazyPut<BaseNotificationRepository>(
    () => NotificationRespoitory(
      baseNotificationRemoteDataSource: Get.find(),
      firebaseMessaging: Get.find(),
      handler: Get.find(),
    ),
    fenix: true,
  );

  // Use cases
  Get.lazyPut(
    () => GetAllNotificationsUseCase(
      baseNotificationRepository: Get.find(),
    ),
    fenix: true,
  );

  ///--------------------------- CATEGORY FEATURE ----------------------------------

  // Data sources
  Get.lazyPut<BaseCategoryRemoteDataSource>(
    () => CategoryRemoteDataSource(),
    fenix: true,
  );

  // Repository
  Get.lazyPut<BaseCategoryRepository>(
    () => CategoryRespoitory(
      baseCategoryRemoteDataSource: Get.find(),
      firebaseMessaging: Get.find(),
      handler: Get.find(),
    ),
    fenix: true,
  );

  // Use cases
  Get.lazyPut(
    () => GetAllCategoriesUseCase(
      baseCategoryRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => GetTrendCategoriesUseCase(
      baseCategoryRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => GetCategoryCoursesUseCase(
      baseCategoryRepository: Get.find(),
    ),
    fenix: true,
  );

  ///--------------------------- OTHER FEATURE ----------------------------------

  // Data sources
  Get.lazyPut<BaseOthersRemoteDataSource>(
    () => OthersRemoteDataSource(),
    fenix: true,
  );

  // Repository
  Get.lazyPut<BaseOthersRepository>(
    () => OthersRespoitory(
      baseOthersRemoteDataSource: Get.find(),
      firebaseMessaging: Get.find(),
      handler: Get.find(),
    ),
    fenix: true,
  );

  // Use cases


  ///--------------------------- VIDEO FEATURE ----------------------------------

  // Data sources
  Get.lazyPut<BaseVideoLocalDataSource>(
    () => VideoLocalDataSource(
      getStorage: Get.find(),
    ),
    fenix: true,
  );

  // Repository
  Get.lazyPut<BaseVideoRepository>(
    () => VideoRespoitory(
      baseVideoLocalDataSource: Get.find(),
      handler: Get.find(),
    ),
    fenix: true,
  );

  // Use cases
  Get.lazyPut(
    () => GetAllVideosUseCase(
      baseVideoRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => SaveVideosUseCase(
      baseVideoRepository: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => RemoveVideosUseCase(
      baseVideoRepository: Get.find(),
    ),
    fenix: true,
  );

  ///--------------------------- SERVICES --------------------------------------

  final errorHandler = Handler(
    baseAuthLocalDataSource: Get.find(),
    baseLanguageLocalDataSource: Get.find(),
    networkInfo: Get.find(),
  );

  Get.lazyPut(
    () => errorHandler,
    fenix: true,
  );

  await Get.putAsync(
    () => LanguageService(
      getLanguageUseCase: Get.find(),
    ).init(),
  );

  await Get.putAsync(
    () => UserService(
      getUserDataUseCase: Get.find(),
      getQuickInfoUseCase: Get.find(),
      getCountryUseCase: Get.find(),
    ).init(),
  );
  await Get.putAsync(
    () => VideoService(
      getAllVideosUseCase: Get.find(),
      saveVideosUseCase: Get.find(),
    ).init(),
  );
}
