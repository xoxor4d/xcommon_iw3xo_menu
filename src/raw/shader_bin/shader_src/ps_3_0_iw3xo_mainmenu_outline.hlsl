#define PC
#define IS_VERTEX_SHADER 0
#define IS_PIXEL_SHADER 1
#include <shader_vars.h>

// our input struct ( same as in vs obv. )
struct PixelInput
{
    float4 position     : POSITION;
	float2 texcoord 	: TEXCOORD0;
	float2 menupos		: TEXCOORD1;
};

// output struct
struct PixelOutput
{
	float4 color        : COLOR;
};

float dist(float2 p0, float2 pf)
{
	return sqrt((pf.x-p0.x)*(pf.x-p0.x)+(pf.y-p0.y)*(pf.y-p0.y));
}

// main ps entry, has to return the full output struct ( 1 float4 :: color r g b a )
PixelOutput ps_main( const PixelInput pixel )
{
    // define our output struct as "fragment"
    PixelOutput fragment;

	float CIRCLE_SCALE = MENU_OUTLINE_RADIUS; //0.85;
	float brightness = MENU_OUTLINE_BRIGHTNESS;
	float aspect = 1.9;

	float2 mouse = (float2(MENU_MOUSEX,MENU_MOUSEY));
	mouse.x *= aspect; //(aspect - (1 / aspect));

	float2 position = ( ((pixel.menupos.xy / renderTargetSize.xy) * (renderTargetSize.xy)) ) + (pixel.texcoord.x * 0.0001);
	position.x *= aspect;
	position.y *= -1.0;
	position -= mouse;

	float ang = atan2(position.y, position.x);
	float dist = length(position / CIRCLE_SCALE);

	fragment.color = lerp(float4(brightness, brightness, brightness, 1.0), float4(0.0, 0.0, 0.0, 1.0), dist + 0.8);

	return fragment;
}