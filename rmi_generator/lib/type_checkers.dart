import 'package:source_gen/source_gen.dart';

const RmiTargetChecker = TypeChecker.fromUrl(
    'asset:rmi/lib/remote_method_invocation.dart#RmiTarget');

const NotInvocableChecker =
    TypeChecker.fromUrl('asset:rmi/lib/invoker.dart#NotInvocable');

const InvocableChecker =
    TypeChecker.fromUrl('asset:rmi/lib/invoker.dart#Invocable');

const ProxyChecker = TypeChecker.fromUrl('asset:rmi/lib/proxy.dart#Proxy');

const NoProxyChecker = TypeChecker.fromUrl('asset:rmi/lib/proxy.dart#NoProxy');
