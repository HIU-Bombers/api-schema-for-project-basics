import "@typespec/http";
import "@typespec/rest";
import "../../models/errors.tsp";
import "../../models/meal.tsp";
import "../../models/mealTicket.tsp";

@service
namespace ProjectBasics;

using TypeSpec.Http;
using TypeSpec.Rest;

@tag("BuyMealTickets")
@route("meal-tickets/{mealTicketId}/buy")
namespace BuyMealTickets {
  @post
  @summary("食券を購入する")
  op buy(
    @path mealTicketId: MealTicketId,

    @header
    contentType: "application/json",

    @body body: {
      @minValue(1)
      amount: int32;
    },
  ): {
    @statusCode statusCode: 200;
    @body body: MyMealTicket;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
    @body body: Error;
  };

  @delete
  @summary("食券の購入を取り消す")
  op cancel(@path mealTicketId: MyMealTicketId): {
    @statusCode statusCode: 204;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
    @body body: Error;
  };
}
