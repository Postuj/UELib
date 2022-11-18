import 'dto.dart';

abstract class IdentifiableDto extends Dto {
  final String id;

  IdentifiableDto(this.id);

  @override
  List<Object?> get props => [id];
}
