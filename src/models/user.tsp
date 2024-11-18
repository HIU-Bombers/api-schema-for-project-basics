@service
namespace ProjectBasics;

enum Role {
  Customer,
  Employee,
}

@format("uuid")
scalar UserId extends string;

model User {
  id: UserId;
  email: string;
  role: Role;
}
