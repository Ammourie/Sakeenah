import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/ui/widgets/curved_app_bar.dart';
import '../../../../core/ui/widgets/dropdown/search_dropdown/custom_search_dropdown.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entity/country_entity.dart';
import '../state_m/provider/manual_location_picker_notifier.dart';

class ManualLocationPickerScreenContent extends StatelessWidget {
  const ManualLocationPickerScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final sn = context.read<ManualLocationPickerNotifier>();
    final canConfirm = context.select<ManualLocationPickerNotifier, bool>(
      (sn) => sn.canConfirm,
    );

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: CurvedAppBarLayout(
        appBar: CurvedAppBar(
          title: S.current.countryCityPickerTitle,
          automaticallyImplyLeading: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
              child: Text(
                S.current.countryCityPickerMessage,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.45,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const _LocationInputModeSelector(),
                    16.verticalSpace,
                    const _LocationInputSection(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
              child: FilledButton(
                onPressed: canConfirm ? () => sn.confirmSelection(context) : null,
                style: FilledButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
                child: Text(S.current.saveLocation),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LocationInputModeSelector extends StatelessWidget {
  const _LocationInputModeSelector();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final mode = context.select<ManualLocationPickerNotifier, ManualLocationInputMode>(
      (sn) => sn.inputMode,
    );
    final sn = context.read<ManualLocationPickerNotifier>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.cityInputModeLabel,
          style: textTheme.labelLarge?.copyWith(color: colorScheme.onSurface),
        ),
        8.verticalSpace,
        SegmentedButton<ManualLocationInputMode>(
          segments: [
            ButtonSegment(
              value: ManualLocationInputMode.countryCity,
              label: Text(S.current.cityInputModePicker),
              icon: Icon(Icons.list_rounded, size: 18.r),
            ),
            ButtonSegment(
              value: ManualLocationInputMode.address,
              label: Text(S.current.cityInputModeManual),
              icon: Icon(Icons.location_on_outlined, size: 18.r),
            ),
          ],
          selected: {mode},
          onSelectionChanged: (selection) {
            sn.setInputMode(selection.first);
          },
        ),
      ],
    );
  }
}

class _LocationInputSection extends StatelessWidget {
  const _LocationInputSection();

  @override
  Widget build(BuildContext context) {
    final mode = context.select<ManualLocationPickerNotifier, ManualLocationInputMode>(
      (sn) => sn.inputMode,
    );

    if (mode == ManualLocationInputMode.address) {
      return const _ManualAddressField();
    }

    return const _CountryCityPickerSection();
  }
}

class _CountryCityPickerSection extends StatelessWidget {
  const _CountryCityPickerSection();

  @override
  Widget build(BuildContext context) {
    final sn = context.read<ManualLocationPickerNotifier>();
    final selectedCountry = context.select<ManualLocationPickerNotifier, CountryEntity?>(
      (sn) => sn.selectedCountry,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomSearchDropdown<CountryEntity>(
          label: S.current.countryHint,
          fetchItemsFromAPI: sn.fetchCountries,
          getStringFromItem: (country) => country.name,
          onChanged: sn.selectCountry,
          hint: Text(S.current.selectCountryHint),
        ),
        16.verticalSpace,
        _CityPickerField(selectedCountry: selectedCountry),
      ],
    );
  }
}

class _CityPickerField extends StatelessWidget {
  const _CityPickerField({required this.selectedCountry});

  final CountryEntity? selectedCountry;

  @override
  Widget build(BuildContext context) {
    final sn = context.read<ManualLocationPickerNotifier>();

    return CustomSearchDropdown<String>(
      key: ValueKey(selectedCountry?.name ?? 'no-country'),
      label: S.current.cityHint,
      enabled: selectedCountry != null,
      fetchItemsFromAPI: selectedCountry != null ? sn.fetchCities : null,
      items: selectedCountry != null ? null : const [],
      getStringFromItem: (city) => city,
      onChanged: sn.selectCity,
      hint: Text(
        selectedCountry != null
            ? S.current.selectCityHint
            : S.current.selectCountryFirstHint,
      ),
    );
  }
}

class _ManualAddressField extends StatelessWidget {
  const _ManualAddressField();

  InputDecoration _decoration(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final radius = BorderRadius.circular(12.r);

    OutlineInputBorder border(Color color, {double width = 1}) {
      return OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(color: color, width: width),
      );
    }

    return InputDecoration(
      filled: true,
      fillColor: colorScheme.surfaceContainer,
      hintText: S.current.enterAddressManuallyHint,
      hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      enabledBorder: border(colorScheme.outlineVariant),
      focusedBorder: border(colorScheme.primary, width: 1.5),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final sn = context.read<ManualLocationPickerNotifier>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.addressHint,
          style: textTheme.labelLarge?.copyWith(color: colorScheme.onSurface),
        ),
        8.verticalSpace,
        TextField(
          controller: sn.manualAddressController,
          onChanged: (_) => sn.onManualAddressChanged(),
          textInputAction: TextInputAction.done,
          minLines: 2,
          maxLines: 4,
          keyboardType: TextInputType.streetAddress,
          style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurface),
          decoration: _decoration(context),
        ),
      ],
    );
  }
}
