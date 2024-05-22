import {StoreService} from './store.service';
import {
  Body,
  Controller,
  Delete,
  Param,
  ParseIntPipe,
  Post,
  Res,
} from '@nestjs/common';
import {Response} from 'express';
import {Public} from 'src/user/authPublic.decorator';
import {CreateStoreDTO} from './DTO/create-store-dto';

@Controller('store')
export class StoreController {
  constructor(private readonly storeService: StoreService) {}

  @Public()
  @Post('saveWord/:userId/:wordId')
  async savedWord(
    @Param('userId', ParseIntPipe) userId: string,
    @Param('wordId', ParseIntPipe) wordId: string,
    @Res() res: Response,
  ) {
    try {
      const store = await this.storeService.saveWord({
        user: userId,
        word: wordId,
      });
      res.status(200).json(store);
    } catch (err) {
      res.status(404).send({message: 'Lỗi hệ thống'});
    }
  }

  @Public()
  @Delete('deleteSavedWord/:userId/:wordId')
  async deleteSavedWord(
    @Param('userId', ParseIntPipe) userId: string,
    @Param('wordId', ParseIntPipe) wordId: string,
    @Res() res: Response,
  ) {
    try {
      const store = await this.storeService.deleteSavedWord({
        user: userId,
        word: wordId,
      });
      res.status(200).json({message: 'Xóa thành công'});
    } catch (err) {
      res.status(404).send({message: 'Lỗi hệ thống'});
    }
  }
}
