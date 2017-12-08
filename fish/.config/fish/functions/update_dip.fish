function update_dip
  curl -L https://github.com/bibendi/dip/releases/download/1.0.2/dip-(uname)-(uname -m) > ~/bin/dip
  chmod +x ~/bin/dip
end
