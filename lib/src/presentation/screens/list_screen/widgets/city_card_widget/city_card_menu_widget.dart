import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/generated/locale_keys.g.dart';

enum _Actions {
  delete,
  setMain,
}

class CityCardMenuWidget extends StatelessWidget {
  const CityCardMenuWidget({
    super.key,
    this.onDeleteClick,
    this.onSetMainClick,
  });

  final VoidCallback? onDeleteClick;
  final VoidCallback? onSetMainClick;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_Actions>(
      onSelected: (action) {
        switch (action) {
          case _Actions.delete:
            onDeleteClick?.call();

          case _Actions.setMain:
            onSetMainClick?.call();
        }
      },
      icon: Icon(
        Icons.more_vert,
        color: Theme.of(context).colorScheme.primary,
      ),
      itemBuilder: (_) => <PopupMenuEntry<_Actions>>[
        if (onSetMainClick != null)
          PopupMenuItem<_Actions>(
            value: _Actions.setMain,
            child: Text(LocaleKeys.cityCardMenu_setMain.tr()),
          ),
        PopupMenuItem<_Actions>(
          value: _Actions.delete,
          child: Text(LocaleKeys.cityCardMenu_delete.tr()),
        ),
      ],
    );
  }
}
