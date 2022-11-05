import 'package:agrumino/network/post.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

class Mybloc extends Cubit {
  Mybloc() : super('');

  final BehaviorSubject token = BehaviorSubject();
  Sink get sinktoken => token.sink;
  Stream get streamtoken => token.stream;

  sendpost(username, password) async {
    var mytoken = await ThingsBoardPost().fetchpost(username, password);

    token.sink.add(mytoken.token);
   
  }
}
