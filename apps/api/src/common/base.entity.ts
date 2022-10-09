import { AggregateRoot } from '@nestjs/cqrs';

export abstract class BaseEntity extends AggregateRoot {
  constructor(protected readonly id: string) {
    super();
  }

  getId(): string {
    return this.id;
  }
}
