# How to customize your Linux Mint (Sway)

## Linux Installation
Try to Install your Linux

## Setup sway
To install [sway](https://wiki.archlinux.org/title/Sway), do this in your Linux terminal.
```
sudo apt update
sudo apt install sway
```

## Initial Setup (config file)
- Kitty installation
  ```
  sudo apt install kitty
  ```
  and find and replace to become the code below in `~/.config/sway/config`:
  ```
  indsym $mod+Return exec kitty
  ```
  
- For Wallpaper setup, install `swaybg`:
  ```
  sudo apt install swaybg
  ```
  add it to `~/.config/sway/config` if you don't have it:
  ```output * bg ~/Pictures/me2.jpg fill```
  
## Setup your waybar
1. Install waybar:
   ```
   sudo apt install waybar
   ```
   Add my config to `~/.config/waybar/config`
3. Font installation ([here](https://www.nerdfonts.com/font-downloads)):
- Fira Code
  ```
  sudo apt install fonts-firacode
  ```
## fastfetch is perfect
1. Install prerequisite if needed:
   ```
   sudo apt install software-properties-common
   ```
2. Add the Fastfetch PPA:
   ```
   sudo add-apt-repository ppa:fastfetch/stable
   ```
3. Update package lists & Install Fastfetch:
   ```
   sudo apt update
   sudo apt install fastfetch
   ```
4. Verify installation by running: `fastfetch`

To customize the ASCII art logo in fastfetch, try this:
1. Preparing a file, for example in my repo: `me.txt`
2. Try this code:
```
fastfetch --logo-color-1 red --logo-color-2 yellow --color cyan
```


## Also try yazi
First, install Rust & some tools:
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
sudo apt update
sudo apt install build-essential pkg-config libssl-dev
```

Next, clone repo Yazi from Github:
```
git clone https://github.com/sxyazi/yazi.git
cd yazi
```
Build & install Yazi:
```
# yazi-fm (file manager)
cargo install --path yazi-fm --locked

# yazi-cli (CLI)
cargo install --path yazi-cli --locked
```

Add Yazi to PATH:
```
export PATH="$HOME/.cargo/bin:$PATH"
source ~/.bashrc
```
Check version:
```
yazi --version
ya --version
```
