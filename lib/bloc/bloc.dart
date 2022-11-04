import 'package:agrumino/network/post.dart';
import 'package:bloc/bloc.dart';

class Mybloc extends Cubit {
  Mybloc() : super('');

  void sendpost() async {
    var mytoken = await ThingsBoardPost().fetchpost();
    print(mytoken.token);
  }
}
