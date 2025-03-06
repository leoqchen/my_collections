#!/bin/bash

set -x #echo command executed

clone()
{
  if [ ! -e $2 ]; then
    git clone --recursive $1 $2

    # other optional 
    if [ ! -z "$3" ]; then
      eval "$3"
    fi
  fi
}


# books
#-----------
clone https://github.com/kaitoukito/Computer-Science-Textbooks.git books/Computer-Science-Textbooks
clone https://github.com/kaitoukito/Integrated-Circuit-Documents.git books/Integrated-Circuit-Documents
clone https://github.com/kaitoukito/Integrated-Circuit-Textbooks.git books/Integrated-Circuit-Textbooks
clone https://github.com/kaitoukito/A-Primer-on-Memory-Consistency-and-Cache-Coherence.git books/A-Primer-on-Memory-Consistency-and-Cache-Coherence
