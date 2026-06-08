#!/bin/bash
# E5
# no parameter
# requires dirs: tests

E5=$(pwd)
tests="$E5/tests"

## You have already built E5 using make compile
## or had a compilation error.

echo "---"
echo "$E5"
echo -n "E5 - "

if [ -e "$E5/verifica" ] ; then
	cp "$E5/verifica" $tests
else
	echo "Executable verifica not found."
	exit 2
fi

# Get the inputs
cd "$tests"
mytests=$(ls *.in)

echo "Running tests"
echo "---"
totalp=0
totalf=0

for t in $mytests; do
    name="$(basename $t .in).out"
    ora="$(basename $t .in).ora"
    echo "Running $t ..."
    ./verifica < "$tests/$t" > "$tests/$name"
    n1=`diff -bB -iw "$tests/$name" "$tests/$ora" | grep "^>" | wc -l`
    n2=`diff -bB -iw "$tests/$name" "$tests/$ora" | grep "^<" | wc -l`
    if [[ $n1 -eq 0 ]] && [[ $n2 -eq 0 ]] ; then
        ((totalp++))
    else
        echo "FAIL"
        ((totalf++))
    fi
done

echo "---"
echo "PASS: $totalp"
echo "FAIL: $totalf"
echo "---"
echo "Done."

rm "$tests/verifica"
cd "$E5"

