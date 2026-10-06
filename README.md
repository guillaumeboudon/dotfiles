# :floppy_disk: dotfiles

## Install

1. Clone this repository:
    ```shell
    cd
    git clone https://github.com/guillaumeboudon/dotfiles.git .dotfiles
    cd .dotfiles
    ```
2. Install Homebrew from https://brew.sh/
3. Install applications: `brew bundle`
4. Set dotfiles: `stow --dotfiles --no-folding --ignore='\.DS_Store' home`
5. Install z: `mkdir -p ~/.local/share && touch ~/.local/share/z`
6. Install ruby:
    ```shell
    rbenv install -l
    rbenv install <version>
    rbenv global <version>
    ```
7. Install global gems: `bundle install`

## Colors (base16)

Palette: `home/dot-config/base16/current.sh` → `schemes/<name>.sh`, read by zsh
(terminal colors, fzf) and nvim (theme, lightline).

- Add a scheme: copy `base00`..`base0F` from a yaml of
  https://github.com/tinted-theming/schemes (base16/) into `schemes/<name>.sh`,
  then `stow` to link the new file.
- Switch: `cd home/dot-config/base16 && ln -sfn schemes/<name>.sh current.sh`,
  then open a new shell / restart nvim.

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
