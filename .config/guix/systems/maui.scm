(define-module (maui)
  #:use-module (base-system)
  #:use-module (gnu))

(operating-system
 (inherit base-operating-system)
 (host-name "maui")
 (timezone "US/Central")
 (locale "en_US.utf8")

 (mapped-devices
  (list (mapped-device
         (source (uuid "21dba327-f68a-46a2-86ee-802e88ac20cd"))
         (target "cryptroot")
         (type luks-device-mapping))))

  (file-systems (cons*
                (file-system
                       (device (file-system-label "btrfs-root"))
                       (mount-point "/")
                       (type "btrfs")
                       (options "subvol=@")
                       (dependencies mapped-devices))
		      (file-system
		       (device (file-system-label "btrfs-root"))
                       (mount-point "/home")
                       (type "btrfs")
                       (options "subvol=@home")
                       (dependencies mapped-devices))
                      (file-system
                       (device (file-system-label "btrfs-root"))
                       (mount-point "/.snapshoots")
                       (type "btrfs")
                       (options "subvol=@snapshots")
                       (dependencies mapped-devices))
		      (file-system
                       (device (uuid "6347-2FE0" 'fat))
                       (mount-point "/boot/efi")
                       (type "vfat"))
                %base-file-systems)))
