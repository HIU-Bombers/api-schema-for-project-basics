import "./meal.tsp";

namespace ProjectBasics;

@format("uuid")
scalar MealTicketId extends string;

model MealTicket {
  @visibility("read")
  id: MealTicketId;

  mealId: MealId;

  @minValue(1)
  price: int32;

  /**
   * 販売可能な食券の数
   */
  @minValue(0)
  avaliable_stocks: int32;

  /**
   * 販売日
   * `sales_at` が null の場合は、販売数を上回らない限り常に販売する食券として扱われます。
   */
  sales_at?: utcDateTime;
}

@format("uuid")
scalar MyMealTicketId extends string;

model MyMealTicket {
  @visibility("read")
  id: MyMealTicketId;

  mealTicket: MealTicketId;
  amount: int32;
}
