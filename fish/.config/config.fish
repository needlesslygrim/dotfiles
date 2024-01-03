if status is-interactive
    alias pandoc="pandoc --pdf-engine=xelatex -V mainfont='Berkeley Mono'"
    set -x GPG_TTY $(tty)
    set PATH $PATH $HOME/Github/osxcross/target/bin
end

