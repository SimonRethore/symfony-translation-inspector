<h1 align="center">Symfony Translation Inspector</h1>

<br/>

This script search in a Symfony application for strings that are not translated. It can search in twig or vue files.

To execute the script, you can run the next command and add directories you wanted to check as arguments :

```bash
./translation.sh templates/
```

PS : The script is not totally reliable, there may be false positives and negatives.
