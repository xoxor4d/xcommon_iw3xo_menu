        CREATESERVER_BTN_VIS( 	11, "@MPUI_RULES_TIME_LIMIT", 
								"scr_war_timelimit", 
								{ 
									"@MPUI_RULES_UNLIMITED" 0 "@MPUI_RULES_5MINUTES" 5 "@MPUI_RULES_10MINUTES" 10 "@MPUI_RULES_20MINUTES" 20 "@MPUI_RULES_30MINUTES" 30
								}, 
								play "mouse_click", 
								when( dvarstring( ui_netGametypeName ) == "war" ) ;)

		CREATESERVER_BTN_VIS( 	12, "@MPUI_RULES_SCORE_LIMIT", 
								"scr_war_scorelimit", 
								{ 
									"@MPUI_RULES_UNLIMITED" 0 "@MPUI_RULES_250POINTS" 250 "@MPUI_RULES_500POINTS" 500  "@MPUI_RULES_750POINTS" 750 "@MPUI_RULES_1000POINTS" 1000 "@MPUI_RULES_1500POINTS" 1500
								}, 
								play "mouse_click",
								when( dvarstring( ui_netGametypeName ) == "war" ) ;)