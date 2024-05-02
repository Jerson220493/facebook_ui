class Publication {
  final User user;
  final String title;
  final DateTime createAt;
  final String imageUrl;
  final int countComents;
  final int countShares;
  final reactions currenUserReactions;

  Publication({
    required this.user,
    required this.title,
    required this.createAt,
    required this.imageUrl,
    required this.countComents,
    required this.countShares,
    required this.currenUserReactions,
  });
}

class User {
  final String avatar;
  final String username;

  User({
    required this.avatar,
    required this.username,
  });
}

enum reactions {
  like,
  love,
  laughing,
  sad,
  shocking,
  angry,
}
