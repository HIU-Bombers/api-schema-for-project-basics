import "@typespec/http";
import "@typespec/rest";
import "../../models/errors.tsp";
import "../../models/meal.tsp";
import "../../models/mealTicket.tsp";

@service
namespace ProjectBasics;

using TypeSpec.Http;
using TypeSpec.Rest;

@tag("MealTickets")
@route("/meal-tickets")
namespace MealTickets {
  @get
  @summary("登録された食券の一覧を返す")
  op mealTickets(): {
    @statusCode statusCode: 200;
    @body body: MealTicket[];
  } | {
    @statusCode statusCode: 500;
    @body body: Error;
  };

  @post
  @summary("食券を登録する")
  op create(
    @header
    contentType: "application/json",

    @body body: MealTicket,
  ): {
    @statusCode statusCode: 201;
    @body body: MealTicket;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 500;
    @body body: Error;
  };

  @route("/{mealTicketId}")
  namespace PerElement {
    @get
    @summary("食券の詳細を返す")
    op getMealTicket(@path mealTicketId: MealTicketId): {
      @statusCode statusCode: 200;
      @body body: MealTicket;
    } | {
      @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
      @body body: Error;
    };

    @patch
    @summary("食券を更新する")
    op updateMealTicket(
      @header contentType: "application/json-patch+json",
      @path mealTicketId: MealTicketId,
      @body body: {
        mealId?: MealId;

        @minValue(1)
        price?: int32;

        /**
         * 販売可能な食券の数
         */
        @minValue(0)
        available_stocks?: int32;

        kind: MealKind;

        /**
         * 販売日
         * `sales_at` が null の場合は、販売数を上回らない限り常に販売する食券として扱われます。
         */
        sales_at?: utcDateTime;
      },
    ): {
      @statusCode statusCode: 200;
      @body body: MealTicket;
    } | {
      @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
      @body body: Error;
    };

    @delete
    @summary("食券を削除する")
    op deleteMealTicket(@path mealTicketId: MealTicketId): {
      @statusCode statusCode: 204;
    } | {
      @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
      @body body: Error;
    };
  }
}
