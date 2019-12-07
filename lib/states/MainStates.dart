import 'package:camera/camera.dart';

abstract class MainStates {
  MainStates([List props = const []]);
}

class ImLaden extends MainStates {
  final List<CameraDescription> cameras;
  ImLaden(this.cameras);
}

class InQuest extends MainStates {
  final List<CameraDescription> cameras;
  //Array has the Position -> for each position -> Text, Object and if Screen has Camera or just text
  var quest = [
    ["Description", "Object", bool]
  ];
  int position = 0;
  InQuest(this.cameras);
}

/*class SelectChallenge extends MainStates{
  final List<CameraDescription> cameras;
  SelectChallenge(this.cameras);
}*/
