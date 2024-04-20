# Do I need to create the group every time? Probably, right?
pueue group add mounts
pueue parallel -g mounts 10

def pueue_mount [label: string, cmd: string] {
	pueue add --label $label -g mounts -- $cmd
}

let copyparty = 'rclone mount --no-console --vfs-cache-mode writes --dir-cache-time 5s gremy-copyparty-dav: P: --log-file C:\Users\Gremious\.logs\rclone\copyparty.txt --volname "[rclone] copyparty"'

let mega = 'rclone mount --no-console --vfs-cache-mode writes --dir-cache-time 5s gremy-mega: M: --log-file C:\Users\Gremious\.logs\rclone\mega.txt --volname "[rclone] MEGA"'

pueue_mount 'copyparty' $copyparty
pueue_mount 'mega' $mega
