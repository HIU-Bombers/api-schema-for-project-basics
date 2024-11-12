import "@typespec/http";
import "@typespec/rest";
import "../models/jsonPatch.tsp";
import "../models/meal.tsp";
import "../models/errors.tsp";

@service
namespace ProjectBasics;

using TypeSpec.Http;
using TypeSpec.Rest;

@tag("Meals")
@route("/meals")
namespace Meals {
  @post
  @summary("食事を登録する")
  op create(
    @header
    contentType: "application/json",

    @body body: Meal,
  ): {
    @statusCode statusCode: 201;
    @body body: Meal;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 500;
    @body body: Error;
  };

  @get
  @summary("登録された食事の一覧を返す")
  op meals(): {
    @statusCode statusCode: 200;
    @body body: Meal[];
  } | {
    @statusCode statusCode: 401 | 403 | 500;
    @body body: Error;
  };

  @route("/{mealId}")
  namespace PerElement {
    @get
    @summary("食事の詳細を返す")
    op getMeal(@path mealId: MealId): {
      @statusCode statusCode: 200;
      @body body: Meal;
    } | {
      @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
      @body body: Error;
    };

    @patch
    @summary("食事を更新する")
    op updateMeal(
      @header contentType: "application/json-patch+json",
      @path mealId: string,
      @body body: JsonPatch[],
    ): {
      @statusCode statusCode: 200;
      @body body: Meal;
    } | {
      @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
      @body body: Error;
    };

    @delete
    @summary("食事を削除する")
    op deleteMeal(@path mealId: MealId): {
      @statusCode statusCode: 204;
    } | {
      @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
      @body body: Error;
    };
  }
}
