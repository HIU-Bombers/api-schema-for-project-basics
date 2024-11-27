import "@typespec/openapi";
import "@typespec/http";
import "@typespec/rest";
import "./apis/meals.tsp";
import "./apis/mealTickets/definitions.tsp";
import "./apis/users.tsp";
import "./apis/authorization.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.OpenAPI;

@service({
  title: "API schema for project basics",
})
@server("http://localhost:9000/", "development")
@useAuth(BearerAuth)
namespace ProjectBasics;
