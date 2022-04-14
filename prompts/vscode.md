## F12 
    - Go to Definitions
    - View lines where variable is used / invoked / instantiated

## Breakpoints (Add / Remove)
	- Run --> Remove all breakpoints

## View white spaces
    - Render white space; see characters

## View control chars
    - Render control characters (VS Code tips: The "Editor: Render Control Characters" setting)

## Dark or Light Mode 
	- Preferences --> Color Theme

## Show in Finder
	1. Select file in VS Code explorer
    Option + Command + R

## Python in VSCode, these characters (ea98, 4b3f) light up
becf275b-ea98-4b3f-9637-a4ebcfcfb9dc

## Solution : Failed to launch debuggee in terminal (Java)
Add this line in the settings.json --> "java.debug.settings.console": "internalConsole"
`
{
    "editor.suggestSelection": "first",
    "vsintellicode.modify.editor.suggestSelection": "automaticallyOverrodeDefaultValue",
    "editor.minimap.enabled": false,
    "files.exclude": {
        "**/.classpath": true,
        "**/.project": true,
        "**/.settings": true,
        "**/.factorypath": true
    },
    "editor.renderWhitespace": "all",
    "editor.renderControlCharacters": true,
    "workbench.colorTheme": "Visual Studio Dark",
    "window.zoomLevel": -1,
    "java.debug.settings.console": "internalConsole"
}
`
