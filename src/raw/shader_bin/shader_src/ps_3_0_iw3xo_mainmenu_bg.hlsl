#define PC
#define IS_VERTEX_SHADER 0
#define IS_PIXEL_SHADER 1
#include <shader_vars.h>

#define LINES 5.0
#define BRIGHTNESS 1.8

// our input struct ( same as in vs obv. )
struct PixelInput
{
    float4 position 	: POSITION;
	float2 texcoord 	: TEXCOORD0;
};

// output struct
struct PixelOutput
{
	float4 color        : COLOR;
};

#define FULLSCEEN_ULTRAWIDE     1200.0

// http://glslsandbox.com/e#56548.0
// main ps entry, has to return the full output struct ( 1 float4 :: color r g b a )
PixelOutput ps_main( const PixelInput pixel )
{
    // define our output struct as "fragment"
    PixelOutput fragment;
	
	float2 mouse = float2(MENU_MOUSEX, MENU_MOUSEY);
	float time = MENU_TIME;

	float3 ORANGE = float3(0.4, 0.8, 0.3);
	float3 BLUE = float3(0.8, 0.8, 0.0);
	float3 GREEN = float3(0.0, 0.0, 0.0);
	float3 RED = float3(0.0, 0.0, 0.0);
	float3 BACKGROUND = float3(1.8, 0.35, 0.295);

	float x, y, xpos, ypos;
	float t = MENU_TIME * 2.0;
	float3 c = float3(0.0, 0.0, 0.0);
	
	xpos = pixel.texcoord.x;
	ypos = pixel.texcoord.y * -1.0f + 1.0f;
	
	x = xpos * (1.255);
	for (float i = 0.0; i < LINES; i += 1.0) 
	{
		y = ypos + (
			0.200 * sin(x * 5.000 + i * 0.4 + t * 0.050) * (mouse.y * 0.5)
		+ 0.100 * cos(x * 16.350 + i * 0.7 + t * 0.250) * (mouse.x * 0.5)
		+ 0.084 * sin(x * (FULLSCEEN_ULTRAWIDE) * 2.5 + i * 0.8 + t * 0.134) // renderTargetSize.x
		+ 0.800
		);
		
		float temp = 1.0 - pow( clamp((1.0 - y) * 20.0, 0.0, 1.0), 0.5 + (cos(t * 0.223) + 1.0) * 3.0 );
		c += float3(temp,temp,temp) * 0.5;
	}
	
	c *= lerp( lerp(ORANGE, BLUE, xpos)
				,lerp(GREEN, ORANGE, ypos)
				,(sin(t * 0.02) + 1.0) * 0.20
	) * BRIGHTNESS;
	
	fragment.color = float4(1.0, 1.0, 1.0, 1.0) - float4(c, 1.0);
	fragment.color *= float4(BACKGROUND, 1.0);
	fragment.color.a = 1.0;

	return fragment;
}