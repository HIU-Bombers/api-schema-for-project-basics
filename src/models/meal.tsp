namespace ProjectBasics;

@format("uuid")
scalar MealId extends string;

enum MealKind {
  OTHER,
  SET,
  BOWL,
  CURRY,
  RAMEN,
  SOBA,
  UDON,
}

/**
 * 食事のモデル。
 *
 * `meal_image` について、画像は base64 エンコードされた文字列である必要があります。
 * NOTE: multipart/form-data でのエンコードも検討したが、JSON スキーマとの相性を考えると base64 を使うのほうが都合が良いと判断した。
 */
model Meal {
  @visibility("read")
  id: MealId;

  @minLength(1)
  @example("カレー")
  name: string;

  @minLength(1)
  description?: string;

  kind: MealKind;
  meal_image?: string;
}
