# GnuPlot Language Support for Visual Studio Code

Extension to provide (basic) GnuPlot language support for VS Code.

## Features

Supports:

+ Syntax highlighting: Works mostly (see [Known Issues](#known-issues)).
+ Problem matcher for build tasks.
+ Snippets

## Extension Settings

This extension contributes the following settings:

+ `gnuplot.gnuplotPath`: Path to the GnuPlot executable. Not used by this extension, but useful in
  `tasks.json` if it's checked into repositories. Use a command such as
  `${config:gnuplot.gnuplotPath}`.

## Known Issues

Currently escaped newlines (GnuPlot line continuation) are not supported and will look ugly.

## Source

<https://github.com/MarioSchwalbe/vscode-gnuplot>

## Release Notes

### 0.1.0

Initial release.

