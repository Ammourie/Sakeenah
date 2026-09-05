---
name: flutter-clean-architecture-usecase
description: Use whenever adding a new use case / API endpoint to a feature
  in this Flutter project (e.g. "add a new usecase for X", "add an endpoint
  for X", "wire up the X API"). Follows this project's TDD Clean Architecture
  layering: model/entity -> remote data source -> repository -> use case ->
  cubit.
---

# Flutter Clean Architecture — New Use Case Workflow

This project follows **TDD Clean Architecture** (data / domain / presentation
layers). When asked to add a new use case, always follow the layers below,
**in order**, and mirror the existing folder structure and naming
conventions found in the feature you're working in.

Reference for endpoints: check the requirements listed in  
`@docs/prayer_quran_app_requirements.md`. Look up the real
endpoint there first. If the endpoint truly isn't documented yet, add it to
`APIUrls` as a dummy string with a `// TODO: confirm endpoint with backend`
comment instead of guessing.

Do **not** run any code-generation command (`build_runner`, etc.) — the user
runs generation manually.

## Folder structure (per feature)

```
feature/
├── data/
│   ├── datasource/          # IXxxRemoteDataSource / XxxRemoteDataSource
│   └── request/
│       ├── model/            # response models (XxxModel, XxxListModel)
│       ├── param/ or params/ # request params (XxxParams)
├── domain/
│   ├── entity/               # XxxEntity, XxxListEntity
│   ├── repository/           # IXxxRepository / XxxRepository
│   └── usecase/              # XxxUseCase
└── presentation/
    ├── state_m/
    │   └── cubit/            # XxxState + cubit method
    └── ...
```

## Step 1 — Entity + Model (domain + data)

Create the entity first, then the model that maps to it.

- **Entity** (`domain/entity/xxx_entity.dart`): extends `BaseEntity`, plain
  Dart fields, `props` list for equality (Equatable-style), no
  parsing/network logic.
- **Model** (`data/request/model/xxx_model.dart`): extends
  `BaseModel<XxxEntity>`, has a `fromMap(Map<String, dynamic> json)` factory
  and a `toEntity()` override. If the model needs to serialize back to JSON
  (e.g. for caching), also add `toMap()`.
- **Always parse fields using the project's type validators**
  (`numV`, `stringV`, `dateTimeV`, etc. from `core/common/type_validators.dart`)
  — never parse raw JSON fields directly (`json["x"] as String`, etc.).
- **If the endpoint returns a list**, create both an item pair and a list
  pair, following the existing pattern:
  - `XxxEntity` + `XxxListEntity` (with `totalCount` and `List<XxxEntity> items`)
  - `XxxModel` + `XxxListModel` (with a `fromMap` that maps each item through
    `XxxModel.fromMap`, and a `toEntity()` that maps items via the list
    extension, e.g. `items.toListEntity()`)

```dart
// entity
class XxxEntity extends BaseEntity {
  final int? id;
  final String name;

  XxxEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

// model
class XxxModel extends BaseModel<XxxEntity> {
  final int? id;
  final String name;

  XxxModel({required this.id, required this.name});

  factory XxxModel.fromMap(Map<String, dynamic> json) => XxxModel(
        id: numV(json["id"]),
        name: stringV(json["name"]),
      );

  @override
  XxxEntity toEntity() => XxxEntity(id: id, name: name);

  factory XxxModel.dummy() => XxxModel(
    id: 1,
    name: "John Doe",
  );

}
```

## Step 2 — Params (if the request needs a body/query)

Add a params class under `data/request/param(s)/xxx_params.dart`. It must
extend `BaseParams`, pass `cancelToken` up to `super`, and provide `toMap()`
(used as the request body/query) plus a `toJson()` that encodes `toMap()`.

```dart
import 'dart:convert';

import '../../../../../core/params/base_params.dart';

class XxxParams extends BaseParams {
  final String fieldOne;
  final String fieldTwo;

  XxxParams({
    required this.fieldOne,
    required this.fieldTwo,
    cancelToken,
  }) : super(cancelToken: cancelToken);

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "fieldOne": fieldOne,
        "fieldTwo": fieldTwo,
      };
}
```

## Step 3 — Remote data source (interface + implementation)

Add one method per endpoint to both the interface and implementation.

```dart
abstract class IXxxRemoteDataSource extends RemoteDataSource {
  /// {Describe what this endpoint does}
  Future<Either<AppErrors, XxxModel>> actionName(XxxParams param);
}
```

```dart
class XxxRemoteDataSource extends IXxxRemoteDataSource {
  /// Implementation of actionName method
  @override
  Future<Either<AppErrors, XxxModel>> actionName(XxxParams param) {
    return request<XxxModel>(
      converter: (json) => XxxModel.fromMap(json),
      method: HttpMethod.POST, // or GET/PUT/DELETE — match actual requirements
      url: APIUrls.API_XXX_ACTION,
      cancelToken: param.cancelToken,
      body: param.toMap(),
    );
  }
}
```

- Look up the correct HTTP method and URL in `@docs/prayer_quran_app_requirements.md` and add
  the constant to `APIUrls` (or add a dummy URL + TODO if not found).
- if end point is dummy then let the remote data source return a dummy result like

````dart
class XxxRemoteDataSource extends IXxxRemoteDataSource {
  /// Implementation of actionName method
  @override
  Future<Either<AppErrors, XxxModel>> actionName(XxxParams param) {
   // return request<XxxModel>(
   //   converter: (json) => XxxModel.fromMap(json),
   //   method: HttpMethod.POST, // or GET/PUT/DELETE — match actual requirements
   //   url: APIUrls.API_XXX_ACTION,
   //   cancelToken: param.cancelToken,
   //   body: param.toMap(),
   // );
   //TODO: when api is ready remove this dummy code
   await Future.delayed(const Duration(seconds: 2));
   return right(XxxModel.dummy());
  }
}

## Step 4 — Repository (interface + implementation)

```dart
abstract class IXxxRepository extends Repository {
  Future<Result<AppErrors, XxxEntity>> actionName(XxxParams body);
}
````

```dart
class XxxRepository extends IXxxRepository {
  final IXxxRemoteDataSource _iXxxRemoteDataSource;

  XxxRepository(this._iXxxRemoteDataSource);

  @override
  Future<Result<AppErrors, XxxEntity>> actionName(XxxParams param) async {
    return execute(remoteResult: await _iXxxRemoteDataSource.actionName(param));
  }
}
```

## Step 5 — Use case

```dart
import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/request/params/xxx_params.dart';
import '../entity/xxx_entity.dart';
import '../repository/ixxx_repository.dart';

@singleton
class ActionNameUseCase extends UseCase<XxxEntity, XxxParams> {
  final IXxxRepository iXxxRepository;

  ActionNameUseCase(this.iXxxRepository);

  @override
  Future<Result<AppErrors, XxxEntity>> call(XxxParams params) =>
      iXxxRepository.actionName(params);
}
```

## Step 6 — Cubit state + method

Add a new state variant for the loaded result, and a method that calls the
use case via `getIt`, following the existing `safeEmit` + `result.pick`
pattern.

```dart
const factory XxxState.actionNameLoaded({required XxxEntity xxxEntity}) =
    actionNameLoadedState;
```

```dart
void actionName(XxxParams param) async {
  safeEmit(const XxxState.loading());

  final result = await getIt<ActionNameUseCase>()(param);
  result.pick(
    onData: (data) {
      safeEmit(XxxState.actionNameLoaded(xxxEntity: data));
    },
    onError: (error) {
      safeEmit(
        XxxState.error(
          error: result.error!,
          callback: () => this.actionName(param),
        ),
      );
    },
  );
}
```

## Checklist (apply in order)

- [ ] Entity created (+ list entity if the response is a list)
- [ ] Model created with `fromMap`/`toEntity` using type validators (+ list
      model if applicable)
- [ ] Params class created (if the request has a body/query), extending
      `BaseParams` with `toMap()` + `toJson()`
- [ ] Endpoint checked against `@docs/prayer_quran_app_requirements.md`; `APIUrls` constant added (dummy +
      TODO if not documented)
- [ ] Method added to `IXxxRemoteDataSource` and `XxxRemoteDataSource`
- [ ] Method added to `IXxxRepository` and `XxxRepository`
- [ ] Use case class created, annotated `@singleton`
- [ ] State variant added to the feature's cubit state
- [ ] Method added to the cubit using `safeEmit` + `result.pick`
- [ ] No code-generation command run (left for the user to run manually)
- [ ] Any static/user-facing strings introduced use `S.current`, never
      hardcoded literals
