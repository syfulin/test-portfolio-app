import 'package:equatable/equatable.dart';

abstract class ContentTypeState extends Equatable {}

// Состояние завершения обновления контента

class SetContentTypeState extends ContentTypeState {
  final String contentType;

  SetContentTypeState(this.contentType);

  @override
  List<Object> get props => [contentType];
}
