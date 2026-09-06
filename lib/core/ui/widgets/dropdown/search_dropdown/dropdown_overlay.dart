part of 'custom_search_dropdown.dart';

class _DropdownOverlay<T> extends StatefulWidget {
  final ValueNotifier<T?> selectValueNotifier;
  final String Function(T) getStringFromItem;
  final List<DropdownMenuItem<T>> items;
  final Size size;
  final LayerLink layerLink;
  final VoidCallback hideOverlay;
  final Widget? headerHint;
  final EdgeInsetsGeometry headerPadding;
  final EdgeInsetsGeometry overlayOuterPadding;
  final EdgeInsetsGeometry listItemPadding;
  final Offset overlayShadowOffset;
  final bool? canCloseOutsideBounds;
  final bool enableSearch;
  final double? borderRadius;
  final VoidCallback? onSearchTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final TextStyle? searchTextStyle;
  final void Function(T?) onChanged;
  final FocusNode? searchFocusNode;

  const _DropdownOverlay({
    Key? key,
    required this.selectValueNotifier,
    required this.items,
    required this.getStringFromItem,
    required this.size,
    required this.layerLink,
    required this.hideOverlay,
    this.headerHint,
    this.borderRadius,
    required this.headerPadding,
    required this.overlayOuterPadding,
    required this.listItemPadding,
    this.overlayShadowOffset = const Offset(0, 6),
    this.canCloseOutsideBounds,
    this.enableSearch = true,
    this.onSearchTap,
    this.backgroundColor,
    this.iconColor,
    this.searchTextStyle,
    required this.onChanged,
    this.searchFocusNode,
  }) : super(key: key);

  @override
  State<_DropdownOverlay<T>> createState() => _DropdownOverlayState<T>();
}

class _DropdownOverlayState<T> extends State<_DropdownOverlay<T>> {
  bool displayOverly = true;
  bool displayOverlayBottom = true;
  late List<DropdownMenuItem<T>> items;
  late List<DropdownMenuItem<T>> filteredItems;
  final key1 = GlobalKey(), key2 = GlobalKey();
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    items = widget.items;
    filteredItems = items;
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // border radius
    final borderRadius = BorderRadius.circular(widget.borderRadius ?? 0);

    // overlay icon
    final overlayIcon = Icon(
      displayOverlayBottom
          ? Icons.keyboard_arrow_up_rounded
          : Icons.keyboard_arrow_down_rounded,
      color: widget.iconColor ?? colorScheme.onSurfaceVariant,
      size: 20.r,
    );

    // overlay offset
    final overlayOffset = Offset(-12, displayOverlayBottom ? 0 : 60);

