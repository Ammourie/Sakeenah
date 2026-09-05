import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/app_config.dart';
import '../../../../../core/navigation/nav.dart';
import '../../../../../core/theme/text_theme_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../core/ui/dialogs/show_dialog.dart';

enum AttachmentDialogType { camera, gallery, pdf, video, audio, word }

Future<AttachmentDialogType?> showSelectAttachmentTypeDialog() {
  return ShowDialog().showElasticDialog(
    context: AppConfig().appContext!,
    builder: (_) => const _SelectAttachmentTypeDialog(),
  );
}

class _SelectAttachmentTypeDialog extends StatelessWidget {
  const _SelectAttachmentTypeDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                _buildItem(AttachmentDialogType.camera),
                const SizedBox(
                  height: 50,
                  child: VerticalDivider(thickness: 0.5, color: Colors.grey),
                ),
                _buildItem(AttachmentDialogType.gallery),
              ],
            ),
            50.verticalSpace,
            Row(
              children: [
                _buildItem(AttachmentDialogType.video),
                const SizedBox(
                  height: 50,
                  child: VerticalDivider(thickness: 0.5, color: Colors.grey),
                ),
                _buildItem(AttachmentDialogType.audio),
              ],
            ),
            50.verticalSpace,

            Row(
              children: [
                _buildItem(AttachmentDialogType.pdf),
                const SizedBox(
                  height: 50,
                  child: VerticalDivider(thickness: 0.5, color: Colors.grey),
                ),
                _buildItem(AttachmentDialogType.word),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(AttachmentDialogType item) {
    String text = '';
    IconData icon = Icons.camera;
    switch (item) {
      case AttachmentDialogType.camera:
        text = S.current.camera;
        icon = Icons.photo_camera;
      case AttachmentDialogType.gallery:
        text = S.current.gallery;
        icon = Icons.photo_library;
      case AttachmentDialogType.pdf:
        text = S.current.pdfFile;
        icon = Icons.picture_as_pdf;
      case AttachmentDialogType.video:
        text = S.current.video;
        icon = Icons.video_file_rounded;
      case AttachmentDialogType.audio:
        text = S.current.audio;
        icon = Icons.audio_file_rounded;
      case AttachmentDialogType.word:
        text = S.current.wordFile;
        icon = Icons.wordpress_outlined;
    }

    return Expanded(
      child: InkWell(
        onTap: () {
          Nav.pop(null, item);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 34),
            12.verticalSpace,
            Text(
              text,
              style: TextThemeStyles.bodySmall.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
