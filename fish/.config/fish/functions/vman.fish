function vman
  vim -c "SuperMan $argv"
  
  if test $status != 0
    echo "No manual entry for $argv"
  end
end
