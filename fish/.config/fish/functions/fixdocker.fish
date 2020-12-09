function fixdocker
  sudo mkdir /sys/fs/cgroup/systemd; and sudo mount -t cgroup -o none,name=systemd cgroup /sys/fs/cgroup/systemd
end
