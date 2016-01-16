import img.canvas;
import win.window;
import std.io;
import std.math;
import std.time;

int width = 256;
int height = 256;

float[] img = new float[width * height * 4];

double len(double x, double y, double z)
{
  return sqrt(x*x+y*y+z*z);
}

// Create light direction
double lx = 1.0, ly = -1.0, lz = 0.5;
// Normalize light direction
double llen = len(lx, ly, lz);
lx /= llen; ly /= llen; lz /= llen;

// Create light direction
double l2x = -1.0, l2y = -0.5, l2z = 0.2;
// Normalize light direction
double l2len = len(l2x, l2y, l2z);
l2x /= l2len; l2y /= l2len; l2z /= l2len;

// Create light direction
double l3x = 0.0, l3y = 1.0, l3z = 1.0;
// Normalize light direction
double l3len = len(l3x, l3y, l3z);
l3x /= l3len; l3y /= l3len; l3z /= l3len;

double dx, dy, dz;
double cx, cy, cz;
double udz;
int start = clock();

void render()
{
	// Draw sphere
	for(int y = 0; y < 256; y++)
	{
		for(int x = 0; x < 256; x++)
		{
			// Calculate normal
			dx = (x-128)/128.0; dy = (y-128)/128.0;
			udz = sqrt(1.0-(dx*dx+dy*dy));
			
			if(udz > 0.0)
			{
				dz = clamp(udz, 0.0, 1.0);
				// Calculate toCamera vector
				cx = -dx; cy = -dy; cz = -1.0-dz;
				double clen = len(cx, cy, cz);
				cx /= clen; cy /= clen; cz /= clen;
				
				// Calculate diffuse
				double diffuse = saturate(dx*lx+dy*ly+dz*lz);
				double diffuse2 = saturate(dx*l2x+dy*l2y+dz*l2z);
				double diffuse3 = saturate(dx*l3x+dy*l3y+dz*l3z);
				
				// Reflect tolight with normal
				double rx = lx-2*diffuse*dx, ry = ly-2*diffuse*dy, rz = lz-2*diffuse*dz;
				double r2x = l2x-2*diffuse2*dx, r2y = l2y-2*diffuse2*dy, r2z = l2z-2*diffuse2*dz;
				double r3x = l3x-2*diffuse3*dx, r3y = l3y-2*diffuse3*dy, r3z = l3z-2*diffuse3*dz;
				
				// Calculate specular
				double spec = saturate(rx*cx+ry*cy+rz*cz)**8.0;
				double spec2 = saturate(r2x*cx+r2y*cy+r2z*cz)**8.0;
				double spec3 = saturate(r3x*cx+r3y*cy+r3z*cz)**8.0;
				
				double smooth = saturate(abs(udz)*10.0);
				
				double combined = saturate(diffuse*0.7+spec*0.5);
				double combined2 = saturate(diffuse2*0.7+spec2*0.5);
				double combined3 = saturate(diffuse3*0.7+spec3*0.5);
				
				img[(x+y*width)*4 + 0] = combined2*smooth;
				img[(x+y*width)*4 + 1] = combined*smooth;
				img[(x+y*width)*4 + 2] = combined3*smooth;
			}
		}
	}
}

int time = clock() - start;

Canvas canvas = Canvas(width, height);
float[] data = canvas.GetData();

void update()
{
	for(int i = 0; i < 256 * 256 * 4; i++)
		data[i] = img[i];
}
Window main = Window("Test", 400, 300, 260, 275);

int lastTime = clock();

do
{
	lx = cos(clock()*0.001);
	ly = sin(clock()*0.001);
	llen = len(lx, ly, lz);
	lx /= llen; ly /= llen; lz /= llen;
	
	l2x = cos(clock()*0.001 + 2);
	l2y = sin(clock()*0.001 + 2);
	l2len = len(l2x, l2y, l2z);
	l2x /= l2len; l2y /= l2len; l2z /= l2len;

	render();
	update();

	main.DrawCanvas(&canvas, 0, 0);
	main.Update();
	
	time = clock() - lastTime;
	lastTime = clock();
	int fps = 1000.0 / time;
	main.SetTitle("FPS is " + fps.str());
}while(!IsPressed(VK.ESCAPE));
main.Close();

return time;