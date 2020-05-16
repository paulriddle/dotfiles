function mostmem --description 'Top 10 memory intensive processes'
  ps axch -o cmd:15,%mem --sort=-%mem | head
end
