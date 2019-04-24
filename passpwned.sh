#!/bin/bash

hash=$(echo -n $@ | sha1sum)
hashes=$(curl -s https://api.pwnedpasswords.com/range/${hash:0:5})
pwned=$(grep -i "${hash:5:35}" <<< "$hashes")
pwned=$(cut -d: -f2 <<< $pwned)
pwned=$(tr -d '\r' <<< $pwned)
[[ $pwned -gt 0 ]] && echo "Password appears $pwned times" || echo "Unknown"
