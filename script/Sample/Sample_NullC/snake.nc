import std.io;
import std.vector;
import std.time;
import std.random;

import win.window;
import img.canvas;
import ellipse;// : "D:/!TP/cm/script/Import/2";

enum DIR{ LEFT = 0, RIGHT, UP, DOWN }

auto FIELD_SIZE(){ return 40; }

int CELL_SIZE = 10;
 
class int2 {
    int x, y;
    
    void int2( int x, y ) 
    { 
        this.x = x; 
        this.y = y; 
    }
}
 
auto operator+=( int2 ref x, int2 y )
{
    x.x = x.x + y.x;
    x.y = x.y + y.y;
    
    return x;
}
 
int2 operator+( int2 x, y )
{
    return int2( x.x + y.x, x.y + y.y );
}
 
class Snake {   
    bool gameOver;
    
    int[FIELD_SIZE()][FIELD_SIZE()] field;
 
    vector<int2> snake;
    int headId;
    
    int2 mouseCoord;
    
    DIR _movementDir;
    
    DIR movementDir { 
        get { return _movementDir; } 
        
        set( newDir ) 
        {
            if ( int(newDir) / 2 != int(_movementDir) / 2 )
                _movementDir = newDir;
        }
    };
	
	void genMouse( );
}

void Snake:Snake( ) 
{
    gameOver = false;
    
    // Initial snake.
    for ( int i = 0; i < 8; i++ )
    {
        snake.push_back( int2( i, 0 ) );
                
        field[i][0] = 1;
    }
    
    headId = snake.size( ) - 1;
    
    _movementDir = DIR.RIGHT;
    
    genMouse( );
}
  
void Snake:genMouse( )
{
    do 
    {
        mouseCoord = int2( rand( ) % 40, rand( ) % 40 );        
    } while ( field[mouseCoord.x][mouseCoord.y] != 0 );
    
    field[mouseCoord.x][mouseCoord.y] = 2;
}
 
void Snake:update( )
{
    int2 v;
    
    switch ( _movementDir ) 
    {
        case DIR.LEFT:  v = int2( -1, 0 ); break;
        case DIR.RIGHT: v = int2( 1, 0 ); break;
        case DIR.UP:    v = int2( 0, -1 ); break;
        case DIR.DOWN:  v = int2( 0, 1 ); break;
    }
    
    int2 ref coord = &snake[headId]; // Old head.
    int2 newCoord = *coord + v; // New head.
    
    // Out of bounds.
    if ( newCoord.x < 0 || newCoord.y < 0 || newCoord.x == 40 || newCoord.y == 40 )
    {
        gameOver = true;
        return;
    }
    
    // Collision with either the snake or mice. 
    switch ( field[newCoord.x][newCoord.y] )
    {
        case 1:
            gameOver = true;
            return;
            
        case 2:
            genMouse( );
            
            snake.push_back( *coord );          
    }
    
    headId = headId == snake.size( ) - 1 ? 0 : headId + 1;
    
    coord = &snake[headId]; // Current tail.
    field[coord.x][coord.y] = 0;
    
    field[newCoord.x][newCoord.y] = 1;
    
    snake[headId] = newCoord;
}
 
void Snake:drawProp( Canvas ref canvas, int2 coord )
{
    drawEllipse( canvas, ( coord.x * CELL_SIZE ) + CELL_SIZE, ( coord.y * CELL_SIZE ) + CELL_SIZE, CELL_SIZE / 2, CELL_SIZE / 2 );
}
 
void Snake:draw( Canvas ref canvas )
{
    canvas.SetColor( 0, 0, 0 );
    
    for ( coord in snake )      
        drawProp( canvas, coord );
    
    canvas.SetColor( 255, 0, 0 );
    drawProp( canvas, mouseCoord );
}
 

float width = FIELD_SIZE() * CELL_SIZE + 10, height = FIELD_SIZE() * CELL_SIZE + 30;

Window window = Window( "NULLSnake", 100, 100, width, height );
Canvas canvas = Canvas( width, height );

Snake snake = Snake( );

double startTime = clock_precise( );
canvas.SetAA(true);

char[256] keys;
do
{
    GetKeyboardState(keys);

    canvas.SetColor( 255, 255, 255 );
    canvas.DrawRect( 0, 0, width, height );
    
    double currentTime = clock_precise( );
    
    if ( (keys['W'] | keys[VK.UP]) & 0x80 )
        snake.movementDir = DIR.UP;
    if ( (keys['A'] | keys[VK.LEFT]) & 0x80 )
        snake.movementDir = DIR.LEFT;
    if ( (keys['S'] | keys[VK.DOWN]) & 0x80 )
        snake.movementDir = DIR.DOWN;
    if ( (keys['D'] | keys[VK.RIGHT]) & 0x80 )
        snake.movementDir = DIR.RIGHT;
    
    if ( currentTime - startTime > 100 )
    { 
        snake.update( );
        startTime = currentTime;
        
        if ( snake.gameOver ) break;
    }
        
    snake.draw( canvas );
         
    window.DrawCanvas( canvas, 0, 0 );
    window.Update( );
} while(!IsPressed(VK.ESCAPE));

window.Close(); 
