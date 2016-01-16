import img.canvas;
import win.window;
import std.time;
import std.io;
import std.math;
import std.random;

float width = 400, height = 400;
	
Window window = Window( "Attraction", 200, 200, width+30, height+40 );
Canvas canvas = Canvas( width, height );

int count = 100;

class Point
{
	float3 col;
	float2 pt;
	float2 vel;
}

auto pts = new Point[count], pts2 = new Point[count];

Point[] ref curr = &pts, next = &pts2;

void GenPoints()
{
	for(i in pts, j in pts2)
	{
		i.col = float3(rand() % 255, rand() % 255, rand() % 255);
		i.pt = float2(rand() % 400, rand() % 400);
		i.vel = float2((rand() % 100 - 50) / 10.0, (rand() % 100 - 50) / 10.0);

		j = i;
	}
}

void UpdatePoints()
{
	for(int i = 0; i < pts.size; i++)
	{
		next[i] = curr[i];
		for(int j = 0; j < pts.size; j++)
		{
			if(i == j)
				continue;
			float2 diff = curr[i].pt - curr[j].pt;
			next[i].vel -= diff / clamp(dot(diff, diff), 100.0, 1000000.0);
		}

		next[i].pt += next[i].vel * 0.1;

		if(next[i].pt.x < -100 || next[i].pt.x > 500)
			next[i].vel.x = -next[i].vel.x;
		if(next[i].pt.y < -100 || next[i].pt.y > 500)
			next[i].vel.y = -next[i].vel.y;
	}

	Point[] ref tmp = curr;
	curr = next;
	next = tmp;
}
void DrawPoints(Canvas ref c)
{
	for(i in *curr, j in *next)
	{
		c.SetColor(i.col.x, i.col.y, i.col.z);
		c.DrawLine(j.pt.x, j.pt.y, i.pt.x, i.pt.y);
	}
}

GenPoints();
canvas.SetColor( 255, 255, 255 );
canvas.DrawRect( 0, 0, width, height );

auto start = clock_precise();
int frames = 0;
do
{
	frames++;
	
	canvas.SetColor( 255, 255, 255 );
	canvas.DrawRect( 0, 0, width, height, 0.5 );

	canvas.SetAA(true);
	
	UpdatePoints();
	DrawPoints(canvas);

	window.DrawCanvas( canvas, 10, 10 );
	window.Update( );
}while(!IsPressed(VK.ESCAPE));
window.Close();

io.out << "Started at " << start << io.endl;
io.out << "Now it's " << clock_precise() << io.endl;
io.out << "Time elapsed: " << clock_precise() - start << io.endl;
io.out << "Drawn " << frames << " frames" << io.endl;
io.out << "FPS: " << 1000.0 / ((clock_precise() - start) / frames) << io.endl;

return 1000.0 / ((clock_precise() - start) / frames);
