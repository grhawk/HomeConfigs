#!/bin/bash

LASTDIR=$PWD
cd $HOME

function new() {
    mv .bashrc .bashrc.old
    mv .profile .profile.old
    cp $HOME/bashConfig/profile .profile
    cp $HOME/bashConfig/probashrc .bashrc
}

function notNew() {
    rm -f .bashrc
    rm -f .profile
    cp $HOME/.bashConfig/profile .profile
    cp $HOME/.bashConfig/probashrc .bashrc
}


if [[ -d $HOME/bashConfig ]]; then
    echo 'Subfixing bashrc and profile with .old'
    echo 'and creating a new .bashrc and .profile'
    new
    mv bashConfig .bashConfig
elif [[ -d $HOME/.bashConfig ]]; then
    echo 'Replacing the current .bashrc and .profile'
    echo 'with the ones compatible with my bashConfig'
    notNew
else
    echo 'Missing bashConfig directory'
fi
