import "@typespec/http";
import "@typespec/rest";
import "../models/user.tsp";
import "../models/errors.tsp";

@service
namespace ProjectBasics;

using TypeSpec.Http;
using TypeSpec.Rest;

@tag("Authorization")
namespace Authorization {
  @route("/signin")
  @summary("サインインする")
  @post
  op signin(): {
    @statusCode statusCode: 200;

    /**
     * `PROJECT_BASICS__SESSION_ID` という名前の Cookie に24時間有効なセッション ID を設定します。
     */
    @header SetCookie: string;
  } | {
    @statusCode statusCode: 500;
    @body body: Error;
  };

  @route("signout")
  @summary("サインアウトする")
  @post
  op signout(): {
    @statusCode statusCode: 200;

    /**
     * `PROJECT_BASICS__SESSION_ID` という名前の Cookie に24時間有効なセッション ID を削除します。
     */
    @header SetCookie: string;
  } | {
    @statusCode statusCode: 401 | 500;
    @body body: Error;
  };
}
