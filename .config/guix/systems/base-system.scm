(define-module (base-system)
  #:use-module (gnu) 
  #:use-module (nongnu packages linux) 
  #:use-module (nongnu system linux-initrd)
  #:use-module (gnu services desktop)
  #:use-module (gnu services networking)
  #:use-module (gnu services avahi)
  #:use-module (gnu services xorg)
  #:use-module (gnu services sound)
  #:use-module (gnu services audio)
  #:use-module (gnu services cups)
  #:use-module (gnu services ssh)
  #:use-module (gnu services admin)
  #:use-module (gnu packages bootloaders)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages wm) 
  #:use-module (gnu packages gnome) 
  #:use-module (gnu packages fonts) 
  #:use-module (gnu packages xdisorg) 
  #:use-module (gnu packages image) 
  #:use-module (gnu packages video) 
  #:use-module (gnu packages certs)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages package-management))

(define %my-desktop-services
  (modify-services %desktop-services
		   (delete avahi-service-type)
		   (delete gdm-service-type)
		   (delete geoclue-service)		   
		   )
  )

(define-public base-operating-system
  (operating-system
   (host-name "base-system")
   (kernel linux)
   (initrd microcode-initrd)
   (firmware (list linux-firmware))
   (timezone "US/Central")
   (locale "en_US.utf8")

   (keyboard-layout (keyboard-layout "us" "altgr-intl"))

   (bootloader (bootloader-configuration
		(bootloader grub-bootloader)
		(targets (list "/dev/vda"))
		(keyboard-layout keyboard-layout)))
   
   (file-systems (cons*
		  (file-system
		   (mount-point "/tmp")
		   (device "none")
		   (type "tmpfs")
		   (check? #f))
		  %base-file-systems))

   (swap-devices
    (list "/swapfile"))
   
   (users (cons* (user-account
		  (name "lucas")
		  (comment "Lucas Horton")
		  (shell (file-append zsh "/bin/zsh"))
		  (supplementary-groups '("wheel" "audio" "video"))
		  (group "users"))
		    %base-user-accounts))

     (packages (append (list
		        git
			emacs
			neovim
			wayland
			bluez
			flatpak
                        xdg-desktop-portal-wlr
                        foot
			sway
			swaylock
			swayidle
			swaybg
			waybar
			wofi
			mako
			grim
			slurp
			wf-recorder
			nss-certs
                        font-awesome
                        font-fira-code
                        gnome-themes-standard
                        gnome-themes-extra
                        adwaita-icon-theme
			)
                       %base-packages))

     (services 
      (cons*
       (service cups-service-type
		(cups-configuration
		 (web-interface? #t)))
       (service mpd-service-type)
       (service openssh-service-type
		(openssh-configuration
		 (permit-root-login #f)))
       (service unattended-upgrade-service-type)
       %my-desktop-services
       )))))
