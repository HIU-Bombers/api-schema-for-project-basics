import "@typespec/http";
import "@typespec/rest";
import "../models/user.tsp";
import "../models/errors.tsp";

@service
namespace ProjectBasics;

using TypeSpec.Http;
using TypeSpec.Rest;

@tag("Users")
@route("/users")
namespace Users {
  @summary("ユーザーを新規作成する")
  @post
  op create(
    @body body: {
      email: string;
      password: string;
    },
  ): {
    @statusCode statusCode: 201;
    @body body: User;
  } | {
    @statusCode statusCode: 400 | 500;
    @body body: Error;
  };

  @route("/{userId}")
  namespace PerElement {
    @summary("ユーザーのロールを変更する")
    @patch
    op updateUserRole(@path userId: UserId): {
      @statusCode statusCode: 200;
      @body body: {
        role: Role;
      };
    } | {
      @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
      @body body: Error;
    };

    @summary("ユーザーを削除する")
    @delete
    op delete(@path userId: UserId): {
      @statusCode stausCode: 204;
    } | {
      @statusCode statusCode: 401 | 403 | 404 | 500;
      @body body: Error;
    };
  }
}
