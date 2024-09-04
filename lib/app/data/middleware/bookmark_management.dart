import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/bookmark_service.dart';

final bookmarkProvider = StateNotifierProvider<BookmarkNotifier, Set<String>>((ref) {
  return BookmarkNotifier(ref);
});

class BookmarkNotifier extends StateNotifier<Set<String>> {
  final Ref ref;

  BookmarkNotifier(this.ref) : super({}) {
    _loadBookmarks();
  }

  Future<void> _loadBookmarks() async {
    final bookmarks = await ref.read(bookmarkServiceProvider).loadBookmarks();
    state = bookmarks;
  }

  void toggleBookmark(String spellId) async {
    await ref.read(bookmarkServiceProvider).toggleBookmark(spellId);
    // Update the state to trigger a rebuild
    state = state.contains(spellId)
        ? (state..remove(spellId))
        : (state..add(spellId));
  }
}

final bookmarkServiceProvider = Provider<BookmarkService>((ref) {
  return BookmarkService();
});
