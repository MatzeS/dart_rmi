import 'dart:async';
import 'package:async/async.dart';
import 'package:rmi/rmi.dart';
part 'standard_object.g.dart';

class RemoteFuture extends DelegatingFuture implements RmiTarget {
  RemoteFuture(Future future) : super(future);

  Provision provideRemote(Context context) =>
      _$RemoteFutureRmi.provideRemote(context, this);

  static RemoteFuture getRemote(Context context, String uuid) =>
      _$RemoteFutureRmi.getRemote(context, uuid);

  @override
  Object invoke(Invocation invocation) =>
      _$RemoteFutureInvoker.invoke(invocation, this);
}

class RemoteStream extends DelegatingStream implements RmiTarget {
  RemoteStream(Stream stream) : super(stream);

  Provision provideRemote(Context context) =>
      _$RemoteStreamRmi.provideRemote(context, this);

  static RemoteStream getRemote(Context context, String uuid) =>
      _$RemoteStreamRmi.getRemote(context, uuid);

  @override
  Object invoke(Invocation invocation) =>
      _$RemoteStreamInvoker.invoke(invocation, this);

  @override
  @NoProxy() //TEST
  Stream<R> cast<R>() {
    return super.cast();
  }
}
