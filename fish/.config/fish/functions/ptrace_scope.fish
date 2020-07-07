# https://wiki.archlinux.org/index.php/Security#ptrace_scope
function ptrace_scope --description 'Toggle ptrace scope'
  sudo tee /proc/sys/kernel/yama/ptrace_scope
end
