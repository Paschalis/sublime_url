# Sublime Text URL handler

A URL handler for **Sublime Text 3** on Mac OSX.

Implements a Sublime Text variant of the [TextMate URL scheme](http://blog.macromates.com/2007/the-textmate-url-scheme/).

Made using JavaScript for Automation.  Originally written for Mac OS Sierra 10.12.6 and known to still work with High Sierra (10.13) and Mojave (10.14) as of January 2019.

## Installation

- Download the current release: [SublimeUrl-1.0.zip](https://github.com/inopinatus/sublime_url/releases/download/v1.0/SublimeUrl-v1.0.zip)
- Extract SublimeUrl.app and place in your user **Applications** directory.
- Run once to register the handler.

## Uninstallation

Just delete the app.

## How to use

Have your debugging tool/exception handling produce URLs in the following format:  
`subl://open?url=file://{{file}}&line={{line}}&column={{column}}`

Examples:
- `subl://open?url=file:///path/to/file.js&line=19&column=4`
- `subl://open?url=file:///path/to/other.css&line=127`

`url` is required and the file must exist or an error is given.  SublimeUrl expects to find Sublime Text in `/Applications/Sublime Text.app`.

## Homestead mapping to MacOS
In case you are using Homestead you can provide a single line mapping to `.sublime_url` in your home directory.
The format is: `<from> <to>`
e.g. `/home/vagrant/ /Users/MyUsername/path/to/laravel_project/`

## Sublime Text and Ruby on Rails errors

This add-on was developed specifically for use with the [Better Errors](https://github.com/charliesome/better_errors) gem although it should work with anything that follows the specified URL format.  See the [Better Errors Wiki](https://github.com/charliesome/better_errors/wiki) for more information.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/inopinatus/sublime_url. The `.scpt` files can be edited with the standard Script Editor.

## History

#### Version 1.0
This project was written from scratch as a drop-in replacement for the *Subl* handler by [Dave Houlbrooke](https://github.com/dhoulb) which has since been retired.

## License

This code is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
