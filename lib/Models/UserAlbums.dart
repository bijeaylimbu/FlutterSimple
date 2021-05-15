class UserAlbums{
  int user_id;
  int id;
  String title;
  

  UserAlbums(int user_id, int id, String title){


    this.user_id=user_id;
    this.id=id;
    this.title=title;
    

  }

  UserAlbums.fromJson(Map json):
  user_id=json['user_id'],
  id=json['id'],
  title=json['title'];

  

  Map toJson(){

    return {"user_id":user_id, "id":id, "title":title};
  }





}