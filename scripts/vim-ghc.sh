#!/bin/bash
FILENAME="`pwd`/$1"
TMPDIR="/tmp$PROJDIR/`dirname $FILENAME`"
pghc -c $* -outputdir $TMPDIR
