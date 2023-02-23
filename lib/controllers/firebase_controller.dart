import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class FireBaseStorage extends GetxController {
  @override
  void onInit() {
    getResult();
    super.onInit();
  }

  final storageRef = FirebaseStorage.instance.ref();
  List<String> images = List.empty(growable: true);
  void getResult() async {
    
    Reference reference = storageRef.child('adminpanel');
    var itemsList=await reference.listAll();
    itemsList.items.forEach((element)async{
      var url=await element.getDownloadURL();
      images.add(url);
    });
    update();
    
   

       // print(images.length);
    //s    print(images[0]);
  }
  void updateList(var data){
    images.add(data);
    update();
  }
}
    
//     for (var items in value.items) {
//       {
//       items.getDownloadURL().then((url) => {
        
//         images.add(url)

//       });
//     }
//     }
//     update();
//   });
// }


// }
