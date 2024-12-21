import "./meal.tsp";

namespace ProjectBasics;

@format("uuid")
scalar MealTicketId extends string;

model MealTicket {
  @visibility("read")
  id: Meal,

  meal_id: MealId;

  @minValue(1)
  price: int32;

  /**
   * 1日あたり販売可能な食券の数
   */
  @minValue(0)
  available_stocks_per_day: int32;

  /**
   * 現在販売可能な食券の数
   */
  @minValue(0)
  available_stocks: int32;

  /**
   * 食券の使用数
   */
  @minValue(0)
  usage: int32;

  /**
   * 販売日
   * `sales_at` が null の場合は、販売数を上回らない限り常に販売する食券として扱われます。
   */
  sales_at?: plainDate;
}

@format("uuid")
scalar MyMealTicketId extends string;

model MyMealTicket {
  @visibility("read")
  id: MyMealTicketId;

  mealTicket: MealTicket;
  amount: int32;
  expires_at: utcDateTime;
}
