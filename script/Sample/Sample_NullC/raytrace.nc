// forked from keim_at_Si's Real Time Ray Tracing
import img.canvas;
import win.window;
import std.time;
import std.io;
import std.math;

double time = clock();

// parameters, you can modify them.
int size = 300;
double ambient = 0.1;
double diffusion = 0.7;
double specular = 0.6;
double power = 12;

int width = size;
int height = size;

Window main = Window("Raytrace example", 400, 300, width + 4, height + 20);

class Material
{
    int[513] lmap;
    void Material(int col, double amb, double dif)
	{
        int i, r = col >> 16, g = (col >> 8) & 255, b = col & 255;
		double a;
        for(i = 0; i < 512; i++)
		{
            a = ((i < 256) ? amb : ((((i-256) * (dif - amb)) * 0.00390625) + amb)) * 2;
            if (a<1) lmap[i] = (int(r*a)<<16)|(int(g*a)<<8)|(int(b*a)<<0);
            else lmap[i] = (int(255-(255-r)*(2-a))<<16)|(int(255-(255-g)*(2-a))<<8)|(int((255-(255-b)*(2-a)))<<0);
        }
    }
}

class Sphere
{
    double x, y, z, r2;
	Material ref mat;
    double cx, cy, cz, cr, omg, pha;
    void Sphere(double cx, cy, cz, cr, omg, pha, r, Material ref mat)
	{
        this.cx = cx;
        this.cy = cy;
        this.cz = cz;
        this.cr = cr;
        this.omg = omg;
        this.pha = pha;
        this.r2 = r * r;
        this.mat = mat;
    }
    void update()
	{
        double ang = time * omg + pha;
        x = cos(ang)*cr+cx;
        y = cy;
        z = sin(ang)*cr+cz;
    }
}

class SphereNode
{
	Sphere ref sphere;
	SphereNode ref next;
	
	void SphereNode(Sphere ref sphere)
	{
		this.sphere = sphere;
	}
}
auto SphereNode:add(Sphere ref sphere)
{
	next = new SphereNode;
	next.SphereNode(sphere);
	return next;
}
	
double focusZ = size;
double floorY = 100;
Canvas screen = Canvas(width, height);
double[] initialDir = new double[size*size*3];
SphereNode ref firstSphere, lastSphere;
float3 ldir = float3(0, 0, 0);
float3 light = float3(100,100,100);
int[513] smap;
int[1024] fcol;
auto refs = {0, 1, 2, 3, 3};
auto reff = {0xffffff, 0x7f7f7f, 0x3f3f3f, 0x1f1f1f, 0x1f1f1f};
double mx, my, camX, camY, camZ, tcamX, tcamY, tcamZ;
float[] pixels = screen.GetData();

void setup()
{
    int i, j, idx;
	double l;
	int s;
	double hs = (size - 1) * 0.5;
    for({j=0;idx=0;}; j<size; j++)
	{
		for (i=0; i<size; i++)
		{
	        l = 1/sqrt((i - hs)*(i - hs) + (j - hs)*(j - hs) + focusZ*focusZ);
	        initialDir[idx] = (i-hs) * l; assert(initialDir[idx] <= 1.0); idx++;
	        initialDir[idx] = (j-hs) * l; assert(initialDir[idx] <= 1.0); idx++;
	        initialDir[idx] = focusZ   * l; assert(initialDir[idx] <= 1.0); idx++;
			
	    }
	}
    for (i=0; i<512; i++) {
        s = (i<256) ? 64 : int((((i-256) * 0.00390625) ** power) * (power + 2) * specular * 0.15915494309189534 * 192 + 64);
        if (s > 255) s = 255;
        smap[i] = 0x10101 * s;
        s = (i<256) ? (255-i) : (i-256);
        fcol[i] = 0x10101 * (s - (s>>3) + 31);
        fcol[i+512] = 0x10101 * ((s>>2) - (s>>5) + 31);
    }
	
	firstSphere = new SphereNode;
	firstSphere.SphereNode(new Sphere(100, 40, 600, 200, 0.3, 1.0, 60, new Material(0x8080ff,ambient,diffusion)));
	firstSphere.add(new Sphere(  0, 50, 300, 100, 0.8, 0.8, 50, new Material(0x80ff80,ambient,diffusion)))
	.add(new Sphere( 50, 60, 200, 200, 0.6, 2.0, 40, new Material(0xff8080,ambient,diffusion)))
	.add(new Sphere(-50, 70, 500, 300, 0.4, 1.4, 30, new Material(0xc0c080,ambient,diffusion)))
	.add(new Sphere(-90, 30, 600, 400, 0.2, 1.5, 70, new Material(0xc080c0,ambient,diffusion)))
	.add(new Sphere( 70, 80, 400, 100, 0.7, 1.2, 20, new Material(0x80c0c0,ambient,diffusion)));
	
    camX = camY = camZ = tcamX = tcamY = tcamZ = 0;
}

