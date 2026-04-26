import 'package:equatable/equatable.dart';

import '../../../blog_feature/domain/entities/comment.dart';
import 'active_special.dart';
import 'can.dart';
import 'certificate.dart';
import 'faq.dart';
import 'files_chapter.dart';
import 'prerequisite.dart';
import 'quiz.dart';
import 'rate_type.dart';
import 'review.dart';
import 'sales.dart';
import 'tag.dart';
import 'teacher.dart';
import 'ticket.dart';

// ignore: must_be_immutable
class Course extends Equatable {
  final String image;
  final bool? auth;
  final Can? can;
  final String? canViewError;
  final int id;
  final String? status;
  final String? label;
  final bool? free;
  final String title;
  final String? type;
  final String? link;
  final String? accessDays;
  final String? liveWebinarStatus;
  final bool authHasBought;
  final Sales? sales;
  bool isFavorite;
  final String? priceString;
  final String? bestTicketString;
  final String? price;
  final int? tax;
  final int? taxWithDiscount;
  final int? bestTicketPrice;
  final int? discountPercent;
  final int? coursePageTax;
  final int? priceWithDiscount;
  final int? discountAmount;
  final ActiveSpecialOffer? activeSpecialOffer;
  final String? duration;
  final Teacher? teacher;
  final int? studentsCount;
  final double? rate;
  final RateType? rateType;
  final String? createdAt;
  final String? startDate;
  final String? purchasedAt;
  final int? reviewsCount;
  final String? points;
  final double? progress;
  final double? progressPercent;
  final String? category;
  final String? capacity;
  // ----------------
  final bool? support;
  final bool? subscribe;
  final String? description;
  final List<Prerequisite>? prerequisites;
  final List<Faq>? faqs;
  final List<Comment>? comments;
  final List<FilesChapter>? sessionChapters;
  final List? sessionsWithoutChapter;
  final int? sessionsCount;
  final List<FilesChapter>? filesChapters;
  final List? filesWithoutChapter;
  final int? filesCount;
  final List? textLessonChapters;
  final List? textLessonsWithoutChapter;
  final int? textLessonsCount;
  final List<Quiz>? quizzes;
  final List<Quiz>? allQuizzes;
  final int? quizzesCount;
  final List<Certificate>? certificate;
  final List<Certificate>? authCertificates;
  final List<Review>? reviews;
  final String? videoDemo;
  final String? videoDemoSource;
  final String? imageCover;
  final List<Ticket>? tickets;
  final bool? isDownloadable;
  final bool? teacherIsOffline;
  final List<Tag>? tags;
  final bool? authHasSubscription;
  final String? canAddToCart;
  final bool? canBuyWithPoints;
  final String? displayButton;

  Course({
    required this.image,
    required this.auth,
    required this.can,
    required this.canViewError,
    required this.id,
    required this.status,
    required this.label,
    required this.free,
    required this.title,
    required this.type,
    required this.link,
    required this.accessDays,
    required this.liveWebinarStatus,
    required this.authHasBought,
    required this.sales,
    required this.isFavorite,
    required this.priceString,
    required this.bestTicketString,
    required this.price,
    required this.tax,
    required this.taxWithDiscount,
    required this.bestTicketPrice,
    required this.discountPercent,
    required this.coursePageTax,
    required this.priceWithDiscount,
    required this.discountAmount,
    required this.activeSpecialOffer,
    required this.duration,
    required this.teacher,
    required this.studentsCount,
    required this.rate,
    required this.rateType,
    required this.createdAt,
    required this.startDate,
    required this.purchasedAt,
    required this.reviewsCount,
    required this.points,
    required this.progress,
    required this.progressPercent,
    required this.category,
    required this.capacity,
    required this.support,
    required this.subscribe,
    required this.description,
    required this.prerequisites,
    required this.faqs,
    required this.comments,
    required this.sessionChapters,
    required this.sessionsWithoutChapter,
    required this.sessionsCount,
    required this.filesChapters,
    required this.filesWithoutChapter,
    required this.filesCount,
    required this.textLessonChapters,
    required this.textLessonsWithoutChapter,
    required this.textLessonsCount,
    required this.quizzes,
    required this.allQuizzes,
    required this.quizzesCount,
    required this.certificate,
    required this.authCertificates,
    required this.reviews,
    required this.videoDemo,
    required this.videoDemoSource,
    required this.imageCover,
    required this.tickets,
    required this.isDownloadable,
    required this.teacherIsOffline,
    required this.tags,
    required this.authHasSubscription,
    required this.canAddToCart,
    required this.canBuyWithPoints,
    required this.displayButton,
  });

  @override
  List<Object?> get props => [
        support,
        subscribe,
        image,
        description,
        prerequisites,
        faqs,
        comments,
        auth,
        sessionChapters,
        sessionsWithoutChapter,
        can,
        sessionsCount,
        filesChapters,
        filesWithoutChapter,
        canViewError,
        filesCount,
        textLessonChapters,
        textLessonsWithoutChapter,
        id,
        textLessonsCount,
        quizzes,
        allQuizzes,
        quizzesCount,
        status,
        certificate,
        authCertificates,
        reviews,
        label,
        videoDemo,
        videoDemoSource,
        imageCover,
        free,
        tickets,
        isDownloadable,
        teacherIsOffline,
        title,
        tags,
        authHasSubscription,
        type,
        canAddToCart,
        canBuyWithPoints,
        link,
        displayButton,
        accessDays,
        liveWebinarStatus,
        authHasBought,
        sales,
        isFavorite,
        priceString,
        bestTicketString,
        price,
        tax,
        taxWithDiscount,
        bestTicketPrice,
        discountPercent,
        coursePageTax,
        priceWithDiscount,
        discountAmount,
        activeSpecialOffer,
        duration,
        teacher,
        studentsCount,
        rate,
        rateType,
        createdAt,
        startDate,
        purchasedAt,
        reviewsCount,
        points,
        progress,
        progressPercent,
        category,
        capacity,
      ];
}
