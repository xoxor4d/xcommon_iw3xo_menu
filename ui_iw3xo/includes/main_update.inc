    itemDef
    {
        name        				"content_container"
        rect        				-300 0 600 380 HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_SUBTOP
        origin      				0 60
        style       				1
        backcolor   				1 1 1 0.02
        visible						when ( !localvarint( "ui_maincontent_update" ) == 1 )  
        decoration
    }

    itemDef
    {
        name                        "update_title"
        rect                        -300 0 600 25 HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_SUBTOP
        origin                      0 60
        style                       WINDOW_STYLE_FILLED
        borderSize                  0
        foreColor                   1 1 1 1
        backColor                   1 1 1 0.02
        borderColor                 1 1 1 1
        outlineColor                0 0 0 0
		textstyle 					ITEM_TEXTSTYLE_SHADOWED
        exp							text(dvarstring(ui_changelog_title));
        textFont                    UI_FONT_BIG
        textAlign                   ITEM_ALIGN_MIDDLE_LEFT
        textAlignX                  10
        textScale                   0.25
        visible						when ( !localvarint( "ui_maincontent_update" ) == 1 )         
        decoration                
    }

    // string-dvar char limit ...
     itemDef
    {
        name                        "update_content"
        rect                        -300 0 600 25 HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_SUBTOP
        origin                      0 85
        style                       WINDOW_STYLE_FILLED
        borderSize                  0
        foreColor                   1 1 1 1
        backColor                   1 1 1 0.0
        borderColor                 1 1 1 1
        outlineColor                0 0 0 0
        textstyle                   ITEM_TEXTSTYLE_SHADOWED
        exp                         text("huh, so empty. Please fill me up, daddy, please.")//text(dvarstring(ui_changelog));
        textFont                    UI_FONT_BIG
        textAlign                   ITEM_ALIGN_MIDDLE_LEFT
        textAlignX                  10
        textScale                   0.25
        visible                     when ( !localvarint( "ui_maincontent_update" ) == 1 )         
        decoration                
    }

/*     itemDef
    {   
        name                        "sep_line"
        rect                        -295 0 590 1 HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_SUBTOP
        origin                      0 410
        style                       1
        backcolor                   1 1 1 0.1
        visible                     when ( !localvarint( "ui_maincontent_update" ) == 1 )   
        decoration
    } */

    // --------------------------------------------

    itemDef
    {
        name                        "update_button"
        text                        "Reload menu"
        style                       WINDOW_STYLE_FILLED
        border                      WINDOW_BORDER_FULL
        borderSize                  0
        background                  iw3xo_mainmenu_highlight
        foreColor                   1 1 1 0.8
        backcolor                   0 0 0 0.01
        borderColor                 0 0 0 0.05
        outlineColor                0 0 0 0
        type                        1
        rect                        0 0 80 25 HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_SUBTOP
        origin                      221 60
        style                       1
        textfont                    UI_FONT_BIG
        textscale                   0.24
        textalign                   1
        textaligny                  17
        textstyle                   3
        mouseEnter                  {play "mouse_over";}
        mouseExit                   {}
        action                      
        {
            play "mouse_click";
            execnow "loadzone xcommon_iw3xo_menu";
        }
        visible                     when ( !localvarint( "ui_maincontent_update" ) == 1 )
    }

    // --------------------------------------------

    itemDef
    {
        name                        "github_button"
        text                        "Github Project"
        style                       WINDOW_STYLE_FILLED
        border                      WINDOW_BORDER_FULL
        borderSize                  0
        background                  iw3xo_mainmenu_highlight
        foreColor                   1 1 1 0.8
        backcolor                   0 0 0 0.01
        borderColor                 0 0 0 0.05
        outlineColor                0 0 0 0
        type                        1
        rect                        0 0 80 25 HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_SUBTOP
        origin                      141 60
        style                       1
        textfont                    UI_FONT_BIG
        textscale                   0.24
        textalign                   1
        textaligny                  17
        textstyle                   3
        mouseEnter                  {play "mouse_over";}
        mouseExit                   {}
        action                      
        {
            play "mouse_click";
            execnow "iw3xo_github"; // QuickPatch.cpp
        }
        visible                     when ( !localvarint( "ui_maincontent_update" ) == 1 )
    }

    // --------------------------------------------

/*     itemDef
    {
        name                        "uiScriptTest"
        text                        "Test UI Script Addon"
        style                       WINDOW_STYLE_FILLED
        border                      WINDOW_BORDER_FULL
        borderSize                  0
        background                  iw3xo_mainmenu_highlight
        foreColor                   1 1 1 1
        outlineColor                0 0 0 0
        type                        1
        rect                        0 0 80 19 HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_SUBTOP
        origin                      -39 153
        style                       1
        textfont                    1
        textscale                   0.20
        textalign                   1
        textaligny                  14
        forecolor                   1 1 1 1
        backcolor                   1 1 1 0
        borderColor                 1 1 1 0.1
        outlineColor                0 0 0 0
        textstyle                   3
        mouseEnter                  {play "mouse_over";}
        mouseExit                   {}
        action                      
        {
            play "mouse_click";
            uiScript StartServerCustom
        }
        visible                     when ( !localvarint( "ui_maincontent_update" ) == 1 )
    } */