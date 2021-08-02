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
	[SchemeNorm] = { "#d79921", "#1d2021" },
	[SchemeSel] = { "#1d2021", "#d79921" },
	[SchemeOut] = { "#cc241d", "#cc241d" },
	[SchemeSelHighlight] = {"#83a598","#1d2021"},
	[SchemeNormHighlight] = {"#8ec07c","#222222"},
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
