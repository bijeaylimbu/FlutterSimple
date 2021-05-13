import "package:hive/hive.dart";

class HiveService{

  isExists({String boxName}) async{


    final openBox=await Hive.openBox(boxName);
    int length=openBox.length;
    return length!=0;

  }

  addBoxed<T> (List<T> items, String boxName) async{

    print("adding box");
    final openBox=await Hive.openBox(boxName);
    for (var item in items){

      openBox.add(item);

    }
  }

  getBox<T> (String boxName) async{

    List<T> boxList=List<T> ();
    final openBox=await Hive.openBox(boxName);
    int length=openBox.length;
    for (int i=0;i<length;i++){
      boxList.add(openBox.getAt(i));


    }
    return boxList;
  }
}