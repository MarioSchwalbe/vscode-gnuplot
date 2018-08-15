Gnuplot Language Support for Visual Studio Code
===============================================

Extension to provide Gnuplot language support for VS Code.

![syntax](https://github.com/MarioSchwalbe/vscode-gnuplot/raw/master/images/Syntax.png)

Features
--------

Supports:

- Syntax highlighting
- Problem matcher (and pattern) for build tasks
- Snippets

To make use of the problem matcher, the task should pass the relative file path to Gnuplot.
Example task in `tasks.json`:

```json
{
    "label":          "Plot with Gnuplot",
    "command":        "${config:gnuplot.gnuplotPath}",
    "args":           [ "${relativeFile}" ],
    "problemMatcher": "$gnuplot"
    // ...
}
```

If the script includes other Gnuplot scripts, it may be useful to set a matching `loadpath`:

```json
{
    "label":          "Plot with Gnuplot",
    "command":        "${config:gnuplot.gnuplotPath}",
    "args":           [ "-e", "set loadpath '${fileDirname}'", "${relativeFile}" ],
    "problemMatcher": "$gnuplot"
    // ...
}
```

Extension Settings
------------------

This extension contributes the following settings:

+ `gnuplot.gnuplotPath`: Path to the Gnuplot executable. Not used by this extension directly, but
  useful in `tasks.json` if it's checked into repositories. Use a command such as
  `${config:gnuplot.gnuplotPath}`.

Source
------

<https://github.com/MarioSchwalbe/vscode-gnuplot>
