# Constants
CWD=$(pwd)
SCRIPT_PATH=$(dirname $(realpath $0))
OS=$(lsb_release -sd)

# Variables
ACTIVITIES=$1
TEMPLATE=$2

# Polyfill
if [[ -z $ACTIVITIES ]]
then
    echo -n "Quantity of activities: "
    read ACTIVITIES
fi

if [[ -z $TEMPLATE ]]
then
    TEMPLATE="default"
fi

TEMPLATE_FILE=$SCRIPT_PATH/templates/$TEMPLATE.c
MAKEFILE_FILE=$SCRIPT_PATH/Makefile

# Generate files

for i in $(seq $ACTIVITIES)
do
    cat $TEMPLATE_FILE | awk -v "iter=$i" -v "os=$OS" '{gsub(/\[\[ITER\]\]/,iter);gsub(/\[\[OS\]\]/,os)}1' > $CWD/$i.c
done

cat $MAKEFILE_FILE | awk -v "files=$(seq -s ' ' $ACTIVITIES)" '{gsub(/\[\[FILES\]\]/,files)}1' > $CWD/Makefile