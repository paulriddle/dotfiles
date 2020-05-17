function crtsh --description 'Finds subdomains and emails on crt.sh'
  curl -s "https://crt.sh/?Identity=%.$argv[1]" | rg ">*.$argv[1]" | sed 's/<[/]*[TB][DR]>/\n/g' | rg -v "<|^[\*]*[\.]*$argv[1]" | sort -u | awk 'NF'
end
