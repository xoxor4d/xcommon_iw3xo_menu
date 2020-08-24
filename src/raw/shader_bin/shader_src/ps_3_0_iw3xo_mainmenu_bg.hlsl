// * based on https://www.shadertoy.com/view/3t2SzW

#define PC
#define IS_VERTEX_SHADER 0
#define IS_PIXEL_SHADER 1
#include <shader_vars.h>

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

float3 seafloor( in float3 col, in float2 p, in float px, in float t )
{
    for( int i = 0; i < 4; i++ )
    {
        float h = float(i) / 3.0;
        float of = -0.4 - 0.4 * h + (0.5 + 0.5 * h) * 0.1 * sin((4.0 - h * 2.0) * p.x + 30.0 * h - 2.5 * t * (1.0 + 2.0 * h));
        float dof = 2.0;
		col = lerp( col, float3(0.05, 0.3, 0.5) * (1.0 - 0.9 * h), 1.0 - smoothstep(-px * dof, px * dof, p.y - of) );
    }

    return col;
}

float3 background( in float2 p )
{
    return float3(0.05, 0.3, 0.5) * 0.9 + p.y * 0.11;
}

PixelOutput ps_main( const PixelInput pixel )
{
    PixelOutput fragment;
	
	float2 mouse = float2(MENU_MOUSEX, MENU_MOUSEY);
	float  time  = MENU_TIME;

    float2 uv = float2(pixel.texcoord.x * 2.0 - 1., pixel.texcoord.y - 1.25);
           uv *= 2.0;
	
	float2 p = uv;
    float px = 2.0 / renderTargetSize.y - clamp(((mouse.y - 1.0) * 0.025), -1.0, 0.0);
    
    float ani = time * 0.2;

    // draw
    float3 col = background( p );
           col = seafloor( col, p, px, ani );
         
    // vignetting
	col *= 1.0 - 0.1 * dot(p, p);
    
    // gamma
    col = sqrt(col);
    
	fragment.color = float4(col, 1.0);
	fragment.color.a = 1.0;

	return fragment;
}