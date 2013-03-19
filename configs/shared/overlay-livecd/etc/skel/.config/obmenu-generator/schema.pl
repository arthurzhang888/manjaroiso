#!/usr/bin/perl

# SCHEMA supports the following keys: item, cat, begin_cat, end_cat,
#                                     exit, raw, sep, obgenmenu

# Modified by the Manjaro Team, 16th March 2013.
# Note: ~/.xinitrc commands will have been used to update the absolute paths
# used in this schema.

=for comment

item: add an item into the menu
{item => ["command", "label", "icon"]}

cat: add a category into the menu
{cat => ["name", "label", "icon"]}

begin_cat: begin of a category
{begin_cat => ["name", "icon"]}

end_cat: end of a category
{end_cat => undef}

sep: menu line separator
{sep => undef} or {sep => "label"}

exit: default "Exit" action
{exit => ["label", "icon"]}

raw: any valid Openbox XML string
{raw => q(xml string)},

obgenmenu: category provided by obmenu-generator
{obgenmenu => "label"}

scripts: executable scripts from a directory
{scripts => ["/my/dir", BOOL, "icon"]}
BOOL - can be either true or false (1 or 0)
0 == open the script in background
1 == open the script in a new terminal

wine_apps: windows applications installed via wine
{wine_apps => ["label", "icon"]}

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to a icon or a valid icon name
#    * By default, category names are case insensitive. (e.g.: X-XFCE == x_xfce)

require '/home/manjaro/.config/obmenu-generator/config.pl';

our $SCHEMA = [
#             COMMAND                 	LABEL          		ICON
   {item => ['lxterminal -e sudo setup',      'Install Manjaro',      	'/usr/share/icons/Faenza/actions/48/system-run.png']},
   {item => ['thunar ~/Manjaro',  'User-Guide',      	'/usr/share/icons/hicolor/48x48/apps/Thunar.png']},
   {sep => undef},

   {item => ['thunar',      		'Thunar FM',      	'/usr/share/icons/hicolor/48x48/apps/Thunar.png']},
   {item => ['lxterminal',   	 	'Terminal',          	'lxterminal']},
   {item => ['catfish --path=/',   	'Catfish',          	'/usr/share/icons/Faenza/apps/48/catfish.png']},
   {item => ['nitrogen',     		'Nitrogen',  		'nitrogen']},
   {item => ['gnome-screenshot --interactive', 'Screenshot',    '/usr/share/icons/Faenza/apps/48/gnome-screenshot.png']},

    {sep => undef},

    #          NAME            LABEL                ICON
    {cat => ['utility',     'Accessories', 'applications-utilities']},
    {cat => ['development', 'Development', 'applications-development']},
    {cat => ['education',   'Education',   'applications-science']},
    {cat => ['game',        'Games',       'applications-games']},
    {cat => ['graphics',    'Graphics',    'applications-graphics']},
    {cat => ['audiovideo',  'Multimedia',  'applications-multimedia']},
    {cat => ['network',     'Network',     'applications-internet']},
    {cat => ['office',      'Office',      'applications-office']},
    {cat => ['settings',    'Settings',    'applications-accessories']},

## Custom "Advanced Menu"

   {begin_cat => ['Advanced Settings',  'gnome-settings']},
   {item => ['openbox --reconfigure','Reconfigure Openbox','openbox']},
   {item => ['geany -m ~/.config/openbox/autostart','Openbox Autostart','geany']},
   {item => ['geany -m ~/.config/openbox/rc.xml','Openbox RC','geany']},
   {item => ['geany -m ~/.config/openbox/menu.xml','Openbox Menu','geany']},
   {item => ['geany -m ~/.config/obmenu-generator/schema.pl','Pipe Menu Schema','geany']},
   {item => ['geany -m ~/.config/obmenu-generator/config.pl','Pipe Menu Config','geany']},
   {item => ['geany -m ~/.config/tint2/tint2rc','Tint2 Panel','geany']},
   {item => ['geany -m ~/.config/compton.conf','Compton Compositor','geany']},
   {item => ['geany -m ~/.conkyrc','Conky RC','geany']},
   {item => ['gksu geany -m /etc/pacman.conf','Pacman Config','geany']},
   {item => ['gksu geany -m /etc/pacman.d/mirrorlist','Pacman Mirrorlist','geany']},
   {end_cat   => undef},

## Back to standard pipe-menu

   {cat => ['system',      'System',      'applications-system']},
   {sep => undef},


## Use Oblogout script instead of simple exit command

   {item => ['xscreensaver-command -lock', 'Lock Screen', 'lock']},
   {item => ['oblogout',        'Logout',      'exit']},

    #{cat => ['qt',          'QT Applications',    'qtlogo']},
    #{cat => ['gtk',         'GTK Applications',   'gnome-applications']},
    #{cat => ['x_xfce',      'XFCE Applications',  'applications-other']},
    #{cat => ['gnome',       'GNOME Applications', 'gnome-applications']},
    #{cat => ['consoleonly', 'CLI Applications',   'applications-utilities']},

    #                  LABEL             ICON
    #{wine_apps => ['Wine apps', 'applications-other']},

]