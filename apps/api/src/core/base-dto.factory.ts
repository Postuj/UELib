import { AggregateRoot } from '@nestjs/cqrs';

export interface BaseDtoFactory<TEntity extends AggregateRoot, TDto> {
  createFromEntity(entity: TEntity): TDto;
}
