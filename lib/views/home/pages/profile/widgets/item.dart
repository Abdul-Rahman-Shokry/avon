part of '../view.dart';

class _Item extends StatelessWidget {
  final String title;
  final bool isLogout;
  final Widget? destinationPage;

  const _Item({
    required this.title,
    this.isLogout = false,
    this.destinationPage,
  });

  @override
  Widget build(BuildContext context) {
    final String leading = "${title.toLowerCase().replaceAll(" ", "_")}.svg";

    return ListTile(
      onTap: destinationPage == null
          ? null
          : () async {
              if (isLogout) {
                final resp = await DioHelper.postData("/api/Auth/logout", withToken: true,);
                if (resp.isSuccess){
                  goTo(page: destinationPage!, canPop: false);
                  CacheHelper.clearSharedPrefs();
                  // clear cache
                } else {
                  showMsg("Something went wrong", isError: true);
                }
              }
              goTo(page: destinationPage!, canPop: false);
            },
      leading: AppImage(leading),
      title: !isLogout
          ? Text(title)
          : Text(title, style: TextStyle(color: Colors.red)),
      trailing: !isLogout ? AppImage("forward.svg") : null,
    );
  }
}