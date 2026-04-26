import 'package:hdtc_on/features/course_feature/data/models/active_special_model.dart';
import 'package:hdtc_on/features/course_feature/data/models/certificate_model.dart';
import 'package:hdtc_on/features/course_feature/data/models/faq_model.dart';
import 'package:hdtc_on/features/course_feature/data/models/files_chapter_model.dart';
import 'package:hdtc_on/features/course_feature/data/models/prerequisite_model.dart';
import 'package:hdtc_on/features/course_feature/data/models/quiz_model.dart';
import 'package:hdtc_on/features/course_feature/data/models/review_model.dart';
import 'package:hdtc_on/features/course_feature/data/models/tag_model.dart';
import 'package:hdtc_on/features/course_feature/data/models/ticket_model.dart';

import '../../../blog_feature/data/models/comment_model.dart';
import '../../domain/entities/course.dart';
import 'can_model.dart';
import 'rate_type_model.dart';
import 'sales_model.dart';
import 'teacher_model.dart';

// ignore: must_be_immutable
class CourseModel extends Course {
  CourseModel({
    required super.image,
    required super.auth,
    required super.can,
    required super.canViewError,
    required super.id,
    required super.status,
    required super.label,
    required super.free,
    required super.title,
    required super.type,
    required super.link,
    required super.accessDays,
    required super.liveWebinarStatus,
    required super.authHasBought,
    required super.sales,
    required super.isFavorite,
    required super.priceString,
    required super.bestTicketString,
    required super.price,
    required super.tax,
    required super.taxWithDiscount,
    required super.bestTicketPrice,
    required super.discountPercent,
    required super.coursePageTax,
    required super.priceWithDiscount,
    required super.discountAmount,
    required super.activeSpecialOffer,
    required super.duration,
    required super.teacher,
    required super.studentsCount,
    required super.rate,
    required super.rateType,
    required super.createdAt,
    required super.startDate,
    required super.purchasedAt,
    required super.reviewsCount,
    required super.points,
    required super.progress,
    required super.progressPercent,
    required super.category,
    required super.capacity,
    required super.support,
    required super.subscribe,
    required super.description,
    required super.prerequisites,
    required super.faqs,
    required super.comments,
    required super.sessionChapters,
    required super.sessionsWithoutChapter,
    required super.sessionsCount,
    required super.filesChapters,
    required super.filesWithoutChapter,
    required super.filesCount,
    required super.textLessonChapters,
    required super.textLessonsWithoutChapter,
    required super.textLessonsCount,
    required super.quizzes,
    required super.allQuizzes,
    required super.quizzesCount,
    required super.certificate,
    required super.authCertificates,
    required super.reviews,
    required super.videoDemo,
    required super.videoDemoSource,
    required super.imageCover,
    required super.tickets,
    required super.isDownloadable,
    required super.teacherIsOffline,
    required super.tags,
    required super.authHasSubscription,
    required super.canAddToCart,
    required super.canBuyWithPoints,
    required super.displayButton,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      image: json['image'],
      auth: json['auth'],
      can: json['can'] == null ? null : CanModel.fromJson(json['can']),
      canViewError: json['can_view_error'],
      id: json['id'],
      status: json['status'],
      label: json['label'],
      free: json['free'],
      title: json['title'],
      type: json['type'],
      link: json['link'],
      accessDays: json['access_days']?.toString(),
      liveWebinarStatus: json['live_webinar_status'],
      authHasBought: json['auth_has_bought'] ?? false,
      sales: json['sales'] == null ? null : SalesModel.fromJson(json['sales']),
      isFavorite: json['is_favorite'] ?? false,
      priceString: json['price_string'],
      bestTicketString: json['best_ticket_string'],
      price: json['price']?.toString(),
      tax: json['tax'],
      taxWithDiscount: json['tax_with_discount'],
      bestTicketPrice: json['best_ticket_price'],
      discountPercent: json['discount_percent'],
      coursePageTax: json['course_page_tax'],
      priceWithDiscount: json['price_with_discount'],
      discountAmount: json['discount_amount'],
      activeSpecialOffer: json['active_special_offer'] == null
          ? null
          : ActiveSpecialOfferModel.fromJson(json['active_special_offer']),
      duration: json['duration']?.toString(),
      teacher: json['teacher'] == null
          ? null
          : TeacherModel.fromJson(json['teacher']),
      studentsCount: json['students_count'],
      rate: double.tryParse(json['rate'].toString()),
      rateType: json['rate_type'] == null
          ? null
          : RateTypeModel.fromJson(json['rate_type']),
      createdAt: json['created_at']?.toString(),
      startDate: json['start_date']?.toString(),
      purchasedAt: json['purchased_at']?.toString(),
      reviewsCount: json['reviews_count'],
      points: json['points']?.toString(),
      progress: double.tryParse(json['progress'].toString()) ?? 0,
      progressPercent:
          double.tryParse(json['progress_percent'].toString()) ?? 0,
      category: json['category'],
      capacity: json['capacity']?.toString(),
      support: json['support'],
      subscribe: json['subscribe'],
      description: json['description'],
      prerequisites: json['prerequisites'] == null
          ? null
          : List.from(json['prerequisites'])
              .map((e) => PrerequisiteModel.fromJson(e))
              .toList(),
      faqs: json['faqs'] == null
          ? null
          : List.from(json['faqs']).map((e) => FaqModel.fromJson(e)).toList(),
      comments: json['comments'] == null
          ? null
          : List.from(json['comments'])
              .map((e) => CommentModel.fromJson(e))
              .toList(),
      sessionChapters: json['session_chapters'] == null
          ? null
          : List.from(json['session_chapters'])
              .map((e) => FilesChapterModel.fromJson(e))
              .toList(),
      sessionsWithoutChapter: json['sessions_without_chapter'],
      sessionsCount: json['sessions_count'],
      filesChapters: json['files_chapters'] == null
          ? null
          : List.from(json['files_chapters'])
              .map((e) => FilesChapterModel.fromJson(e))
              .toList(),
      filesWithoutChapter: json['files_without_chapter'],
      filesCount: json['files_count'],
      textLessonChapters: json['text_lesson_chapters'],
      textLessonsWithoutChapter: json['text_lessons_without_chapter'],
      textLessonsCount: json['text_lessons_count'],
      quizzes: json['quizzes'] == null
          ? null
          : List.from(json['quizzes'])
              .map((e) => QuizModel.fromJson(e))
              .toList(),
      allQuizzes: json['all_quizzes'] == null
          ? null
          : List.from(json['all_quizzes'])
              .map((e) => QuizModel.fromJson(e))
              .toList(),
      quizzesCount: json['quizzes_count'],
      certificate: json['certificate'] == null
          ? null
          : List.from(json['certificate'])
              .map((e) => CertificateModel.fromJson(e))
              .toList(),
      authCertificates: json['auth_certificates'] == null
          ? null
          : List.from(json['auth_certificates'])
              .map((e) => CertificateModel.fromJson(e))
              .toList(),
      reviews: json['reviews'] == null
          ? null
          : List.from(json['reviews'])
              .map((e) => ReviewModel.fromJson(e))
              .toList(),
      videoDemo: json['video_demo'],
      videoDemoSource: json['video_demo_source'],
      imageCover: json['image_cover'],
      tickets: json['tickets'] == null
          ? null
          : List.from(json['tickets'])
              .map((e) => TicketModel.fromJson(e))
              .toList(),
      isDownloadable: json['isDownloadable'],
      teacherIsOffline: json['teacher_is_offline'],
      tags: json['tags'] == null
          ? null
          : List.from(json['tags']).map((e) => TagModel.fromJson(e)).toList(),
      authHasSubscription: json['auth_has_subscription'],
      canAddToCart: json['can_add_to_cart'],
      canBuyWithPoints: json['can_buy_with_points'],
      displayButton: json['display_button'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['sessions'] = sessionChapters!
        .map((session) => (session as FilesChapterModel).toJson())
        .toList();
    data['auth'] = auth;
    data['can'] = (can as CanModel).toJson();
    data['canViewError'] = canViewError;
    data['id'] = id;
    data['status'] = status;
    data['label'] = label;
    data['free'] = free;
    data['title'] = title;
    data['type'] = type;
    data['link'] = link;
    data['accessDays'] = accessDays;
    data['liveWebinarStatus'] = liveWebinarStatus;
    data['authHasBought'] = authHasBought;
    data['sales'] = (sales as SalesModel).toJson();
    data['isFavorite'] = isFavorite;
    data['priceString'] = priceString;
    data['bestTicketString'] = bestTicketString;
    data['price'] = price;
    data['tax'] = tax;
    data['taxWithDiscount'] = taxWithDiscount;
    data['bestTicketPrice'] = bestTicketPrice;
    data['discountPercent'] = discountPercent;
    data['coursePageTax'] = coursePageTax;
    data['priceWithDiscount'] = priceWithDiscount;
    data['discountAmount'] = discountAmount;
    data['activeSpecialOffer'] = activeSpecialOffer;
    data['duration'] = duration;
    data['teacher'] = (teacher as TeacherModel).toJson();
    data['studentsCount'] = studentsCount;
    data['rate'] = rate;
    data['rateType'] = (rateType as RateTypeModel).toJson();
    data['createdAt'] = createdAt;
    data['startDate'] = startDate;
    data['purchasedAt'] = purchasedAt;
    data['reviewsCount'] = reviewsCount;
    data['points'] = points;
    data['progress'] = progress;
    data['progressPercent'] = progressPercent;
    data['category'] = category;
    data['capacity'] = capacity;
    return data;
  }
}
