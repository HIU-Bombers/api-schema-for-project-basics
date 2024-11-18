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

  @route("/sessions")
  namespace Sessions {
    @post
    @summary("セッションを開始する")
    op create(): {
      @statusCode statusCode: 200;

      /**
       * `PROJECT_BASICS__SESSION_ID` という名前の Cookie に24時間有効なセッション ID を設定します。
       */
      @header SetCookie: string;
    } | {
      @statusCode statusCode: 401 | 500;
      @body body: Error;
    };

    @delete
    @summary("セッションを終了する")
    op delete(): {
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
}
