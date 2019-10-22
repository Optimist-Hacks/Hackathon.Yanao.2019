// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CameraState extends CameraState {
  @override
  final int photoCount;
  @override
  final bool processing;

  factory _$CameraState([void Function(CameraStateBuilder) updates]) =>
      (new CameraStateBuilder()..update(updates)).build();

  _$CameraState._({this.photoCount, this.processing}) : super._() {
    if (photoCount == null) {
      throw new BuiltValueNullFieldError('CameraState', 'photoCount');
    }
    if (processing == null) {
      throw new BuiltValueNullFieldError('CameraState', 'processing');
    }
  }

  @override
  CameraState rebuild(void Function(CameraStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CameraStateBuilder toBuilder() => new CameraStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CameraState &&
        photoCount == other.photoCount &&
        processing == other.processing;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, photoCount.hashCode), processing.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CameraState')
          ..add('photoCount', photoCount)
          ..add('processing', processing))
        .toString();
  }
}

class CameraStateBuilder implements Builder<CameraState, CameraStateBuilder> {
  _$CameraState _$v;

  int _photoCount;
  int get photoCount => _$this._photoCount;
  set photoCount(int photoCount) => _$this._photoCount = photoCount;

  bool _processing;
  bool get processing => _$this._processing;
  set processing(bool processing) => _$this._processing = processing;

  CameraStateBuilder();

  CameraStateBuilder get _$this {
    if (_$v != null) {
      _photoCount = _$v.photoCount;
      _processing = _$v.processing;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CameraState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CameraState;
  }

  @override
  void update(void Function(CameraStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CameraState build() {
    final _$result = _$v ??
        new _$CameraState._(photoCount: photoCount, processing: processing);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
