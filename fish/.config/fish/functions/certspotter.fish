function certspotter --description 'Finds subdomains using certspotter API'
  curl -s "https://api.certspotter.com/v1/issuances?domain=$argv[1]&expand=dns_names" | jq '.[].dns_names[]' | sed 's/"//g; s/*\.//g' | sort -u | rg $argv[1]
end
