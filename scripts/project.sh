#!/bin/bash
# set your own PROJDIR or use supplied
# set your own GHC_PATH or use supplied
# export GHC_PATH=~/haskell/ghc-7.4.2/bin/
export CONFDIR=$PROJDIR/cabal-dev/`ls $PROJDIR/cabal-dev/ | grep packages.*conf`
export GHC_FLAGS="-i$PROJDIR -package-conf $CONFDIR"
export LOCAL_PATH="$PROJDIR/cabal-dev/bin"

