// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import 'can.dart';

class Content extends Equatable {
  final int id;
  final String title;
  final int topicsCount;
  final int createdAt;
  final String checkAllContentsPass;
  final List<Item> items;
  final String type;
  final bool isOpen;

  const Content({
    required this.id,
    required this.title,
    required this.topicsCount,
    required this.createdAt,
    required this.checkAllContentsPass,
    required this.items,
    required this.type,
    required this.isOpen,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        topicsCount,
        createdAt,
        checkAllContentsPass,
        items,
        type,
        isOpen,
      ];
}

class Item extends Equatable {
  bool authHasRead;
  final String? canViewError;
  final Can? can;
  final String? type;
  final int? createdAt;
  final String? link;
  final int? id;
  final String? title;
  final int? date;
  final int? questionCount;
  final String? volume;
  final int? time;
  final bool authHasResult;

  Item({
    this.authHasRead = false,
    this.canViewError,
    this.can,
    this.type,
    this.createdAt,
    this.link,
    this.id,
    this.title,
    this.date,
    this.questionCount,
    this.volume,
    this.time,
    required this.authHasResult,
  });

  @override
  List<Object?> get props => [
        authHasRead,
        canViewError,
        can,
        type,
        createdAt,
        link,
        id,
        title,
        date,
        questionCount,
        volume,
        time,
      ];
}
