#ifndef CONTENT_TITLE
#define CONTENT_TITLE "UNNAMED"
#endif
     
        /***********************************************\
        |* Content | Background
        \***********************************************/
        
        itemDef
        {
            name                        "content"
            rect                        (-660 * 0.5) 0 660 392 HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_SUBTOP
            origin                      0 16
            style                       WINDOW_STYLE_FILLED
            backcolor                   1 1 1 0.03 // 0.03
            forecolor                   1 1 1 1 
            visible                     1
            decoration
        }


        /***********************************************\
        |* Content | Title
        \***********************************************/

        itemDef
        {
            name                        "content_title"
            rect                        (-660 * 0.5) 0 660 24 HORIZONTAL_ALIGN_CENTER VERTICAL_ALIGN_SUBTOP
            origin                      0 16
            style                       WINDOW_STYLE_FILLED
            borderSize                  0
            foreColor                   1 1 1 1
            backColor                   1 1 1 0.02
            borderColor                 1 1 1 1
            outlineColor                0 0 0 0
            exp                         text ( CONTENT_TITLE ); // @MENU_GAME_OPTIONS
            textFont                    UI_FONT_NORMAL
            textAlign                   ITEM_ALIGN_MIDDLE_LEFT
            textAlignX                  10
            textScale                   0.20
            visible                     1          
            decoration                
        }