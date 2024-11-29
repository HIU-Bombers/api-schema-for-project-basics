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
@route("meal-tickets/me")
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

  @post
  @summary("食券を使用するためのトークンを発行する")
  op getUseTicketsToken(
    @header
    contentType: "application/json",

    @body body: {
      @minItems(1)
      targetMealTickets: MealTicketId[];
    },
  ): {
    @statusCode statusCode: 200;
    @body body: {
      token: string;
      expires_at: utcDateTime;
    };
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
    @body body: Error;
  };

  @route("/use/{token}")
  namespace Use {
    @post
    @summary("食券を使用する")
    op use(@path token: string): {
      @statusCode statusCode: 200;
      @body body: MealTicket[];
    } | {
      @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
      @body body: Error;
    };

    @delete
    @summary("食券の使用を取り消す")
    op cancel(@path token: string): {
      @statusCode statusCode: 200;
      @body body: MealTicket[];
    } | {
      @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
      @body body: Error;
    };
  }
}
