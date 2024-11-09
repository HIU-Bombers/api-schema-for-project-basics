namespace ProjectBasics;

enum Operation {
  Replace: "replace",
  Remove: "remove",
}

/**
 * [JSON Patch](https://datatracker.ietf.org/doc/html/rfc6902) 相当の操作を提供するためのモデル。
 */
@example(#{ `op`: Operation.Replace, path: "/name", value: "カレー" })
model JsonPatch {
  `op`: Operation;
  path: string;
  value?: string;
}
