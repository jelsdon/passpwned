# passpwned

Shell script leveraging haveibeenpwned.com's API https://haveibeenpwned.com/API/v2#PwnedPasswords to identify whether strings appear in known password lists

## Usage
```
$ ./passpwned.sh <string>
```

## Example
In the following example, a check against the string `aweakpassword` returns one hit

    $ ./passpwned.sh aweakpassword
    Password appears 1 times

## Script Flow
Implementation of [k-Anonymity model](https://en.wikipedia.org/wiki/K-anonymity)

```mermaid
sequenceDiagram
    script ->> script: string = sha1(string)
    script ->> haveibeenpwned: string.first5Chars()
    note right of haveibeenpwned: each returning match includes a count
    haveibeenpwned ->> script: return(match.last35Chars)
    script ->> script: Look for match on returned data
    alt match found
      script ->> script: return match.count
      else
      script ->> script: return unknown
      end 
```
