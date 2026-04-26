import 'package:get/get.dart';

import '../../features/auth_feature/presentation/dashboard/views/dashboard_view.dart';
import '../../features/auth_feature/presentation/forgot_password/bindings/reset_forgot_password_binding.dart';
import '../../features/auth_feature/presentation/forgot_password/bindings/send_forgot_password_binding.dart';
import '../../features/auth_feature/presentation/forgot_password/bindings/verify_forgot_password_binding.dart';
import '../../features/auth_feature/presentation/forgot_password/view/reset_forgot_password_view.dart';
import '../../features/auth_feature/presentation/forgot_password/view/send_forgot_password_view.dart';
import '../../features/auth_feature/presentation/forgot_password/view/verify_forgot_password_view.dart';
import '../../features/auth_feature/presentation/home/bindings/home_binding.dart';
import '../../features/auth_feature/presentation/login/bindings/login_binding.dart';
import '../../features/auth_feature/presentation/login/view/login_view.dart';
import '../../features/auth_feature/presentation/mainlayout/bindings/mainlayout_binding.dart';
import '../../features/auth_feature/presentation/mainlayout/views/mainlayout_view.dart';
import '../../features/auth_feature/presentation/settings/bindings/settings_binding.dart';
import '../../features/auth_feature/presentation/register/bindings/register_binding.dart';
import '../../features/auth_feature/presentation/register/bindings/verify_code_binding.dart';
import '../../features/auth_feature/presentation/register/view/register_view.dart';
import '../../features/auth_feature/presentation/register/view/verify_code_view.dart';
import '../../features/auth_feature/presentation/update_profile/bindings/update_profile_binding.dart';
import '../../features/auth_feature/presentation/update_profile/views/update_profile_view.dart';
import '../../features/blog_feature/presentation/blog_details/bindings/blog_details_binding.dart';
import '../../features/blog_feature/presentation/blog_details/views/blog_details_view.dart';
import '../../features/blog_feature/presentation/blogs/bindings/blogs_binding.dart';
import '../../features/blog_feature/presentation/blogs/views/blogs_view.dart';
import '../../features/cart_feature/presentation/cart/binding/cart_binding.dart';
import '../../features/cart_feature/presentation/cart/view/cart_view.dart';
import '../../features/category_feature/presentation/categories/binding/categories_binding.dart';
import '../../features/category_feature/presentation/category_details/binding/category_details_binding.dart';
import '../../features/category_feature/presentation/category_details/view/category_details_view.dart';
import '../../features/course_feature/presentation/content_file_details/bindings/content_files_details_binding.dart';
import '../../features/course_feature/presentation/content_file_details/views/content_file_details_view.dart';
import '../../features/course_feature/presentation/course_details/binding/course_details_binding.dart';
import '../../features/course_feature/presentation/my_courses/bindings/my_courses_binding.dart';
import '../../features/course_feature/presentation/my_courses/views/my_courses_view.dart';
import '../../features/course_feature/presentation/new_learning/bindings/new_learning_page_binding.dart';
import '../../features/course_feature/presentation/course_details/view/course_details_view.dart';
import '../../features/course_feature/presentation/new_learning/views/new_learning_page_view.dart';
import '../../features/course_feature/presentation/courses_list/bindings/courses_list_binding.dart';
import '../../features/course_feature/presentation/courses_list/views/courses_list_view.dart';
import '../../features/course_feature/presentation/quiz_details/bindings/quiz_result_details_binding.dart';
import '../../features/course_feature/presentation/quiz_details/views/quiz_result_details_view.dart';
import '../../features/course_feature/presentation/quiz_participated_details/bindings/quiz_participated_details_binding.dart';
import '../../features/course_feature/presentation/quiz_participated_details/views/quiz_participated_details_view.dart';
import '../../features/course_feature/presentation/quiz_question/bindings/quiz_question_binding.dart';
import '../../features/course_feature/presentation/quiz_question/views/quiz_question_view.dart';
import '../../features/course_feature/presentation/quiz_question_create/bindings/quiz_question_create_binding.dart';
import '../../features/course_feature/presentation/quiz_question_create/views/quiz_question_create_view.dart';
import '../../features/course_feature/presentation/search/bindings/search_courses_binding.dart';
import '../../features/course_feature/presentation/search/views/search_courses_view.dart';
import '../../features/language_feature/presentation/select_language/bindings/select_language_binding.dart';
import '../../features/language_feature/presentation/select_language/view/select_language_view.dart';
import '../../features/notification_feature/presentation/notifications/binding/notifications_binding.dart';
import '../../features/notification_feature/presentation/notifications/view/notifications_view.dart';
import '../../features/others_feature/presentation/certificate_details/binding/certificate_details_binding.dart';
import '../../features/others_feature/presentation/certificate_details/view/certificate_details_view.dart';
import '../../features/others_feature/presentation/certificates/binding/certificates_binding.dart';
import '../../features/others_feature/presentation/certificates/view/certificates_view.dart';
import '../../features/others_feature/presentation/comments/bindings/comments_binding.dart';
import '../../features/others_feature/presentation/comments/view/comments_view.dart';
import '../../features/others_feature/presentation/comments_details/binding/comments_details_binding.dart';
import '../../features/others_feature/presentation/comments_details/view/comments_details_view.dart';
import '../../features/others_feature/presentation/favourites/binding/favourites_binding.dart';
import '../../features/others_feature/presentation/favourites/view/favourites_view.dart';
import '../../features/others_feature/presentation/subscribe/bindings/subscribes_binding.dart';
import '../../features/others_feature/presentation/subscribe/view/subscribes_view.dart';
import '../../features/others_feature/presentation/support/binding/support_binding.dart';
import '../../features/others_feature/presentation/support/view/support_view.dart';
import '../../features/others_feature/presentation/support_details/binding/support_details_binding.dart';
import '../../features/others_feature/presentation/support_details/view/support_details_view.dart';
import '../../features/provider_feature/presentation/meeting/bindings/meeting_binding.dart';
import '../../features/provider_feature/presentation/meeting/views/meeting_view.dart';
import '../../features/provider_feature/presentation/meeting_details/bindings/meeting_details.binding.dart';
import '../../features/provider_feature/presentation/meeting_details/views/meeting_details_view.dart';
import '../../features/provider_feature/presentation/provider_details/bindings/instructor_details_binding.dart';
import '../../features/provider_feature/presentation/provider_details/views/instructor_details_view.dart';
import '../../features/provider_feature/presentation/providers/bindings/providers_binding.dart';
import '../../features/video_feature/presentation/videos/bindings/videos_binding.dart';
import '../../features/video_feature/presentation/videos/views/videos_view.dart';
import '../widgets/web_view/bindings/web_view_binding.dart';
import '../widgets/web_view/views/web_view_page.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.mainlayout;

  static final routes = [
    GetPage(
      name: _Paths.selectLanguage,
      page: () => const SelectLanguageView(),
      binding: SelectLanguageBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.verifyCode,
      page: () => const VerifyCodeView(),
      binding: VerifyCodeBinding(),
    ),
    GetPage(
      name: _Paths.sendForgotPassword,
      page: () => const SendForgotPasswordView(),
      binding: SendForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.verifyForgotPassword,
      page: () => const VerifyForgotPasswordView(),
      binding: VerifyForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.resetForgotPassword,
      page: () => const ResetForgotPasswordView(),
      binding: ResetForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.mainlayout,
      page: () => const MainLayoutView(),
      bindings: [
        MainLayoutBinding(),
        HomeBinding(),
        CategoriesBinding(),
        ProvidersBinding(),
        MyCoursesBinding(),
        SettingsBinding(),
      ],
    ),
    GetPage(
      name: _Paths.searchCourses,
      page: () => const SearchCoursesView(),
      binding: SearchCoursesBinding(),
      transition: Transition.upToDown,
    ),
    GetPage(
      name: _Paths.coursesList,
      page: () => const CoursesListView(),
      binding: CoursesListBinding(),
      transition: Transition.size,
    ),
    GetPage(
      name: _Paths.blogDetails,
      page: () => const BlogDetailsView(),
      binding: BlogDetailsBinding(),
      transition: Transition.size,
    ),
    GetPage(
      name: _Paths.instructorDetails,
      page: () => const InstructorDetailsView(),
      binding: InstructorDetailsBinding(),
      transition: Transition.size,
    ),
    GetPage(
      name: _Paths.cart,
      page: () => const CartView(),
      binding: CartBinding(),
      transition: Transition.upToDown,
    ),
    GetPage(
      name: _Paths.notifications,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
      transition: Transition.upToDown,
    ),
    GetPage(
      name: Routes.categoryDetails,
      page: () => const CategoryDetailsView(),
      binding: CategoryDetailsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardView(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.myCourses,
      page: () => const MyCoursesView(),
      binding: MyCoursesBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.courseDetails,
      page: () => const CourseDetailsView(),
      binding: CourseDetailsBinding(),
      transition: Transition.size,
    ),
    GetPage(
      name: Routes.newLearningPage,
      page: () => const NewLearningPageView(),
      binding: NewLearningPageBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Routes.contentFileDetails,
      page: () => const ContentFilesDetailsView(),
      binding: ContentFilesDetailsBinding(),
      transition: Transition.size,
    ),
    GetPage(
      name: Routes.quizResultDetails,
      page: () => const QuizResultDetailsView(),
      binding: QuizResultDetailsBinding(),
      transition: Transition.size,
    ),
    GetPage(
      name: Routes.quizParticipatedDetails,
      page: () => const QuizParticipatedDetailsView(),
      binding: QuizParticipatedDetailsBinding(),
      transition: Transition.size,
    ),
    GetPage(
      name: Routes.quizDetailsQuestionCreate,
      page: () => const QuizDetailsQuestionCreateView(),
      binding: QuizDetailsQuestionCreateBinding(),
      transition: Transition.size,
    ),
    GetPage(
      name: Routes.quizDetailsQuestionView,
      page: () => const QuizQuestionView(),
      binding: QuizQuestionBinding(),
      transition: Transition.size,
    ),
    GetPage(
      name: Routes.meeting,
      page: () => const MeetingView(),
      binding: MeetingBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.meetingDetails,
      page: () => const MeetingDetailsView(),
      binding: MeetingDetailsBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.webView,
      page: () => const WebViewPage(),
      binding: WebViewBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.certificates,
      page: () => const CertificatesView(),
      binding: CertificatesBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.certificateDetails,
      page: () => const CertificateDetailsView(),
      binding: CertificateDetailsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.favorites,
      page: () => const FavouritesView(),
      binding: FavouritesBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.comments,
      page: () => const CommentsView(),
      binding: CommentsBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.commentsDetails,
      page: () => const CommentsDetailsView(),
      binding: CommentsDetailsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.subscribes,
      page: () => const SubscribesView(),
      binding: SubscribesBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.support,
      page: () => const SupportView(),
      binding: SupportBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.supportDetails,
      page: () => const SupportDetailsView(),
      binding: SupportDetailsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.videos,
      page: () => const VideosView(),
      binding: VideosBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.blogs,
      page: () => const BlogsView(),
      binding: BlogsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.updateProfile,
      page: () => const UpdateProfileView(),
      binding: UpdateProfileBinding(),
      transition: Transition.circularReveal,
    ),
  ];
}
