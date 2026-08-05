# Packages
## fingerprint

- libfprint
- fprintd
## niri
- ttf-jetbrains-mono-nerd
- niri
- waybar
- swaybg
- ghostty
- fuzzel
## work
- git
- python
- godot
- super-productivity 
- zed
- rnote
- happ-desktop-bin (aur)
- obsidian
- libreoffice-fresh
- libreoffice-fresh-ru
- okular
- btop
- telegram-desktop
- transmission-gtk
- zen-browser-bin (aur)
## other pkgs
- gnome
- steam
- prism-launcher

# Installation

## firngerprint

```
sudo pacman -Sy libfprint fprintd
fprintd-enroll kengpenro 
# replace kengpenro with your username
``` 

- for gnome:
After that activate fingerprint for your user in 
*gnome settings > system > users > fingerprint login* 

## yay (Yet another Yogurt)

``` ;-)
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
sudo rm -rf ./yay
```
## main pkgs

``` ;-)
sudo pacman -Sy godot zed rnote obsidian libreoffice-fresh libreoffice-fresh-ru okular btop telegram-desktop transmission-gtk gnome steam prismlauncher super-productivity
yay -S happ-desktop-bin zen-browser-bin 
```

## niri

``` ;-)
sudo pacman -Sy xwayland-satellite xdg-desktop-portal-gnome xdg-desktop-portal-gtk niri fuzzel waybar swaybg ghostty ttf-jetbrains-mono-nerd
systemctl --user add-wants niri.service waybar.service
echo "[Unit]
PartOf=graphical-session.target
After=graphical-session.target
Requisite=graphical-session.target

[Service]
ExecStart=/usr/bin/swaybg -c 000000 -i "%h/dots-arch/wallpaper-arghora-formless.jpg" -m center
#replace this path with path for yout background image
Restart=on-failure" > ~/.config/systemd/user/swaybg.service
systemctl --user daemon-reload
systemctl --user add-wants niri.service swaybg.service

git clone https://github.com/kengpenro3000/My-awesome-linux-setup ~/dots-arch
```

in your config.kdl file delete all things and paste this line:
```
inclide "~/dots-arch/niri.kdl"
```

# Plans

 - make installation script 
 - make specific tips for my devices
# Thanks
https://github.com/Jguer/yay
