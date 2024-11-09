namespace ProjectBasics;

enum GeneralErros {
  BadRequest,
  Forbidden,
  InternalError,
}

enum MealErrors {
  EmptyMealName,
}

enum MealTicketErrors {
  UnknwonMeal,
  InvalidPrice,
  InvalidStocks,
}

enum BuyMealTicketErrors {
  OutOfStock,
  InvalidBuyAmount,
}

enum ErrorCode {
  ...GeneralErros,
  ...MealErrors,
  ...MealTicketErrors,
  ...BuyMealTicketErrors,
}

@error
@example(#{ errorCode: ErrorCode.EmptyMealName, reason: "Meal name is empty." })
model Error {
  errorCode: ErrorCode;
  reason: string;
}
