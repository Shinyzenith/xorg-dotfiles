/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int centered = 0;  /*use the -c flag to get it to center*/
static int min_width = 750;
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"NotoMonoRegular:bold:pixelsize=15"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#eceff4", "#2e3440" },
	[SchemeSel] = { "#eceff4", "#5E81AC" },
	[SchemeOut] = { "#eceff4", "#8FBCBB" },
	[SchemeSelHighlight] = {"#B48EAD","#1d2021"},
	[SchemeNormHighlight] = {"#2E3440","#81A1C1"},
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
static unsigned int lineheight = 0;
static unsigned int min_lineheight = 8;
/* Size of the window border */
static const unsigned int border_width = 3;
