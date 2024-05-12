import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UserModule } from './user/user.module';
import { MyLoggerModule } from './my-logger/my-logger.module';
import { ThrottlerGuard, ThrottlerModule } from '@nestjs/throttler';
import { APP_GUARD } from '@nestjs/core';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: process.env.PGHOST,
      username: process.env.PGUSER,
      password: process.env.PGPASSWORD,
      database: process.env.PGDATABASE,
      ssl: true,
      autoLoadEntities: true,
      synchronize: true,
    }),
    ThrottlerModule.forRoot([{
      name: 'short',
      ttl: 100,
      limit: 5,
    },
    {
      name: 'long',
      ttl: 60000,
      limit: 100,
    }]),
    MyLoggerModule,
    UserModule
  ],
  controllers: [],
  providers: [
    {
      provide: APP_GUARD,
      useClass: ThrottlerGuard
    },
  ],
})
export class AppModule { }
