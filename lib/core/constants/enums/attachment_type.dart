enum AttachmentType {
  Image(1),
  Video(2),
  PDF(3),
  Word(4),
  Audio(5),
  None(-1);

  final int mapToInt;
  const AttachmentType(this.mapToInt);

  static AttachmentType mapToType(int? v) {
    switch (v) {
      case 1:
        return AttachmentType.Image;
      case 2:
        return AttachmentType.Video;
      case 3:
        return AttachmentType.PDF;
      case 4:
        return AttachmentType.Word;
      case 5:
        return AttachmentType.Audio;
      default:
        return AttachmentType.None;
    }
  }
}
