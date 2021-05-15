class UserPhotos{
  int album_id;
  int id;
  String title;
  String url;
  

  UserPhotos(int album_id, int id, String title,String url){


    this.album_id=album_id;
    this.id=id;
    this.title=title;
    this.url=url;
    

  }

  UserPhotos.fromJson(Map json):
  album_id=json['album_id'],
  id=json['id'],
  title=json['title'],
  url=json['url'];

  

  Map toJson(){

    return {"user_id":album_id, "id":id, "title":title,"url":url};
  }





}