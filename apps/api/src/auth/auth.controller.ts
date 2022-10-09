import { Controller, Post, UseGuards, Body, HttpCode, HttpStatus } from '@nestjs/common';
import { AuthService } from './auth.service';
import { LocalAuthGuard } from './guards/local-auth.guard';
import { Public } from 'src/common/public';
import { JwtRefreshTokenAuthGuard } from './guards/jwtRefreshToken-auth.guard';
import { GetUser } from 'src/users/decorators/user.decorator';
import { CommandBus } from '@nestjs/cqrs';
import { RegisterRequestDto } from './dto/register/register-request.dto';
import { RegisterUserCommand } from './commands/register-user/register-user.command';
import { RegisterResponseDto } from './dto/register/register-response.dto';
import { RegisterUserCommandOutput } from './commands/register-user/register-user.handler';
import { User } from 'src/users/entities/user/user.entity';
import { RefreshAccessTokenRequestDto } from './dto/refresh-access-token/refresh-access-token-request.dto';
import { RefreshAccessTokenCommand } from './commands/refresh-access-token/refresh-access-token.command';
import { RefreshAccessTokenCommandOutput } from './commands/refresh-access-token/refresh-access-token.handler';
import { RefreshAccessTokenResponseDto } from './dto/refresh-access-token/refresh-access-token-response.dto';
import { LoginUserCommand } from './commands/login-user/login-user.command';
import { LoginUserCommandOutput } from './commands/login-user/login-user.handler';
import { LoginResponseDto } from './dto/login/login-response.dto';
import { LoginRequestDto } from './dto/login/login-request.dto';
import { LogoutUserCommand } from './commands/logout-user/logout-user.command';

@Controller('auth')
export class AuthController {
  constructor(private readonly commandBus: CommandBus) {}

  @Public()
  @UseGuards(LocalAuthGuard)
  @HttpCode(HttpStatus.OK)
  @Post('login')
  async logIn(@GetUser() user: User, @Body() dto: LoginRequestDto): Promise<LoginResponseDto> {
    const { accessToken, refreshToken } = await this.commandBus.execute<
      LoginUserCommand,
      LoginUserCommandOutput
    >(new LoginUserCommand(user.getId()));
    return {
      id: user.getId(),
      email: user.getEmail(),
      accessToken,
      refreshToken,
    };
  }

  @Public()
  @HttpCode(HttpStatus.CREATED)
  @Post('signup')
  async singUp(@Body() registerDto: RegisterRequestDto): Promise<RegisterResponseDto> {
    const { email, password } = registerDto;
    const { user, tokens } = await this.commandBus.execute<
      RegisterUserCommand,
      RegisterUserCommandOutput
    >(new RegisterUserCommand(email, password));

    return { id: user.getId(), email: user.getEmail(), ...tokens };
  }

  @Public()
  @UseGuards(JwtRefreshTokenAuthGuard)
  @HttpCode(HttpStatus.OK)
  @Post('refresh-token')
  async refreshToken(
    @GetUser() user: User,
    @Body() dto: RefreshAccessTokenRequestDto,
  ): Promise<RefreshAccessTokenResponseDto> {
    const { accessToken, refreshToken } = await this.commandBus.execute<
      RefreshAccessTokenCommand,
      RefreshAccessTokenCommandOutput
    >(new RefreshAccessTokenCommand(user.getId(), dto.refreshToken));

    return {
      accessToken,
      refreshToken,
    };
  }

  @HttpCode(HttpStatus.OK)
  @Post('logout')
  logout(@GetUser() user: User) {
    return this.commandBus.execute<LogoutUserCommand, void>(new LogoutUserCommand(user.getId()));
  }
}
