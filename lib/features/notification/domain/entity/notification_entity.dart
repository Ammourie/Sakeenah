import '../../../../../core/entities/base_entity.dart';

class NotificationEntity extends BaseEntity {
	final DateTime? createDate;
	final String title;
	final String description;
	final int? notificationType;
	final bool isSeen;

	NotificationEntity({
		required this.createDate,
		required this.title,
		required this.description,
		required this.notificationType,
		required this.isSeen,
	});

	@override
	String toString() => """NotificationEntity(
			createDate: $createDate,
			title: $title,
			description: $description,
			notificationType: $notificationType,
			isSeen: $isSeen,
	)""";

	NotificationEntity copyWith({
		DateTime? createDate,
		String? title,
		String? description,
		int? notificationType,
		bool? isSeen,
	}) {
		return NotificationEntity(
			createDate: createDate ?? this.createDate,
			title: title ?? this.title,
			description: description ?? this.description,
			notificationType: notificationType ?? this.notificationType,
			isSeen: isSeen ?? this.isSeen,
		);
	}

	@override
	List<Object?> get props => [
			createDate,
			title,
			description,
			notificationType,
			isSeen,
	];
}
