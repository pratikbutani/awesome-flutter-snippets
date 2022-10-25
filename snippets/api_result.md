### While working with the APIs we need to take care of the api result and every time we need to handle two cases only
- Success: The data of the API call.
- Failure: The error message of the API call.

### Here we have guide along with the code snippet to handle the API result

### 1. Add dependencies
- freezed
- build_runner


### 2. Create a file with the name of the api_result.dart
```dart
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Check out about this here: https://github.com/pratikbutani/awesome-flutter-snippets/tree/main/snippets/api_network_exception.md
import 'network_exceptions.dart';

part 'api_result.freezed.dart';

@freezed
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success({@required T data}) = Success<T>;

  const factory ApiResult.failure({@required NetworkExceptions error}) =
      Failure<T>;
}
```
### 4. Run the command in the terminal
```
flutter pub run build_runner build
```
This will generate the api_result.freezed.dart file


### 3. Example of the usage
#### Repository or Service level
```dart
Future<ApiResult<List<Post>>> fetchPostList() async {
    try {
      // Dio or Http API client
      final response = await _apiClient.get('/posts');
      List<Post> postList = PostResponse.fromJson(response).results;
      return ApiResult.success(data: postList);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
```
#### BLoC or ViewModel level
```dart
_onFetchPostListEvent(FetchPostListEvent event, Emitter<> emit) async {
    final result = await _postRepository.fetchPostList();
    result.when(
      success: (data) {
        emit(PostListLoadedState(postList: data));
      },
      failure: (error) {
        emit(PostListErrorState(error: error));
      },
    );
  }
```

---

_**Refrence**_
- [Handling Network Calls and Exceptions in Flutter](https://dev.to/ashishrawat2911/handling-network-calls-and-exceptions-in-flutter-54me)
- [Freezed](https://pub.dev/packages/freezed)
