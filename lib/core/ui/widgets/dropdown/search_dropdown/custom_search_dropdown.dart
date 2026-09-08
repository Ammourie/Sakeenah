import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';
import '../../../../errors/app_errors.dart';
import '../../../../results/result.dart';
import '../../waiting_widget.dart';
import 'cubit/item_list_cubit.dart';

part 'animated_section.dart';
part 'dropdown_field.dart';
part 'dropdown_overlay.dart';
part 'overlay_builder.dart';

class DropdownController {
  final bool loadingItemOnBuild;

  late final ItemListCubit? itemListCubit;

  DropdownController({this.loadingItemOnBuild = true});
}

class CustomSearchDropdown<T> extends StatefulWidget {
  const CustomSearchDropdown({
    super.key,
    this.controller,
    this.initValue,
    this.enabled = true,
    this.enableSearch = true,
    this.items,
    this.fetchItemsFromAPI,
    required this.getStringFromItem,
    required this.onChanged,
    this.onTap,
    this.hint,
    this.menuHint,
    this.border,
    this.enabledBorder,
    this.disabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.menuBorderRadius,
    this.icon,
    this.prefixIcon,
    this.fillColor,
    this.contentPadding,
    this.menuHeaderPadding,
    this.menuItemsPadding,
    this.overlayOuterPadding,
    this.menuBackgroundColor,
    this.menuIconColor,
    this.onSearchTap,
    this.validator,
    this.style,
    this.errorStyle,
    this.searchTextStyle,
    this.searchFocusNode,
    this.label,
    this.labelStyle,
  }) : assert((items == null) ^ (fetchItemsFromAPI == null));

  final bool enabled;
  final bool enableSearch;
  final DropdownController? controller;
  final T? initValue;
  final List<T>? items;
  final Future<Result<AppErrors, List<T>>>? Function()? fetchItemsFromAPI;
  final TextStyle? style;
  final String Function(T) getStringFromItem;
  final VoidCallback? onTap;
  final ValueChanged<T?> onChanged;
  final Widget? hint;
  final Widget? menuHint;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final double? menuBorderRadius;
  final Widget? icon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? menuHeaderPadding;
  final EdgeInsetsGeometry? menuItemsPadding;
  final EdgeInsetsGeometry? overlayOuterPadding;
  final Color? menuBackgroundColor;
  final Color? menuIconColor;
  final VoidCallback? onSearchTap;
  final String? Function(T?)? validator;
  final String? label;
  final TextStyle? errorStyle;
  final TextStyle? searchTextStyle;
  final TextStyle? labelStyle;
  final FocusNode? searchFocusNode;

  @override
  State<CustomSearchDropdown<T>> createState() =>
      _CustomSearchDropdownState<T>();
}

