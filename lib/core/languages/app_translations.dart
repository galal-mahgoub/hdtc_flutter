import 'ar_translations.dart';
import 'en_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'ar': ar,
    'en': en,
  };
}

abstract class LocaleKeys {
  static const camera = "camera";
  static const gallery = "gallery";

  /// Exceptions Messages ======================================================
  static const networkFailure = "networkFailure";
  static const emptyCacheMessage = "emptyCacheMessage";
  static const unAuthMessage = "unAuthMessage";
  static const unExpectedError = "unExpectedError";
  static const serverFailure = "serverFailure";
  static const invalidPhoneNumber = 'invalidPhoneNumber';
  static const invalidVerificationCode = 'invalidVerificationCode';
  static const unVerifiedFailure = 'unVerifiedFailure';

  /// Select Language Page =====================================================
  static const selectLangTitle = "selectLangTitle";
  static const selectLangDesc = "selectLangDesc";
  static const arabic = "arabic";
  static const english = "english";
  static const continuee = "continuee";

  /// Login Page ===============================================================
  static const login = "logIn";
  static const loginTitle = "loginTitle";
  static const loginDesc = "loginDesc";
  static const phoneNumber = "mobileNumber";
  static const emptyPhoneNumber = "emptyMobileNumber";
  static const password = "password";
  static const emptyPassword = 'emptyPassword';
  static const morePasswordChars = 'morePasswordChars';
  static const forgetPassword = 'forgetPassword';
  static const dontHaveAccount = "dontHaveAccount";
  static const register = "register";

  /// Select User Type Page ====================================================
  static const continueAs = "continueAs";
  static const doctor = "doctor";
  static const company = "company";
  static const student = "student";
  static const userTypeDesc = "userTypeDesc";

  /// Register Page ============================================================
  static const registerTitle = "registerTitle";
  static const registerDesc = "registerDesc";
  static const fullName = "fullName";
  static const emptyFullName = 'emptyFullName';
  static const userName = "userName";
  static const emptyUserName = 'emptyUserName';
  static const email = "email";
  static const emailHint = "emailHint";
  static const emptyEmailAddress = "emptyEmailAddress";
  static const incorrectEmailAddress = "incorrectEmailAddress";
  static const confirmPassword = "confirmPassword";
  static const emptyConfirmPassword = 'emptyConfirmPassword';
  static const passwordDontMatch = 'passwordDontMatch';
  static const country = 'country';
  static const countryHint = 'countryHint';
  static const emptyCountry = 'emptyCountry';
  static const university = 'university';
  static const universityHint = 'universityHint';
  static const emptyUniversity = 'emptyUniversity';
  static const birthdate = 'birthdate';
  static const birthdateHint = 'birthdateHint';
  static const emptyBirthdate = 'emptyBirthdate';
  static const startNow = 'startNow';
  static const alreadyHaveAccount = 'alreadyHaveAccount';
  static const studentRegisterTitle = 'studentRegisterTitle';
  static const personalData = 'personalData';
  static const workData = 'workData';
  static const clinicName = 'clinicName';
  static const emptyClinicName = 'emptyClinicName';
  static const address = 'address';
  static const optional = 'optional';
  static const emptyAddress = 'emptyAddress';
  static const companyName = 'companyName';
  static const emptyCompanyName = 'emptyCompanyName';
  static const verifyCodeSent = 'verifyCodeSent';
  static const send = 'send';

  /// Verify Code Page =========================================================
  static const verifyCodeTitle = 'verifyCodeTitle';
  static const verifyCodeDesc = 'verifyCodeDesc';
  static const didntReceiveCode = 'didntReceiveEmail';
  static const resend = 'resend';

  /// Forgot Password Page =====================================================
  static const forgotPasswordTitle = 'forgotPasswordTitle';
  static const forgotPasswordDesc = 'forgotPasswordDesc';
  static const rememberPassword = 'rememberPassword';
  static const resetForgotPasswordTitle = 'resetForgotPasswordTitle';
  static const resetForgotPasswordDesc = 'resetForgotPasswordDesc';
  static const newPassword = "newPassword";
  static const newPasswordHint = "newPasswordHint";
  static const emptyNewPassword = 'emptyNewPassword';
  static const newConfirmPassword = "newConfirmPassword";
  static const newConfirmPasswordHint = "newConfirmPasswordHint";
  static const emptyNewConPassword = 'emptyNewConPassword';
  static const newPasswordDontMatch = 'newPasswordDontMatch';
  static const moreNewPasswordChars = 'moreNewPasswordChars';
  static const resetPassword = 'resetPassword';

  static const backToLogin = 'backToLogin';
  static const verifyForgotPasswordTitle = 'verifyForgotPasswordTitle';
  static const verifyForgotPasswordDesc = 'verifyForgotPasswordDesc';
  static const verifyCode = 'verifyCode';
  static const resendAfter = "resendAfter";

  /// Update Profile Page ======================================================
  static const tapToEdit = 'tapToEdit';
  static const secondaryMobileNumber = 'secondaryMobileNumber';
  static const secondaryMobileNumberHint = 'secondaryMobileNumberHint';
  static const changePassword = "changePassword";
  static const save = "save";
  static const cancel = "cancel";

  /// Settings Page ============================================================
  static const editProfile = "editProfile";
  static const passwordChangedSuccessfuly = "passwordChangedSuccessfuly";
  static const profileChangedSuccessfuly = "profileChangedSuccessfuly";

  /// Change Password Page =====================================================
  static const changePasswordTitle = "changePasswordTitle";
  static const changePasswordDesc = "changePasswordDesc";
  static const oldPassword = "oldPassword";
  static const oldPasswordHint = "oldPasswordHint";
  static const emptyOldPassword = 'emptyOldPassword';
  static const moreOldPasswordChars = 'moreOldPasswordChars';

  /// MainLayout Page ==========================================================
  static const home = 'home';
  static const courses = 'courses';
  static const profile = 'profile';
  static const chats = 'chats';
  static const jobs = 'jobs';

  /// Home Page ================================================================
  static const whatsOnYourMind = 'whatsOnYourMind';
  static const photoVideo = 'photoVideo';

  ///--------------------------------------------------------------
  static const noCoursesAvailable = 'noCoursesAvailable';
  static const noContentAvailable = 'noContentAvailable';
  static const noQuizzesAvailable = 'noQuizzesAvailable';
  static const noNoticesAvailable = 'noNoticesAvailable';
  static const logoutTitle = 'logoutTitle';
  static const logoutContent = 'logoutContent';
  static const logoutSuccess = 'logoutSuccess';
  static const openOffline = 'openOffline';
  static const openPlatformToSubscribe = 'openPlatformToSubscribe';
  static const cancelSubscription = 'cancelSubscription';
  static const checkout = 'checkout';
}
