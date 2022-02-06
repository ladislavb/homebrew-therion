# homebrew-therion

Therion is cave surveying software - for details see https://therion.speleo.sk

This repository is hosting homebrew formulae for easier installation and update of Therion on your Mac. Please launch Terminal app and follow the instructions.

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

Homebrew will install the latest **tested** revision from GitHub - currently version **6.0.4+f8a57f4**. I will update the formulae from time to time to follow therion development. Feel free to submit a pull request with your updates. Thank you!

If you want to install the latest - bleeding edge version use:

`brew install --HEAD therion`

### 6. Copying Loch to /Applications

Loch is installed to `/usr/local/opt/therion/loch.app/` If you have an older version of Loch installed in your Applications, remove it, then copy the new version with:

`cp -R /usr/local/opt/therion/loch.app /Applications/loch.app`

## Running apps

After sucessfull installation you should be able to:

- start XTherion by typing `xtherion` command to Terminal window
- run Therion compiler by typing `therion` command to Terminal window
- launch Loch viewer from Launchpad

## Upgrade

Launch Terminal app and type `brew update`

## Uninstall

Launch Terminal app and type `brew uninstall therion`
