import 'package:test/test.dart';

main() {
  test('', () {
    // await ((Future.delayed(Duration(seconds: 1)).then((value) {
    //   print('completed');
    //   throw new Exception('asdf');
    // }))
    //       ..then((value) {
    //         print('completed aswell');
    //       })
    //       ..catchError((error, stack) {
    //         print('asdflkjasd;lfkjl;');
    //         return Future.value(1);
    //       }))
    //     .catchError((e) {
    //   print('now w e are here');
    // }).then((value) {
    //   print('thrid');
    // }, onError: (e) {
    //   print('catched');
    // });

    // someFuture().then((v) {
    //   print('value $v');
    //   return 1;
    // }).catchError((e) {
    //   print('error $e');
    //   return 4;
    // }).then((v) {
    //   print('$v');
    // });
  });
}

Future<num> someFuture() async {
  // throw new Exception('some ex');
  return 3;
}
