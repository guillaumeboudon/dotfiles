# :floppy_disk: dotfiles

## Install

1. Clone this repository:
    ```shell
    cd
    git clone git@github.com:guillaumeboudon/dotfiles.git .dotfiles
    cd .dotfiles
    ```
2. Install Homebrew from https://brew.sh/
3. Install applications: `brew bundle`
4. Set dotfiles: `stow home`

## Change key repeat on Mac OSX

- My config
  - defaults write -g KeyRepeat -int 1
  - defaults write -g InitialKeyRepeat -int 10
- Reset to default
  - defaults delete NSGlobalDomain KeyRepeat
  - defaults delete NSGlobalDomain InitialKeyRepeat
- initial values
  - KeyRepeat : 2 (30ms)
  - InitialKeyRepeat : 15 (225ms)

## Todo

Implement ctags for rails apps:

```shell
ctags --tag-relative -Rf.tags --exclude=.git --exclude=tmp --exclude=public --exclude=log --exclude=elm-stuff --exclude=node_modules --languages=ruby .
```
