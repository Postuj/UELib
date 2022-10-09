import { AggregateRoot } from '@nestjs/cqrs';

export class User extends AggregateRoot {
  constructor(protected readonly id: string, protected readonly email: string) {
    super();
  }

  getId(): string {
    return this.id;
  }

  getEmail(): string {
    return this.email;
  }
}
