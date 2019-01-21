#!/bin/bash
if [ "$TERM" = "linux" ]
then
    # black
    echo -en "\e]P01c1c1c"
    echo -en "\e]P8878787"

    # red
    echo -en "\e]P1af5f5f"
    echo -en "\e]P9af5f5f"

    # green
    echo -en "\e]P287875f"
    echo -en "\e]PA87875f"

    # yellow
    echo -en "\e]P3af875f"
    echo -en "\e]PBaf875f"

    # blue
    echo -en "\e]P4878787"
    echo -en "\e]PC878787"

    # magenta
    echo -en "\e]P5af8787"
    echo -en "\e]PDaf8787"

    # cyan
    echo -en "\e]P687afaf"
    echo -en "\e]PE87afaf"

    # white
    echo -en "\e]P7dfdfaf"
    echo -en "\e]PFdfdfaf"

    # get rid of artifacts
    clear
fi
