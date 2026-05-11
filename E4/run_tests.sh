#!/bin/bash
# E4
# no parameter
# requires dirs: tests

E3=$(pwd)
tests="$E3/tests"

## You have already built t3 using make compile
## or had a compilation error.

echo -n "E4 - "

if [ -e "$E3/valida" ] ; then
	cp "$E3/valida" $tests
else
	echo "Executable valida not found."
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
    ./valida < "$tests/$t" > "$tests/$name"
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
echo
echo "Done"

rm "$tests/valida"
cd "$E3"

