@echo off
echo.
echo --------------- Copy shader files to raw ---------------------
xcopy src\raw\shader_bin ..\..\raw\shader_bin /SYI > NUL
echo.
xcopy src\raw\statemap ..\..\raw\statemap /SYI > NUL
echo.
xcopy src\raw\techniques ..\..\raw\techniques /SYI > NUL
echo.
xcopy src\raw\techsets ..\..\raw\techsets /SYI > NUL
echo.

@echo off
echo.
echo --------------- Compiling shaders --------------------
cd ..\..\raw\shader_bin
shader_tool iw3xo_mainmenu_bg
shader_tool iw3xo_mainmenu_highlight
shader_tool iw3xo_mainmenu_outline

@echo off
echo.
echo --------------------- Done ----------------------------
PAUSE