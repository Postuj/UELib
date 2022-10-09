import { Column, CreateDateColumn, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity('users')
export class UserSchema {
  @PrimaryGeneratedColumn('uuid')
  readonly id: string;

  @Column()
  email: string;

  @Column()
  passwordHash: string;

  @Column({ nullable: true })
  refreshTokenHash?: string;

  @CreateDateColumn({name: 'registered_at'})
  registeredAt: Date;

  @CreateDateColumn({name: 'updated_at'})
  updatedAt: Date;
}
