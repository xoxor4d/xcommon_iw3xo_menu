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
	bool is_rtx_active = filterTap[4][0] == 1.0f;

	float3 wcol = float3(0.05f, 0.3f, 0.5f);
	if (is_rtx_active)
	{
		wcol = float3(0.43f, 0.94f, 0.0f);
	}

    for ( int i = 0; i < 4; i++ )
    {
		float h; 

		if (is_rtx_active)
		{
			h = float(i) / 2.705f;
		}
		else
		{
			h = float(i) / 3.0f;
		}

        float of = -0.4f - 0.4f * h + (0.5f + 0.5f * h) * 0.1f * sin((4.0f - h * 2.0f) * p.x + 30.0f * h - 2.5f * t * (1.0f + 2.0f * h));
        float dof = 0.25f;
		col = lerp( col, wcol * (1.0f - 0.9f * h), 1.0f - smoothstep(-px * dof, px * dof, p.y - of) );
    }

    return col;
}

float3 background( in float2 p )
{
	return float3(0.05f, 0.3f, 0.5f) * 0.9f + p.y * 0.11f;
}

PixelOutput ps_main( const PixelInput pixel )
{
    PixelOutput fragment;
	
	float2 mouse = float2(MENU_MOUSEX, MENU_MOUSEY);
	float  time  = MENU_TIME;

    float2 uv = float2(pixel.texcoord.x * 2.0f - 1.0f, pixel.texcoord.y - 1.25f);
           uv *= 2.0f;
	
	float2 p = uv;
    float px = 2.0f / renderTargetSize.y - clamp(((mouse.y - 1.0f) * 0.025f), -1.0f, 0.0f);
    
    float ani = time * 0.2f;

    // draw
    float3 col = background( p );
           col = seafloor( col, p, px, ani );
         
    // vignetting
	col *= 1.0f - 0.1f * dot(p, p);
    
    // gamma
    col = sqrt(col);
    
	fragment.color = float4(col, 1.0f);
	fragment.color.a = 1.0f;

	return fragment;
}