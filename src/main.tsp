import "@typespec/openapi";
import "@typespec/http";
import "@typespec/rest";
import "./apis/meals.tsp";
import "./apis/mealTickets.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.OpenAPI;

@service({
  title: "API schema for project basics",
})
@server("http://localhost/", "development")
@useAuth(BearerAuth)
namespace ProjectBasics;
