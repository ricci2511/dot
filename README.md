# dot

1. Clone the repo and navigate into it:

   ```shell
   git clone https://github.com/ricci2511/dot.git && cd dot
   ```

2. Install with [`stow`](https://www.gnu.org/software/stow/):

   ```shell
   stow -t ~ .
   ```

## Packages install

- Arch Linux

```shell
sudo pacman -S --needed - < packages/pacman.txt
```

- MacOS

```shell
xargs brew install < packages/leaves.txt
```