    // list padding
    final listPadding = const EdgeInsets.only(top: 8);
    // items list
    final list = items.isNotEmpty
        ? _ItemsList<T>(
            scrollController: scrollController,
            excludeSelected: true,
            itemsWidget: items,
            padding: listPadding,
            listItemPadding: widget.listItemPadding,
            onItemSelect: (value) {
              widget.selectValueNotifier.value = value;
              setState(() => displayOverly = false);
              widget.onChanged.call(value);
            },
          )
        : Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                S.current.noResultFound,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          );

    final content = Container(
      key: key1,
      padding: widget.overlayOuterPadding,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? colorScheme.surfaceContainerHigh,
          borderRadius: borderRadius,
          border: Border.all(color: colorScheme.outlineVariant),
        ),
        child: Material(
          color: Colors.transparent,
          child: AnimatedSection(
            animationDismissed: widget.hideOverlay,
            expand: displayOverly,
            alignment: displayOverlayBottom
                ? Alignment.bottomCenter
                : Alignment.topCenter,
            child: SizedBox(
              key: key2,
              height: items.length >= 4 ? 0.35.sh : null,
              child: ClipRRect(
                borderRadius: borderRadius,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (notification) {
                    notification.disallowIndicator();
                    return true;
                  },
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      scrollbarTheme: ScrollbarThemeData(
                        thumbVisibility: WidgetStateProperty.all(true),
                        thickness: WidgetStateProperty.all(4),
                        radius: Radius.circular(4.r),
                        thumbColor: WidgetStateProperty.all(
                          colorScheme.outlineVariant,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: widget.headerPadding,
                          child: Row(
                            children: [
                              Expanded(
                                child:
                                    widget.headerHint ??
                                    Text(
                                      '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: textTheme.bodyMedium?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                              ),
                              const SizedBox(width: 12),
                              overlayIcon,
                            ],
                          ),
                        ),
                        if (widget.enableSearch)
                          _SearchField<T>(
                            searchFocusNode: widget.searchFocusNode,
                            onSearchTap: widget.onSearchTap,
                            searchStyle: widget.searchTextStyle,
                            itemsWidget: filteredItems,
                            getStringFromItem: widget.getStringFromItem,
                            onSearchedItems: (val) {
                              setState(() {
                                items = val;
                              });
                            },
                          ),
                        const SizedBox(height: 10),
                        items.length >= 4 ? Expanded(child: list) : list,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    final child = Stack(
      children: [
        MediaQuery.of(context).viewInsets.bottom > 0
            ? Positioned(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  // width: 1.0.sw,
                  height: 1.0.sh - MediaQuery.of(context).viewInsets.bottom,
                  alignment: Alignment.bottomCenter,
                  child: content,
                ),
              )
            : Positioned(
                width: widget.size.width + 24,
                child: CompositedTransformFollower(
                  link: widget.layerLink,
                  followerAnchor: displayOverlayBottom
                      ? Alignment.topLeft
                      : Alignment.bottomLeft,
                  showWhenUnlinked: false,
                  offset: overlayOffset,
                  child: content,
                ),
              ),
      ],
    );

    return GestureDetector(
      onTap: () => setState(() => displayOverly = false),
      child: widget.canCloseOutsideBounds!
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
              child: child,
            )
          : child,
    );
  }

  void closeOverlay() {
    setState(() => displayOverly = false);
  }
}

class _ItemsList<T> extends StatelessWidget {
  final ScrollController scrollController;
  final List<DropdownMenuItem<T>> itemsWidget;
  final bool excludeSelected;
  final ValueSetter<T> onItemSelect;
  final EdgeInsets padding;
  final EdgeInsetsGeometry listItemPadding;

  const _ItemsList({
    Key? key,
    required this.scrollController,
    required this.itemsWidget,
    required this.excludeSelected,
    required this.onItemSelect,
    required this.padding,
    required this.listItemPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final colorScheme = Theme.of(context).colorScheme;

    return Scrollbar(
      controller: scrollController,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        shrinkWrap: true,
        padding: padding,
        itemCount: itemsWidget.length,
        itemBuilder: (_, index) {
          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onItemSelect(itemsWidget[index].value!),
              child: Container(
                padding: listItemPadding,
                child: itemsWidget[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SearchField<T> extends StatefulWidget {
  final List<DropdownMenuItem<T>> itemsWidget;
  final Function(List<DropdownMenuItem<T>>) onSearchedItems;
  final String Function(T) getStringFromItem;
  final VoidCallback? onSearchTap;
  final TextStyle? searchStyle;
  final FocusNode? searchFocusNode;
  const _SearchField({
    Key? key,
    required this.itemsWidget,
    required this.getStringFromItem,
    required this.onSearchedItems,
    this.onSearchTap,
    this.searchStyle,
    this.searchFocusNode,
  }) : super(key: key);

  @override
  State<_SearchField<T>> createState() => _SearchFieldState<T>();
}

class _SearchFieldState<T> extends State<_SearchField<T>> {
  final searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchCtrl.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  void onSearch(String str) {
    final result = widget.itemsWidget
        .where(
          (itemWidget) => widget
              .getStringFromItem(itemWidget.value!)
              .toLowerCase()
              .contains(str.toLowerCase()),
        )
        .toList();

    widget.onSearchedItems(result);
  }

  void onClear() {
    if (searchCtrl.text.isNotEmpty) {
      searchCtrl.clear();
      widget.onSearchedItems(widget.itemsWidget);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: TextField(
        focusNode: widget.searchFocusNode,
        controller: searchCtrl,
        onChanged: onSearch,
        onTap: widget.onSearchTap,
        style: widget.searchStyle ??
            textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: colorScheme.surfaceContainer,
          constraints: BoxConstraints.tightFor(height: 40.h),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
          hintText: S.current.search,
          hintStyle: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: colorScheme.onSurfaceVariant,
            size: 20.r,
          ),
          suffixIcon: searchCtrl.text.isEmpty
              ? null
              : IconButton(
                  onPressed: onClear,
                  icon: Icon(
                    Icons.close_rounded,
                    color: colorScheme.onSurfaceVariant,
                    size: 18.r,
                  ),
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
            borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
          ),
        ),
      ),
    );
  }
}
