//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "ln=$(date +%d | sed -r 's/.*(.)/\\1/'); [[ $ln = 1 ]] && suf=st ; [[ $ln = 2 ]] && suf=nd ; [[ $ln = 3 ]] && suf=rd; [[ -z $suf ]] && suf=th; date \"+%a, %b %-d$suf %-I:%M;\"",	2,	0},
//	{"  ",  "iwctl station wlan0 show | sed '/Connected/!d; s/^.\\{32\\}//; s/ *$//'",        60,     9},
	{"", "battery",    30,     10},
        {"", "getvolume",       0,      11},
//	{"", "barweather", 1200, 0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = "|";
static unsigned int delimLen = 3;
