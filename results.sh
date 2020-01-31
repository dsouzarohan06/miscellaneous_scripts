#!/bin/bash
# Checking if NCI has rolled out results or not.

/usr/bin/curl -s 'https://sis.ncirl.ie/apex/f?p=1202:700:3755217346208::NO:700:P700_CI_LIST:0&cs=3DrnLBfnelheAr64BX2x1bZNuv23yjKp03EUMmvtGh89DIPM9UxdgsBYEPL71CVZ-iaQ9y3Gwmf126dslTPjHig' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' -H 'DNT: 1' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36' -H 'Sec-Fetch-User: ?1' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' -H 'Sec-Fetch-Site: same-origin' -H 'Sec-Fetch-Mode: navigate' -H 'Referer: https://sis.ncirl.ie/apex/f?p=1202:1100:3755217346208::NO:::' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9' -H 'Cookie: ORA_WWV_REMEMBER_UN=X18139540:ncirl; LOGIN_USERNAME_COOKIE=x18139540; OPENCAMPUS_SESSION_ID=ORA_WWV-ygTLlwMmrrTS6Ex0SQTe9lqF; _ga=GA1.2.821846246.1573484361; _fbp=fb.1.1573484361338.1270904684; hubspotutk=bf4f3685caeed08becba678f5179f9cb; __hs_opt_out=no; _gcl_au=1.1.479172249.1574355358; _gid=GA1.2.1374042977.1580127087; ApplicationGatewayAffinity=563b27227371d594c642536e140f41cdc44edd69630f5d3c9cc2049846d68b89; __hstc=212577419.bf4f3685caeed08becba678f5179f9cb.1573484361465.1579787388446.1580430428458.29; __hssrc=1' --compressed | grep -i "No results available at this time" > /dev/null

if [ $? == 0 ]
then
echo "Results are not out yet"
else
echo "Results are out"
fi
