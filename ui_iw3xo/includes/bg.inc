#undef	FOG_SCROLL_TIME
#define FOG_SCROLL_TIME 60000 //30000

#undef	THINFOG_SCROLL_TIME
#define THINFOG_SCROLL_TIME 100000 //50000

itemDef
{
	style			WINDOW_STYLE_SHADER
	rect			FULLSCREEN_WIDE
	background		"iw3xo_mainmenu_bg"
	visible			1
	decoration
}

/* 
itemDef
{
	style			WINDOW_STYLE_SHADER
	rect			FULLSCREEN_WIDE
	background		"animbg_back"
	visible			1
	decoration
}

itemDef
{
	style			WINDOW_STYLE_SHADER
	rect			-170 0 1708 480//-107 0 1708 480
	exp				rect X((-170) - ((float(milliseconds() % FOG_SCROLL_TIME) / FOG_SCROLL_TIME) * (854)))
	background		"animbg_fogscroll"
	visible			1
	decoration
}

//
itemDef
{
	style			WINDOW_STYLE_SHADER
	rect			-107 0 1708 480
	exp				rect X((-500) - ((float(milliseconds() % FOG_SCROLL_TIME) / FOG_SCROLL_TIME) * (854)))
	background		"animbg_fogscroll"
	visible			1
	decoration
} */

//nope

/* itemDef
{
	style			WINDOW_STYLE_SHADER
	rect			-107 0 1708 480
	exp				rect X((-961) + ((float(milliseconds() % THINFOG_SCROLL_TIME) / THINFOG_SCROLL_TIME) * (854)))
	background		"animbg_fogscrollthin"
	visible			1
	decoration
} */

// Heli and what not
/* itemDef 
{
	style			WINDOW_STYLE_SHADER
	rect			FULLSCREEN_WIDE
	background		"animbg_front"
	visible			1
	decoration
} */

// soldier  yes
/* itemDef
{
	style			WINDOW_STYLE_SHADER
	rect			-180 0 1000 480//FULLSCREEN_WIDE
	background		"animbg_front2"
	visible			1
	decoration
} */