import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/constant.dart';


class BookmarkService {
  Future<Set<String>> loadBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(Constants.bookmarkedSpells)?.toSet() ?? {};
  }

  Future<void> toggleBookmark(String spellId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> bookmarks =
        prefs.getStringList(Constants.bookmarkedSpells)?.toSet() ?? {};

    if (bookmarks.contains(spellId)) {
      bookmarks.remove(spellId);
    } else {
      bookmarks.add(spellId);
    }

    await prefs.setStringList(Constants.bookmarkedSpells, bookmarks.toList());
  }
}
