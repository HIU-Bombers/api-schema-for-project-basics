namespace ProjectBasics;

@format("uuid")
scalar MealId extends string;

model Meal {
  @visibility("read")
  id: MealId;

  @minLength(1)
  @example("カレー")
  name: string;

  @minLength(1)
  description?: string;
}
