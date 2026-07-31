part of '../view.dart';

class _Item extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool isLogout;

  const _Item({
    required this.title,
    this.onTap,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    final String leading = "${title.toLowerCase().replaceAll(" ", "_")}.svg";

    return ListTile(
      onTap: onTap ?? () {},
      leading: AppImage(leading),
      title: !isLogout
          ? Text(title)
          : Text(title, style: TextStyle(color: Colors.red)),
      trailing: !isLogout ? AppImage("forward.svg") : null,
    );
  }
}