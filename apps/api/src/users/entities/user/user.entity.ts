import { BaseEntity } from '../../../common/base.entity';

export class User extends BaseEntity {
  constructor(id: string, protected readonly email: string) {
    super(id);
  }

  getEmail(): string {
    return this.email;
  }
}
