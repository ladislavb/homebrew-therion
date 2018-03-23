# homebrew-therion

Therion is cave surveying software - for details see https://therion.speleo.sk

This repository is hosting homebrew formualae for easy installation and update of Therion on your Mac. Please launch Terminal app and type the following commands.

## Installation

### 1. Install Command Line Tools

`xcode-select --install`

### 2. Install Homebrew - http://brew.sh/

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

Test it:

`brew update`
`brew doctor`

### 3. Install MacTeX

Download and install MacTeX from http://www.tug.org/mactex/mactex-download.html

### 4. Install Therion

Open new Terminal window and type:

`brew install https://raw.githubusercontent.com/ladislavb/homebrew-therion/master/therion.rb`

Homebrew will install the latest **tested** revision from GitHub.

If you want to install the latest - bleeding edge version use:

`brew install --HEAD https://raw.githubusercontent.com/ladislavb/homebrew-therion/master/therion.rb`

## Running apps

After sucessfull installation you should be able to:

- start XTherion by typing `xtherion` command to Terminal window
- run Therion compiler by typing `therion` command to Terminal window
- launch Loch viewer from Launchpad


## Upgrade

Launch Terminal app and type `brew update`