import "@typespec/openapi";
import "@typespec/http";
import "@typespec/rest";

using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.OpenAPI;

@service({
  title: "API schema for project basics",
})
@server("http://localhost:9000", "development")
@useAuth(BearerAuth)
namespace ProjectBasics;
