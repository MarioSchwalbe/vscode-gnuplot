# Gnuplot Language Support for Visual Studio Code #

Extension to provide (basic) Gnuplot language support for VS Code.

## Features ##

Supports:

+ Syntax highlighting
+ Problem matcher for build tasks
+ Snippets

To make use of the problem matcher, the task should pass the relative file path to Gnuplot.
Example task in `tasks.json`:

```json
{
    "taskName":       "Plot with Gnuplot",
    "command":        "${config:gnuplot.gnuplotPath}",
    "args":           [ "${relativeFile}" ],
    "problemMatcher": "$gnuplot"
    ...
}
```

If the script includes other Gnuplot scripts, it may be useful to set a matching `loadpath`:

```json
{
    "command": "${config:gnuplot.gnuplotPath}",
    "args":    [ "-e", "set loadpath '${fileDirname}'", "${relativeFile}" ],
    ...
}
```

## Extension Settings ##

This extension contributes the following settings:

+ `gnuplot.gnuplotPath`: Path to the Gnuplot executable. Not used by this extension, but useful in
  `tasks.json` if it's checked into repositories. Use a command such as
  `${config:gnuplot.gnuplotPath}`.

## Source ##

<https://github.com/MarioSchwalbe/vscode-gnuplot>

## Release Notes ##

### 0.1.0 ###

Initial release.

