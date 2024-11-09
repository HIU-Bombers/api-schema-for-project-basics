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

model MealTicket {
  @visibility("read")
  @format("uuid")
  id: string;

  mealId: MealId;

  @minValue(1)
  price: int32;

  @minValue(0)
  stocks: int32;

  /**
   * 販売日。
   * `sales_at` が null の場合は、販売数を上回らない限り常に販売する食券として扱われます。
   */
  sales_at?: utcDateTime;
}
