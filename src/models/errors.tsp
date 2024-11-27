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

enum UseMealTicketErrors {
  NotAvaliable,
}

enum ErrorCode {
  ...GeneralErros,
  ...MealErrors,
  ...MealTicketErrors,
  ...BuyMealTicketErrors,
}

@error
@example(#{
  error_code: ErrorCode.EmptyMealName,
  reason: "Meal name is empty.",
})
model Error {
  error_code: ErrorCode;
  reason: string;
}
