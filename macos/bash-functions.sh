#!/bin/bash

# change the name of your computer e.g. from stock 'Cillian's-MBP'
function renameComputer() {
    new_name=$1
    
    # fully qualified hostname e.g. new_name.domain.com
    echo "Changing fully qualified hostname..."
    sudo scutil --set HostName $new_name

    # bonjour hostname e.g. new_name.local
    echo "Changing bonjour hostname..."
    sudo scutil --set LocalHostName $new_name

    # computer name e.g. new_name
    echo "Changing computer name..."
    sudo scutil --set ComputerName $new_name

    # flush the dns cache
    echo "Flushing the DNS cache..."
    dscacheutil -flushcache

    echo "Finished! Restart your computer..."
}
