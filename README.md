# dwm
**Requirements:**

    sudo pacman -Sy xorg xorg-xinit xorg-xserver network-manager-applet nitrogen lxappearance 
    yay -Sy picom pnmixer flat-remix-gtk

**Installation:**
1. Place .Xresources and .xinitrc in your $HOME directory

        cd ~/dwm/ && cp .Xresouces ~/.Xresources && cp .xinitrc ~/.xinitrc
2. Build the window manager 

        cd ~/dwm/suckless/dwm && sudo cp config.def.h config.h && sudo make clean install && cd

3. Build the terminal 

        cd ~/dwm/suckless/st && sudo make clean install && cd
5. Build the run prompt
             
        cd ~/dwm/suckless/dmenu && sudo cp config.def.h config.h && sudo make clean install && cd
5. Build the Screen Lock
      
        cd ~/dwm/suckless/slockcustom/slock && sudo cp config.def.h config.h && sudo make clean install && cd
6. Additional applications

For music

        sudo pacman -Sy cmus 
**Hope you enjoy the delicious rice ;D**
        
> in case if you want to remove beep sound coming through speaker while using terminal
    rmmod pcspkr
