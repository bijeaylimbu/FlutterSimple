class UserPost{
  int user_id;
  int id;
  String title;
  String body;

  UserPost(int user_id, int id, String title, String body){


    this.user_id=user_id;
    this.id=id;
    this.title=title;
    this.body=body;

  }

  UserPost.fromJson(Map json):
  user_id=json['user_id'],
  id=json['id'],
  title=json['title'],
  body=json['body'];
  

  Map toJson(){

    return {"user_id":user_id, "id":id, "title":title, "body":body};
  }





}