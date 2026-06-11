import { Module } from '@nestjs/common';
import { AuthModule } from './auth/auth.module';
import { BrokerModule } from './broker/broker.module';
import { AppController } from './app.controller';

@Module({
  imports: [AuthModule, BrokerModule],
  controllers: [AppController],
})
export class AppModule {}
