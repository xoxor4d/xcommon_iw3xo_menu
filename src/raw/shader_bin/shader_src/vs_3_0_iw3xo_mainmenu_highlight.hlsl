#define PC
#define IS_VERTEX_SHADER 1
#define IS_PIXEL_SHADER 0
#include <shader_vars.h>

// input struct
struct VertexInput
{
	float4 position : POSITION;
	float2 texcoord : TEXCOORD0;
};

// output struct
struct PixelInput
{
    float4 position	: POSITION;
	float2 texcoord	: TEXCOORD0;
	float2 menupos	: TEXCOORD1;
};

// main vs entry, has to return the full output struct
PixelInput vs_main( const VertexInput vertex ) 
{
	// define our output struct as "pixel"
	PixelInput pixel;

	pixel.position 	= mul(float4(vertex.position.xyz, 1.0f), worldViewProjectionMatrix);
	pixel.texcoord 	= vertex.texcoord;
	pixel.menupos 	= pixel.position.xy;

	return pixel;
}