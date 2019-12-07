import 'package:bloc/bloc.dart';
import 'package:flutter_realtime_detection/events/mainEvents.dart';
import 'package:flutter_realtime_detection/states/MainStates.dart';
import 'package:camera/camera.dart';

class MainBloc extends Bloc<MainEvents, MainStates> {
  final List<CameraDescription> cameras;

  MainBloc({this.cameras});
  @override
  MainStates get initialState => ImLaden(cameras);

  @override
  Stream<MainStates> mapEventToState(MainEvents event) async* {
    try {
      if (event is StartQuest) {
        yield (InQuest(cameras));
      }
    } catch (_) {}
  }
}
