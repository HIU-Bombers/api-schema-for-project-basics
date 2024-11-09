import "@typespec/http";
import "@typespec/rest";
import "../../models/errors.tsp";
import "../../models/meal.tsp";
import "../../models/mealTicket.tsp";

@service
namespace ProjectBasics;

using TypeSpec.Http;
using TypeSpec.Rest;

@tag("MyTickets")
@route("meal-tickets/mine")
namespace MyMealTickets {
  @get
  @summary("購入済みかつ使用可能な食券一覧を返す")
  op myTickets(): {
    @statusCode statusCode: 200;
    @body body: MyMealTicket[];
  } | {
    @statusCode statusCode: 401 | 403 | 500;
    @body body: Error;
  };
}
