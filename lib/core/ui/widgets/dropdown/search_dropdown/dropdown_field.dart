part of 'custom_search_dropdown.dart';

class _DropDownField<T> extends StatelessWidget {
  const _DropDownField({
    required this.dropdownKey,
    required this.value,
    required this.items,
    required this.onTap,
    this.validator,
    this.hint,
    this.icon,
    this.style,
    this.decoration,
    this.label,
    this.labelStyle,
    this.isExpanded = false,
    this.expanded,
  });

  final GlobalKey<FormFieldState> dropdownKey;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final Widget? hint;
  final Widget? icon;
  final TextStyle? style;
  final InputDecoration? decoration;
  final VoidCallback onTap;
  final String? Function(T?)? validator;
  final String? label;
  final TextStyle? labelStyle;
  final bool isExpanded;
  final Widget? expanded;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: labelStyle ??
                textTheme.labelLarge?.copyWith(color: colorScheme.onSurface),
          ),
          8.verticalSpace,
        ],
        FormField<T>(
          key: dropdownKey,
          initialValue: value,
          validator: (_) => validator?.call(value),
          builder: (field) {
            final enabled = decoration?.enabled ?? true;
            final hasError = field.hasError;
            final effectiveDecoration =
                (decoration ?? const InputDecoration()).copyWith(
              errorText: field.errorText,
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: enabled ? onTap : null,
                    borderRadius: BorderRadius.circular(12.r),
                    child: InputDecorator(
                      decoration: effectiveDecoration,
                      isFocused: isExpanded,
                      child: Row(
                        children: [
                          Expanded(
                            child: _FieldValue<T>(
                              value: value,
                              items: items,
                              hint: hint,
                              style: style,
                              enabled: enabled,
                            ),
                          ),
                          if (icon != null) ...[
                            8.horizontalSpace,
                            icon!,
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
                if (hasError && field.errorText != null) ...[
                  6.verticalSpace,
                  Text(
                    field.errorText!,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.error,
                    ),
                  ),
                ],
                if (expanded != null)
                  AnimatedSize(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOutCubic,
                    alignment: Alignment.topCenter,
                    child: isExpanded
                        ? Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: expanded,
                          )
                        : const SizedBox.shrink(),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _FieldValue<T> extends StatelessWidget {
  const _FieldValue({
    required this.value,
    required this.items,
    required this.hint,
    required this.style,
    required this.enabled,
  });

  final T? value;
  final List<DropdownMenuItem<T>> items;
  final Widget? hint;
  final TextStyle? style;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (value == null) {
      return DefaultTextStyle(
        style: textTheme.bodyLarge!.copyWith(
          color: enabled
              ? colorScheme.onSurfaceVariant
              : colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        child: hint ?? const SizedBox.shrink(),
      );
    }

    final selected = items.cast<DropdownMenuItem<T>?>().firstWhere(
          (item) => item?.value == value,
          orElse: () => null,
        );

    return DefaultTextStyle(
      style: style ??
          textTheme.bodyLarge!.copyWith(
            color: enabled
                ? colorScheme.onSurface
                : colorScheme.onSurface.withValues(alpha: 0.6),
          ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      child: selected?.child ??
          Text(
            value.toString(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
    );
  }
}

class _DropdownExpandPanel<T> extends StatefulWidget {
  const _DropdownExpandPanel({
    required this.items,
    required this.selectedValue,
    required this.getStringFromItem,
    required this.onChanged,
    required this.enableSearch,
    required this.borderRadius,
    this.listItemPadding,
    this.onSearchTap,
    this.backgroundColor,
    this.searchTextStyle,
    this.searchFocusNode,
  });

  final List<DropdownMenuItem<T>> items;
  final T? selectedValue;
  final String Function(T) getStringFromItem;
  final ValueChanged<T?> onChanged;
  final bool enableSearch;
  final double borderRadius;
  final EdgeInsetsGeometry? listItemPadding;
  final VoidCallback? onSearchTap;
  final Color? backgroundColor;
  final TextStyle? searchTextStyle;
  final FocusNode? searchFocusNode;

  @override
  State<_DropdownExpandPanel<T>> createState() => _DropdownExpandPanelState<T>();
}

class _DropdownExpandPanelState<T> extends State<_DropdownExpandPanel<T>> {
  late List<DropdownMenuItem<T>> _visibleItems;
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _visibleItems = widget.items;
    _searchController.addListener(() => setState(() {}));
  }

  @override
  void didUpdateWidget(covariant _DropdownExpandPanel<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items) {
      _filterItems(_searchController.text);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems(String query) {
    final normalized = query.trim().toLowerCase();
    setState(() {
      if (normalized.isEmpty) {
        _visibleItems = widget.items;
        return;
      }

      _visibleItems = widget.items
          .where(
            (item) => widget
                .getStringFromItem(item.value as T)
                .toLowerCase()
                .contains(normalized),
          )
          .toList();
    });
  }

  void _clearSearch() {
    if (_searchController.text.isEmpty) return;
    _searchController.clear();
    _filterItems('');
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final panelColor = widget.backgroundColor ?? colorScheme.surfaceContainerHigh;
    final itemPadding = widget.listItemPadding ??
        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h);
    final maxHeight = _visibleItems.length >= 5 ? 0.35.sh : null;

    return Material(
      color: panelColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.enableSearch)
            Padding(
              padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 8.h),
              child: TextField(
                controller: _searchController,
                focusNode: widget.searchFocusNode,
                onChanged: _filterItems,
                onTap: widget.onSearchTap,
                style: widget.searchTextStyle ??
                    textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: colorScheme.surfaceContainer,
                  hintText: S.current.search,
                  hintStyle: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    size: 20.r,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  suffixIcon: _searchController.text.isEmpty
                      ? null
                      : IconButton(
                          onPressed: _clearSearch,
                          icon: Icon(
                            Icons.close_rounded,
                            size: 18.r,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 10.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: colorScheme.outlineVariant),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: colorScheme.outlineVariant),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: colorScheme.primary,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: maxHeight ?? 280.h,
            ),
            child: _visibleItems.isEmpty
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Center(
                      child: Text(
                        S.current.noResultFound,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  )
                : Scrollbar(
                    controller: _scrollController,
                    thumbVisibility: _visibleItems.length >= 5,
                    radius: Radius.circular(4.r),
                    child: ListView.separated(
                      controller: _scrollController,
                      shrinkWrap: true,
                      padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 8.h),
                      physics: const BouncingScrollPhysics(),
                      itemCount: _visibleItems.length,
                      separatorBuilder: (_, __) => Divider(
                        height: 1,
                        color: colorScheme.outlineVariant.withValues(
                          alpha: 0.5,
                        ),
                      ),
                      itemBuilder: (context, index) {
                        final item = _visibleItems[index];
                        final itemValue = item.value as T;
                        final isSelected = itemValue == widget.selectedValue;

                        return Material(
                          color: isSelected
                              ? colorScheme.primaryContainer
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8.r),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8.r),
                            onTap: () => widget.onChanged(itemValue),
                            child: Padding(
                              padding: itemPadding,
                              child: DefaultTextStyle(
                                style: textTheme.bodyLarge!.copyWith(
                                  color: isSelected
                                      ? colorScheme.onPrimaryContainer
                                      : colorScheme.onSurface,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                ),
                                child: item.child,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
