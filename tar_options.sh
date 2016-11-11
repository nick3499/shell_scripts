#!/usr/bin/env bash4
# shell script which echoes tar uncompress option example strings
# based on input: 'bz2' 'gz' 'xz'
# for attaining tar options, e.g. '-xvjf'
# '-C /opt' copies output to /opt dir
# see 'tar --help' for more options

read -p "enter: bz2, gz or xz = " -e input

if [ "$input" == "bz2" ]
  then echo "tar -xvjf _____.tar.bz2 -C /opt"
elif [ "$input" == "gz" ]
  then echo "tar -xvzf _____.tar.gz -C /opt"
else
  # entering 'abc', 'pdq' or 'xyz' returns this:
  echo "tar -xvJf _____.tar.xz -C /opt"
fi
