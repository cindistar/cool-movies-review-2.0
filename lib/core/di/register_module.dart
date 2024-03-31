import 'dart:io';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @singleton
  GraphQLClient get graphqlClient => GraphQLClient(
        link: HttpLink(
          Platform.isAndroid
              ? 'http://10.0.2.2:5001/graphql'
              : 'http://localhost:5001/graphql',
        ),
        cache: GraphQLCache(),
      );
}
