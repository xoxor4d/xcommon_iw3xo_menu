// * http://glslsandbox.com/e#69730.0

#define PC
#define IS_VERTEX_SHADER 0
#define IS_PIXEL_SHADER 1
#include <shader_vars.h>

// our input struct ( same as in vs obv. )
struct PixelInput
{
    float4 position 	: POSITION;
	float2 menupos		: TEXCOORD0;
};

// output struct
struct PixelOutput
{
	float4 color        : COLOR;
};

#define UI_EYES_X   	filterTap[5][0]
#define UI_EYES_Y   	filterTap[5][1]
#define UI_EYES_SIZE   	filterTap[5][2]
#define UI_EYES_ALPHA   filterTap[5][3]

PixelOutput ps_main( const PixelInput pixel )
{
    PixelOutput fragment;
	
	float2 mouse, t, m;
	float  c, e, b;

	mouse = float2(MENU_MOUSEX * 0.5f + 0.5f, MENU_MOUSEY * 0.5f + 0.5f);

    e = UI_EYES_SIZE * renderTargetSize.x;   					// eye size relative to screen
	b = e * 0.35;                     							// pupil size relative to eye size
	m = float2(UI_EYES_X, UI_EYES_Y) * renderTargetSize.xy; 	// position of eyes 
	m.x += ((pixel.menupos.x < m.x) ? -e : e) * 1.05f; 			// 1.05 for a gap between eyes
	
	t = mouse * renderTargetSize.xy - m;
	m -= pixel.menupos;

    c = min(e - length(m), length(m + t / max(2.0f, length(t) / (e - b))) - b);
	fragment.color = float4(c, c, c, UI_EYES_ALPHA);

	return fragment;
}