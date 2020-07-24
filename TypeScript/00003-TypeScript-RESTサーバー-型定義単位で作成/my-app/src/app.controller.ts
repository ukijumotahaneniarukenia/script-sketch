import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}
unko
unko  @Get()
unko  getHello(): string {
unko    return this.appService.getHello();
unko  }
}
