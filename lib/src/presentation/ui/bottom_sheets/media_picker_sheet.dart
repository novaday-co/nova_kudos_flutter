import 'package:flutter/material.dart';
import 'package:flutter_media_picker/flutter_media_picker.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/colors/colors.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/styles/text_styles.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';

Future<String?> showAccessMediaPickerSheet(BuildContext context,{int? imageQualityPercentage}) async {
  return MediaPicker.showMediaPickerModal(
    context,
    backgroundColor: Theme.of(context).colorScheme.background,
    mediaBackgroundColor: Theme.of(context).colorScheme.background,
    mediaFit: BoxFit.cover,
    mediaBorder: Border.all(
      color: Theme.of(context).colorScheme.outline,
    ),
    mediaBorderRadius: BorderRadius.circular(15),
    mediaHorizontalSpacing: 8,
    mediaVerticalSpacing: 8,
    dropDownItemsTextStyle: Styles.bodyText1(context).copyWith(
      fontSize: 18,
      color: Theme.of(context).colorScheme.tertiary
    ),
    dropDownButtonTextStyle: Styles.bodyText1(context).copyWith(
        fontSize: 18,
        color: Theme.of(context).colorScheme.tertiary
    ),
    mediaSkeletonBaseColor: context.isDark ? ShimmerBaseColor.dark:ShimmerBaseColor.light,
    mediaSkeletonShimmerColor: context.isDark ? ShimmerHighlightColor.dark:ShimmerHighlightColor.light,
    dropDownBackgroundColor: Theme.of(context).colorScheme.background,
    headersIconsBorderColor: Theme.of(context).colorScheme.outline,
    headersIconsColor: Theme.of(context).colorScheme.onTertiary,
    dropDownSelectedItemBackgroundColor: Theme.of(context).primaryColor.withOpacity(0.4),
    imageQualityPercentage: imageQualityPercentage,
    mediaCropper: MediaCropper(
      backgroundColor: Theme.of(context).primaryColor,
      cropFrameStrokeWidth: 2,
      title: "",
      cropFrameColor: Theme.of(context).primaryColor,
      activeControlsWidgetColor: Theme.of(context).primaryColor,
    ),
  );
}