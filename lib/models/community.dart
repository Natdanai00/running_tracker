class CommunityModel {
  String? userName;
  String? userImg;
  String? datetime;
  String? post;
  String? comment;
  String? like;
  String? friendName;
  String? friendImg;
  CommunityModel(
      {required this.userName,
      required this.userImg,
      required this.datetime,
      required this.post,
      required this.comment,
      required this.friendName,
      required this.friendImg,
      required this.like});
}
