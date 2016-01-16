import std.math;
import img.canvas;
import win.window;
import std.io;
import std.list;
import std.time;

//import vector2;
import ellipse;

class Edge {
	float uncompressed;
	
	void Edge( float uncompressed )
	{
		this.uncompressed = uncompressed;
	}
}

class Node;

class ConnectionPoint {
	Node ref adjacentNode;
	Edge ref edge;
	bool incident;
	
	void ConnectionPoint( Node ref adjacentNode, Edge ref edge, bool incident )
	{
		this.adjacentNode = adjacentNode;
		this.edge = edge;
		this.incident = incident;
	}
}

class Node {

	bool kinematic;
	float2 position, velocity;
	
	list< ConnectionPoint > adjacencyList;
		
	void Node( float2 ref position, bool kinematic = false )
	{
		this.kinematic = kinematic;
		velocity = float2( 0, 0 );
		this.position = *position;	
	} 
	
	void connectWith( Node ref sibling, float length = 80.0f )
	{
		Edge ref edge = new Edge( length );
		
		adjacencyList.push_back( ConnectionPoint( sibling, edge, true ) );
		sibling.adjacencyList.push_back( ConnectionPoint( this, edge, false ) );
	}
	
	void updateAndDraw( float deltaTime, Canvas ref canvas )
	{
		for ( connectionPoint in adjacencyList )
		{
			if ( connectionPoint.incident )
			{
				if ( !kinematic )
				{
					float2 springForce = position - connectionPoint.adjacentNode.position;
								
					float current = springForce.length( );
					float diff = current - connectionPoint.edge.uncompressed;
					
					springForce.normalize( );
					
					position -= springForce * diff * 0.5f * deltaTime;
					connectionPoint.adjacentNode.position += springForce * diff * 0.5f * deltaTime;
				}
			
				canvas.SetColor( 125, 55, 55 );
				canvas.DrawLine( 
					position.x, 
					position.y,
					connectionPoint.adjacentNode.position.x, 
					connectionPoint.adjacentNode.position.y );
			}
		}
		
		canvas.SetColor( 255, 55, 255 );
		drawEllipse( canvas, position.x, position.y, 10, 10 );
	}
	
}

class Springy {
	list<Node ref> nodes;
	
	Node ref controlNode;
	
	void Springy( int width, height ) 
	{
		Node ref node0 = new Node( float2( width / 2, height / 2 ) );
		Node ref node1 = new Node( float2( width / 2 + 220, height / 2 ) );
		Node ref node2 = new Node( float2( 40, 40 ) );
		
		nodes.push_back( node0 );
		nodes.push_back( node1 );	
		nodes.push_back( node2 );	
	
		node1.connectWith( node0 );
		node2.connectWith( node0 );
		
		int count = 6;		
		float step = 2 * math.pi / count, theta = 0.0f, radius = 140.0f;
		
		Node ref prevNode = nullptr, currNode, firstNode = nullptr;
		
		for ( int i = 0; i < count; i++ )
		{
			currNode = new Node( float2( width / 2 + sin( theta ) * radius, height / 2 + cos( theta ) * radius ) );
			
			nodes.push_back( currNode );
			
			if ( prevNode )
				currNode.connectWith( prevNode );

			theta += step;
			
			if ( !firstNode )
				firstNode = currNode;
			
			prevNode = currNode;
		}
		
		firstNode.connectWith( currNode );
		firstNode.connectWith( node0 );
		
		controlNode = new Node( float2( 20.0f, 20.0f ), true );
		nodes.push_back( controlNode );
		
		node0.connectWith( controlNode, 200.0f );
	}		
	
	void updateAndDraw( float deltaTime, Canvas ref canvas )
	{
		controlNode.position.y = 50.0f + sin( clock_precise( ) * 0.01f ) * 80.0f;
		
		for ( node in nodes )
		{
			node.updateAndDraw( deltaTime, canvas );
		}
	}
}

auto main( )
{
	float width = 400, height = 400;
	
	Window window = Window( "Springy", 100, 100, width, height );
	Canvas canvas = Canvas( width, height );
	
	Springy springy = Springy( width, height );
	
	auto start = clock_precise();
	int frames = 0;
	char[256] keys;
	do
	{
		frames++;

		canvas.SetColor( 255, 255, 255 );
		canvas.SetAA(true);
		canvas.DrawRect( 0, 0, width, height );
		
		springy.updateAndDraw( 0.01, canvas );

		window.DrawCanvas( canvas, 0, 0 );
		window.Update( );
		
		GetKeyboardState(keys);
	}while(!(keys[0x1B] & 0x80000000));
	window.Close();
		
	return 1000.0 / ((clock_precise() - start) / frames);
}

return main( );