import img.canvas;
import win.window;
import std.io;
import std.time;
import std.math;

int width = 256;
int height = 256;

float[] a = new float[width*height];
float[] b = new float[width*height];

Canvas img = Canvas(width, height);

float[] data = img.GetData();

float get(float[] arr, int x, y){ return arr[x+y*width]; }
void set(float[] arr, int x, y, float val){ arr[x+y*width] = val; }

void process(float[] from, float[] to)
{
	auto damping = 0.01;
	
	for(auto x = 2; x < width - 2; x++)
	{
		for(auto y = 2; y < height - 2; y++)
		{
			double sum = from[(x-2) + (y) * width];
			sum += from[(x+2) + (y) * width];
			sum += from[(x) + (y-2) * width];
			sum += from[(x) + (y+2) * width];
			sum += from[(x-1) + (y) * width];
			sum += from[(x+1) + (y) * width];
			sum += from[(x) + (y-1) * width];
			sum += from[(x) + (y+1) * width];
			sum += from[(x-1) + (y-1) * width];
			sum += from[(x+1) + (y+1) * width];
			sum += from[(x+1) + (y-1) * width];
			sum += from[(x-1) + (y+1) * width];
			sum *= 1.0/6.0;
			sum -= to[(x) + (y) * width];
			
			float val = sum - sum * damping;
			val = val < 0.0 ? 0.0f : val;
			val = val > 255.0 ? 255.0f : val;
			to[x + y * width] = val;
		}
	}
}

void render(float[] from, float[] to)
{
	float	rMin = 31 / 255.0, rMax = 168 / 255.0, 
			gMin = 57 / 255.0, gMax = 224 / 255.0, 
			bMin = 116 / 255.0, bMax = 237 / 255.0;
	for(auto x = 2; x < width - 2; x++)
	{
		for(auto y = 2; y < height - 2; y++)
		{
			float color = get(from, x, y);
			
			float progress = clamp(color, 0.0, 255.0) / 255.0;
			
			auto rDelta = (rMax - rMin) / 2.0;
			auto rValue = (rMin + rDelta + rDelta * progress);
			auto gDelta = (gMax - gMin) / 2.0;
			auto gValue = (gMin + gDelta + gDelta * progress);
			auto bDelta = (bMax - bMin) / 2.0;
			auto bValue = (bMin + bDelta + bDelta * progress);
			
			to[(x + y*width) * 4 + 0] = rValue;
			to[(x + y*width) * 4 + 1] = gValue;
			to[(x + y*width) * 4 + 2] = bValue;
		}
	}
}

float[] bufA = a, bufB = b, temp;

Window main = Window("Test", 400, 300, 260, 275);

int seed = 10;
int rand()
{
	seed = seed * 1103515245 + 12345;
	return (seed / 65536) % 32768;
}

int lastTime = clock();

int randPosX = rand() % 200; randPosX = randPosX < 0 ? -randPosX : randPosX;
int randPosY = rand() % 200; randPosY = randPosY < 0 ? -randPosY : randPosY;
randPosX += 25;
randPosY += 25;
int frame = 0;

do
{
	frame++;
	randPosX = rand() % 200; randPosX = randPosX < 0 ? -randPosX : randPosX;
	randPosY = rand() % 200; randPosY = randPosY < 0 ? -randPosY : randPosY;
	randPosX += 25;
	randPosY += 25;
	for(int x = randPosX-10; x < randPosX+10; x++)
		for(int y = randPosY-10; y < randPosY+10; y++)
			set(a, x, y, 256);

	render(bufA, data);

	main.DrawCanvas(&img, -1, -1);
	
	process(bufA, bufB);
	temp = bufA;
	bufA = bufB;
	bufB = temp;

	main.Update();
	
	int time = clock() - lastTime;
	lastTime = clock();
	int fps = 1000.0 / time;
	main.SetTitle("FPS is " + fps.str());
}while(!IsPressed(VK.ESCAPE));
main.Close();

return 0;
