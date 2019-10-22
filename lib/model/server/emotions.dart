import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'emotions.g.dart';

abstract class Emotions implements Built<Emotions, EmotionsBuilder> {
  static Serializer<Emotions> get serializer => _$emotionsSerializer;

  double get anger;

  double get contempt;

  double get disgust;

  double get fear;

  double get happiness;

  double get neutral;

  double get sadness;

  double get surprise;

  Emotions._();

  factory Emotions([void Function(EmotionsBuilder) updates]) = _$Emotions;
}
