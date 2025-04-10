/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 4;        /* border pixel of windows */
static const unsigned int gappx     = 10;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
/*static const char *fonts[]          = { "monospace:size=10" };*/
/*static const char dmenufont[]       = { "monospace:size=10" };*/
static const char *fonts[]          = { "Meslo Nerd Font:size=14", "JetBrainsMono Nerd Font:size=14" };
static const char dmenufont[]       = "Meslo Nerd Font:size=14";
static const char col_gray1[]       = "#00141d";
static const char col_gray2[]       = "#80bfff";
static const char col_gray3[]       = "#FFFFFF";
static const char col_gray4[]       = "#1a1a1a";
static const char col_cyan[]        = "#b3e5fc";
static const char col_barbie[]      = "#4fc3f7";
static const char *colors[][3]      = {
  /*               fg         bg         border   */
  [SchemeNorm] = { col_gray3, col_gray1, col_gray4 },
  [SchemeSel]  = { col_gray4, col_cyan,  col_barbie  },
};


/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12" };

static const Rule rules[] = {
/* xprop(1):
 *  WM_CLASS(STRING) = instance, class
 *  WM_NAME(STRING) = title
 */
/* class            instance    title       tags mask     isfloating   monitor */
{ "brave-browser",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "kitty", NULL };
static const char *browsercmd[]  = { "brave", "--password-store=basic", NULL };

#include "movestack.c"
static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	/*{ MODKEY,                       XK_b,      spawn,          {.v = browsercmd } },*/
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },

	{ MODKEY|ControlMask,           XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_Right,  focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_Left,   focusstack,     {.i = -1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_Tab,    incnmaster,     {.i = +1 } },
	{ MODKEY|Mod1Mask,              XK_Tab,    incnmaster,     {.i = -1 } },
	{ MODKEY|ControlMask,           XK_Left,   setmfact,       {.f = -0.05} },
	{ MODKEY|ControlMask,           XK_Right,  setmfact,       {.f = +0.05} },

	{ MODKEY|ShiftMask,             XK_Right,  movestack,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_Left,   movestack,      {.i = -1 } },
	{ MODKEY,                       XK_z,      zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ ControlMask|ShiftMask,        XK_1,      setlayout,      {.v = &layouts[0]} },
	{ ControlMask|ShiftMask,        XK_2,      setlayout,      {.v = &layouts[1]} },
	{ ControlMask|ShiftMask,        XK_3,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ShiftMask,             XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },

	{ ControlMask|ShiftMask,        XK_Left,   viewtoleft,     {0} },
	{ ControlMask|ShiftMask,        XK_Right,  viewtoright,    {0} },
	{ Mod1Mask|ControlMask,         XK_Left,   tagtoleft,      {0} },
	{ Mod1Mask|ControlMask,         XK_Right,  tagtoright,     {0} },

	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_period, tagmon,         {.i = +1 } },

	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },

	{ MODKEY,                       XK_minus,  setgaps,        {.i = -1 } },
	{ MODKEY,                       XK_equal,  setgaps,        {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_equal,  setgaps,        {.i = 0  } },

	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	TAGKEYS(                        XK_0,                      9)
	TAGKEYS(                        XK_minus,                  10)
	TAGKEYS(                        XK_equal,                  11)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

