import { Injectable } from '@nestjs/common';
import { EntitySchemaFactory } from 'src/database/entity-schema.factory';
import { User } from 'src/users/entities/user/user.entity';
import { UserSchema } from './user.schema';

@Injectable()
export class UserSchemaFactory implements EntitySchemaFactory<UserSchema, User> {
  // Use UserPrivate instead
  create(user: User): UserSchema {
    return {
      id: user.getId(),
      email: user.getEmail(),
      passwordHash: '',
      registeredAt: new Date(),
      updatedAt: new Date(),
    };
  }

  createFromSchema(userSchema: UserSchema): User {
    return new User(userSchema.id, userSchema.email);
  }
}