class _CustomSearchDropdownState<T> extends State<CustomSearchDropdown<T>> {
  final _selectValueNotifier = ValueNotifier<T?>(null);
  late List<T> _items;
  bool _isLoading = false;
  bool _isError = false;
  bool _isOpen = false;
  ItemListCubit<T>? _itemListCubit;
  final _dropdownKey = GlobalKey<FormFieldState>();
  final _panelKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _items = widget.items ?? [];
    if (widget.fetchItemsFromAPI != null) {
      _itemListCubit = ItemListCubit<T>(() => widget.fetchItemsFromAPI!()!);
      if (widget.controller?.loadingItemOnBuild ?? true) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _itemListCubit!.fetchItems();
        });
      }
      widget.controller?.itemListCubit = _itemListCubit;
    } else if (widget.initValue != null) {
      _selectValueNotifier.value = widget.initValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_itemListCubit != null) {
      return BlocListener<ItemListCubit<T>, ItemListState<T>>(
        bloc: _itemListCubit,
        listener: (_, state) {
          state.maybeWhen(
            loading: () => setState(() => _isLoading = true),
            error: (_, __) => setState(() {
              _isLoading = false;
              _isError = true;
            }),
            loaded: (data) {
              setState(() {
                _isLoading = false;
                _isError = false;
                _items = data;
              });
              if (widget.initValue != null) {
                _selectValueNotifier.value = widget.initValue;
              }
            },
            orElse: () {},
          );
        },
        child: _buildDropdown(context),
      );
    }
    return _buildDropdown(context);
  }

  @override
  void didUpdateWidget(covariant CustomSearchDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initValue != oldWidget.initValue) {
      _selectValueNotifier.value = widget.initValue;
    }
    if (widget.items != null) _items = widget.items!;
  }

  Widget _buildDropdown(BuildContext context) {
    return _DropDownField<T>(
      dropdownKey: _dropdownKey,
      value: _selectValueNotifier.value,
      items: _getDropdownItems(context),
      isExpanded: _isOpen,
      expanded: _isOpen ? _buildExpandedPanel(context) : null,
      onTap: _onFieldTap,
      validator: widget.validator,
      style: _itemStyle(context),
      decoration: _fieldDecoration(context),
      icon: _trailingIcon(context),
      hint: _hint(context),
      label: widget.label,
      labelStyle: widget.labelStyle,
    );
  }

  Widget _buildExpandedPanel(BuildContext context) {
    return KeyedSubtree(
      key: _panelKey,
      child: _DropdownExpandPanel<T>(
        items: _getDropdownItems(context),
        selectedValue: _selectValueNotifier.value,
        getStringFromItem: widget.getStringFromItem,
        enableSearch: widget.enableSearch,
        borderRadius: widget.menuBorderRadius ?? 12.r,
        listItemPadding: widget.menuItemsPadding,
        onSearchTap: widget.onSearchTap,
        backgroundColor: widget.menuBackgroundColor,
        searchTextStyle: widget.searchTextStyle,
        searchFocusNode: widget.searchFocusNode,
        onChanged: _onItemSelected,
      ),
    );
  }

  InputDecoration _fieldDecoration(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final radius = BorderRadius.circular(12.r);
    final enabled = !(_isLoading || _isError) && widget.enabled;

    OutlineInputBorder themedBorder(Color color, {double width = 1}) {
      return OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(color: color, width: width),
      );
    }

    return InputDecoration(
      enabled: enabled,
      filled: true,
      fillColor: widget.fillColor ?? colorScheme.surfaceContainer,
      contentPadding: widget.contentPadding ??
          EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      prefixIcon: widget.prefixIcon,
      border: widget.border ?? themedBorder(colorScheme.outlineVariant),
      enabledBorder:
          widget.enabledBorder ?? themedBorder(colorScheme.outlineVariant),
      disabledBorder: widget.disabledBorder ??
          themedBorder(
            colorScheme.outlineVariant.withValues(alpha: 0.5),
          ),
      focusedBorder: widget.focusedBorder ??
          themedBorder(colorScheme.primary, width: 1.5),
      errorBorder: widget.errorBorder ?? themedBorder(colorScheme.error),
      focusedErrorBorder: widget.focusedErrorBorder ??
          themedBorder(colorScheme.error, width: 1.5),
      errorStyle: widget.errorStyle ??
          Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colorScheme.error,
              ),
    );
  }

  void _onFieldTap() {
    if (!widget.enabled || _isLoading || _isError) return;
    _setOpen(!_isOpen);
    widget.onTap?.call();
  }

  void _setOpen(bool open) {
    if (_isOpen == open) return;
    setState(() => _isOpen = open);
    if (!open) {
      FocusManager.instance.primaryFocus?.unfocus();
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctx = _panelKey.currentContext;
      if (ctx == null) return;
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        alignment: 0.15,
      );
    });
  }

  void _onItemSelected(T? value) {
    _selectValueNotifier.value = value;
    (_dropdownKey.currentState as FormFieldState<T>?)?.didChange(value);
    widget.onChanged.call(value);
    _setOpen(false);
    Future.delayed(const Duration(milliseconds: 100), () {
      _dropdownKey.currentState?.validate();
    });
  }

  Widget _trailingIcon(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (_isLoading) return _loadingIcon;
    if (_isError) return _errorButton(context);

    final icon = widget.icon ??
        Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 22.r,
          color: colorScheme.onSurfaceVariant,
        );

    return AnimatedRotation(
      turns: _isOpen ? 0.5 : 0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      child: icon,
    );
  }

  TextStyle _itemStyle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return widget.style ??
        Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: colorScheme.onSurface,
            );
  }

  Widget? _hint(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (_isError) {
      return Text(
        S.current.errorOccurred,
        style: textTheme.bodyLarge?.copyWith(color: colorScheme.error),
      );
    }
    if (widget.hint == null) return null;

    return DefaultTextStyle(
      style: textTheme.bodyLarge!.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      child: widget.hint!,
    );
  }

  List<DropdownMenuItem<T>> _getDropdownItems(BuildContext context) {
    final style = _itemStyle(context);

    return _items
        .map(
          (item) => DropdownMenuItem<T>(
            value: item,
            child: Text(
              widget.getStringFromItem.call(item),
              style: style,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
        .toList();
  }

  SizedBox get _loadingIcon => SizedBox(
        width: 22.w,
        height: 22.w,
        child: const FittedBox(child: WaitingWidget()),
      );

  Widget _errorButton(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _itemListCubit?.fetchItems,
        borderRadius: BorderRadius.circular(999.r),
        child: Icon(
          Icons.refresh_rounded,
          size: 22.r,
          color: colorScheme.error,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _selectValueNotifier.dispose();
    super.dispose();
  }
}
