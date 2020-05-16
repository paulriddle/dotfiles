function mostcpu --description 'Top 10 CPU intensive processes'
  ps axch -o cmd:15,%cpu --sort=-%cpu | head
end
