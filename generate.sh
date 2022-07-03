# Constants
CWD=$(pwd)
SCRIPT_PATH=$(dirname $(realpath $0))
OS=$(lsb_release -sd)

# Variables
TARGET=$1
TEMPLATE=$2

# Polyfill
if [[ -z $TARGET ]]
then
    echo -n "Quantity: "
    read TARGET
fi

if [[ -z $TEMPLATE ]]
then
    TEMPLATE="default"
fi

# Work variables
QUANTITY=$(echo $TARGET | grep '[0-9]*' -o)
FORCE=$(echo $TARGET | grep '!' -o | wc -l)
TEMPLATE_FILE=$SCRIPT_PATH/templates/$TEMPLATE.c
MAKEFILE_FILE=$SCRIPT_PATH/Makefile

# Check template files
if [[ ! -f $MAKEFILE_FILE ]]
then
    echo "Makefile file not found"
    exit 1
fi

if [[ ! -f $TEMPLATE_FILE ]]
then
    echo "Template file not found"
    exit 1
fi

# Cleanup files
if [[ $FORCE -ge 3 ]]
then
    rm -f $CWD/*.c $CWD/Makefile
fi

# Generate files
for i in $(seq $QUANTITY)
do
    FILENAME=$CWD/$i.c
    if [[ -f $FILENAME && $FORCE -lt 1 ]]
    then
        echo "File $FILENAME already exists, skipping"
    else
        cat $TEMPLATE_FILE | awk -v "iter=$i" -v "os=$OS" '{gsub(/\[\[ITER\]\]/,iter);gsub(/\[\[OS\]\]/,os)}1' > $FILENAME
    fi
done

FILENAME=$CWD/Makefile
if [[ -f $FILENAME && $FORCE -lt 2 ]]
then
    echo "File $FILENAME already exists, skipping"
else
    cat $MAKEFILE_FILE | awk -v "files=$(seq -s ' ' $QUANTITY)" '{gsub(/\[\[FILES\]\]/,files)}1' > $CWD/Makefile
fi