void draw()
{
    int i, j, k, l, idx;
	double t, tmin, n;
	Sphere ref s;
    int    ln, pixel;
	Sphere ref hit;
	int a, kmax;
    double     ox, oy, oz, dx, dy, dz, nx, ny, nz, dsx, dsy, dsz, B, C, D;
    light.x = cos(time*0.6)*100;
    light.y = sin(time*1.1)*25+100;
    light.z = sin(time*0.9)*100-100;
    ldir.x = -light.x;
    ldir.y = -light.y;
    ldir.z = -light.z;
    ldir.normalize();
    
    tcamX = mx * 400;
    tcamY = my * 150 - 50;
    tcamZ = my * 400 - 200;
    camX += (tcamX - camX) * 0.02;
    camY += (tcamY - camY) * 0.02;
    camZ += (tcamZ - camZ) * 0.02;

    auto sphereNode = firstSphere;
    while ( sphereNode ) {
    		sphereNode.sphere.update();
    		sphereNode = sphereNode.next;
    	}
    
    int pos = 0;
    for ({j=0;idx=0;}; j<size; ++j) {
        for (i=0; i<size; ++i) {
            ox = camX;
            oy = camY;
            oz = camZ;
            dx = initialDir[idx]; idx++;
            dy = initialDir[idx]; idx++;
            dz = initialDir[idx]; idx++;
            
            pixel = 0;
            for (l=1; l<5; l++) {
                tmin = 99999;
                hit = nullptr;
                sphereNode = firstSphere;
                while( sphereNode ) {
                    s = sphereNode.sphere;
                    dsx = ox - s.x;
                    dsy = oy - s.y;
                    dsz = oz - s.z;
                    B = dsx * dx + dsy * dy + dsz * dz;
                    C = dsx * dsx + dsy * dsy + dsz * dsz - s.r2;
                    D = B * B - C;
                    if (D > 0) {
                        t = - B - sqrt(D);
                        if ((t > 0) && (t < tmin)) {
                            tmin = t;
                            hit = s;
                        }
                    }
                    sphereNode = sphereNode.next;
                }

                if (hit) {
                    ox += dx * tmin;
                    oy += dy * tmin;
                    oz += dz * tmin;
                    nx = ox - hit.x;
                    ny = oy - hit.y;
                    nz = oz - hit.z;
                    n = 1 / sqrt(nx*nx + ny*ny + nz*nz);
                    nx *= n;
                    ny *= n;
                    nz *= n;
                    n = -(nx*dx + ny*dy + nz*dz) * 2;
                    dx += nx * n;
                    dy += ny * n;
                    dz += nz * n;
                    ln = int((ldir.x * nx + ldir.y * ny + ldir.z * nz) * 255) + 256;
                    a = hit.mat.lmap[ln];
                    a = a >> refs[l];
                    a = a & reff[l];
                    pixel += a;
                } else {
                    if (dy < 0) {
                        ln = int((ldir.x * dx + ldir.y * dy + ldir.z * dz) * 255) + 256;
						assert(ln < 513);
                        a = smap[ln];
                        ln = l - 1;
                        a = a >> refs[ln];
                        a = a & reff[ln];
                        pixel += a;
                        break;
                    } else {
                        tmin = (floorY-oy)/dy;
                        ox += dx * tmin;
                        oy += dy * tmin;
                        oz += dz * tmin;
                        dy = -dy;
                        ln = dy * 256 + ((((int(ox+oz)>>7)+(int(ox-oz)>>7))&1)<<9) + 256;
                        a = fcol[ln];
                        a = a >> refs[l];
                        a = a & reff[l];
                        pixel += a;
                    }
                }
            }
            
            pixels[pos * 4 + 0] = ((pixel >> 16) & 0xff) / 255.0;
			pixels[pos * 4 + 1] = ((pixel >> 8) & 0xff) / 255.0;
			pixels[pos * 4 + 2] = ((pixel) & 0xff) / 255.0;
            ++pos;
        }
    }
}

setup();

double lastTime = clock();

do
{
	// Draw
	int mouseX, mouseY;
	GetMouseState(mouseX, mouseY);
	mx = (mouseX - 232.5) * 0.00390625;
    my = (232.5 - mouseY) * 0.00390625;
	time = clock() * 0.001;
	draw();

	main.DrawCanvas(&screen, -1, -1);
	
	time = clock_precise() - lastTime;
	lastTime = clock_precise();
	int fps = 1000.0 / time;
	main.SetTitle("FPS is " + fps.str());
	main.Update();
}while(!IsPressed(VK.ESCAPE));
main.Close();

return 0;
