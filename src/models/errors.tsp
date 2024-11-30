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
  NotAvailable,
}

enum UserErrors {
  InvalidEmail,
  PasswordTooShort,
  UserAlreadyExists
}

enum ErrorCode {
  ...GeneralErros,
  ...MealErrors,
  ...MealTicketErrors,
  ...BuyMealTicketErrors,
  ...UseMealTicketErrors,
  ...UserErrors,
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
