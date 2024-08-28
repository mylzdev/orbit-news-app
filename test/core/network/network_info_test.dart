import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/app/core/network/network_info.dart';

import 'network_info_test.mocks.dart';

@GenerateNiceMocks([MockSpec<InternetConnectionChecker>()])
void main() {
  late MockInternetConnectionChecker mockConnectionChecker;
  late NetworkInfoImpl networkInfo;

  setUp(() {
    mockConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockConnectionChecker);
  });
  group(
    "isConnected",
    () {
      final tConnectionFuture = Future.value(true);
      test(
        "should foward the call to DataConnectionChecker.hasConnection",
        () {
          when(mockConnectionChecker.hasConnection).thenAnswer(
            (realInvocation) => tConnectionFuture,
          );

          final result = networkInfo.isConnected;

          verify(mockConnectionChecker.hasConnection);
          expect(result, tConnectionFuture);
        },
      );
    },
  );
}
