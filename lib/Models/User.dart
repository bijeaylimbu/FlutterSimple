 class User{


   int id;
   String name;

   User(int id, String name){

     this.id=id;
     this.name=name;
   }

   User.fromJson(Map json):
   id=json['id'],
   name=json['name'];

   Map toJson(){

     return {"id":id,"name":name};
   }


  
 

 


 

     
   
 }