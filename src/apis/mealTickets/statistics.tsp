import "@typespec/http";
import "@typespec/rest";
import "../../models/errors.tsp";
import "../../models/mealTicket.tsp";

@service
namespace ProjectBasics;

using TypeSpec.Http;
using TypeSpec.Rest;

@tag("Statistics")
@route("meal-tickets/{mealTicketId}/statistics")
namespace MealTicketStatistics {
  @get
  @summary("購入された食券の数と食券の使用量を返す")
  op statistics(@path mealTicketId: MealTicketId): {
    @statusCode statusCode: 200;
    @body body: Statistics;
  } | {
    @statusCode statusCode: 401 | 403 | 500;
    @body body: Error;
  };
}
