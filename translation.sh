echo '##### Symfony Translation Inspector #####'
printf '\n'

FILE_COUNT=0
CASES_COUNT=0

# LOOP OVER DIRECTORIES
for ARG in "$@"
do
    # FIND ALL FILES MATCHING EXTENSIONS
    FILENAME_LIST=$(find $ARG -type f -regex '.*\.\(twig\|vue\)$' -printf '%p;')

    # TRANSFORM STRING INTO ARRAY
    IFS=';' FILENAME_ARRAY=($FILENAME_LIST)

    # LOOP OVER FILES
    for FILENAME in "${FILENAME_ARRAY[@]}"; do
         echo "Checking $FILENAME"

         # GET FILE CONTENT
         FILE_CONTENT=$(cat $FILENAME)

         # FIND STRINGS NOT TRANSLATED AND INCREMENT CASES
         CASES_FOUND=$(echo "$FILE_CONTENT" | grep -E '<.+>(.[^<]+)<.+>' | grep -E '^[^{}]+$' | wc -l)
         CASES_COUNT=$((CASES_COUNT+CASES_FOUND))

         # UNCOMMENT THIS TO CHECK CASES
         # echo "$FILE_CONTENT" | grep -E '<.+>(.[^<]+)<.+>' | grep -E '^[^{}]+$'

         # INCREMENT FILE
         FILE_COUNT=$((FILE_COUNT+1))
    done
done

printf '\n'
echo '##### Results #####'
printf '\n'
echo "$FILE_COUNT" files
echo "$CASES_COUNT" strings to translate


