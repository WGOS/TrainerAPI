import img.canvas;
import win.window;
import std.io;
import std.time;

auto width = 512, height = 512;

Window main = Window("Arcanoid", 400, 300, width + 10, height + 25);
Canvas img = Canvas(width, height);

double ballX = width/2, ballY = height/2, ballDX = 200, ballDY = 200;

int lastTime = clock();

char[256] keys;
do
{
	img.Clear(255, 255, 255);
	int mx, my;
	GetMouseState(&mx, &my);
	mx -= main.GetPosX();
	my -= main.GetPosY();
	mx = mx < 0 ? 0 : mx;
	mx = mx > width - 40 ? width-40 : mx;
	
	img.SetColor(0, 0, 0);
	img.DrawRect(0, 0, width, 50);
	
	img.SetColor(0, 0, 255);
	img.DrawRect(mx, height-15, mx+40, height-5);
	
	img.SetColor(0, 255, 0);
	img.DrawRect(ballX-5, ballY-5, ballX+5, ballY+5);
	
	main.DrawCanvas(&img, 0, 0);

	main.Update();
	
	double dt = (clock() - lastTime) * 0.001;

	lastTime = clock();
	
	ballX += ballDX * dt;
	ballY += ballDY * dt;
	if((ballX < 0 && ballDX < 0) || (ballX > (width-5) && ballDX > 0))
		ballDX = -ballDX;
	if((ballY < 50 && ballDY < 0) || (ballY > height-20 && ballY < height-5 && ballX > mx && ballX < (mx+40) && ballDY > 0))
		ballDY = -ballDY;
	
	GetKeyboardState(keys);
	
	int fps = 1.0 / dt;
	main.SetTitle("FPS is " + fps.str());
}while(!(keys[0x1B] & 0x80000000));
main.Close();

return 0;