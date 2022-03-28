# homebrew-therion

Therion is cave surveying software - for details see https://therion.speleo.sk

This repository is hosting homebrew formulae for easier installation and update of Therion on your Mac. Please launch Terminal app and follow the instructions.

> :warning: This formulae is now using CMAKE instead of the legacy make build method. Installation was successfuly tested on Apple Silicon machine running macOS 12.1 Monterey. Plese check [Troubleshooting](#troubleshooting) section before submitting an issue.

## Installation

### 1. Install Command Line Tools

`xcode-select --install`

### 2. Install Homebrew - http://brew.sh/

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

Test it:

`brew update`

`brew doctor`

If you want to disable brew analytics type:

`brew analytics off`

### 3. Install XQuartz

If your macOS doesn't contain X11 server (10.12 Sierra+) install it by following command:

`brew install --cask xquartz`

### 4. Install MacTeX

`brew install --cask mactex`

### 5. Install Therion

`brew tap ladislavb/homebrew-therion`

`brew install therion`

Homebrew will install the latest therion release. I will update the formulae from time to time to follow therion development. Feel free to submit a pull request with your updates. Thank you!

If you want to test the latest (development) revision from source code on GitHub use:

`brew install --HEAD therion`

### 6. Copying Loch to /Applications

Loch is installed to `<prefix>/opt/therion/loch.app/` If you have an older version of Loch installed in your Applications, remove it, then copy the new version with:

`cp -R <prefix>/opt/therion/loch.app /Applications/loch.app`

Replace `<prefix>` with `/usr/local` for macOS Intel or `/opt/homebrew` for Apple Silicon

## Running apps

After sucessfull installation you should be able to:

- start XTherion by typing `xtherion` command to Terminal window
- run Therion compiler by typing `therion` command to Terminal window
- launch Loch viewer from Launchpad

## Upgrade

Launch Terminal app and type `brew update`

## Uninstall

Launch Terminal app and type `brew uninstall therion`

## Troubleshooting

### XTherion UI is broken

After starting XTherion from Terminal you see the following warning: `DEPRECATION WARNING: The system version of Tk is deprecated and may be removed in a future release. Please don't rely on it. Set TK_SILENCE_DEPRECATION=1 to suppress this warning.`

Solution/Workaround:

- Add homebrew Tcl/Tk version to the first place in $PATH variable: \
Apple Silicon: `echo 'export PATH="/opt/homebrew/opt/tcl-tk/bin:$PATH"' >> ~/.zshrc` \
Intel: `echo 'export PATH="/usr/local/homebrew/opt/tcl-tk/bin:$PATH"' >> ~/.zshrc`
- Open new Terminal window and run Xtherion. It should use newer Tcl/Tk version from now on. **You will probably need to apply also the next fix: XTherion - can't find package BWidget**.

### XTherion - can't find package BWidget

You may see the following error after forcing Homebrew's Tcl/Tk version instead of the one provided by Apple: 

    Error in startup script: can't find package BWidget
        while executing
    "package require BWidget"
        (file "/opt/homebrew/bin/xtherion" line 12786)

Solution/Workaround:

- Symlink BWidget from /System/Library/Tcl/ folder to homebrew Tcl/Tk package folder: \
Apple Silicon: `ln -s /System/Library/Tcl/bwidget1.9.1 /opt/homebrew/opt/tcl-tk/lib/bwidget1.9.1` \
Intel: `ln -s /System/Library/Tcl/bwidget1.9.1 /usr/local/opt/tcl-tk/lib/bwidget1.9.1`
- Open new Terminal window and run Xtherion. It should work OK from now on.

### Loch scene rendering on Retina / HiDPI screen

- see https://github.com/therion/therion/issues/399
