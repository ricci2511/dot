# dot

1. Clone the repo and navigate into it:

   ```shell
   git clone git@github.com:ricci2511/dot.git && cd dot
   ```

2. Install with [`stow`](https://www.gnu.org/software/stow/):

   ```shell
   stow -t ~ .
   ```

## Packages install

- MacOS

```shell
xargs brew install < packages/leaves.txt
```

- Arch Linux

```shell
sudo pacman -S --needed - < packages/pacman.txt
```

## Applications setup

### zsh

- Install [zap](https://github.com/zap-zsh/zap) plugin manager:

```shell
git clone https://github.com/zap-zsh/zap.git ~/.local/share/zap/
```

### tmux

- Install [tpm](https://github.com/tmux-plugins/tpm)

```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

- Install plugins with `prefix + I`
