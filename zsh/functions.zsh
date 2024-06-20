warn () {
    print -P "%F{yellow}WARN:%F{reset} $*"
}

add-path () {
    if (( $# != 1 )) ; then
        warn "add-path requieres 1 argument"
        return
    fi

    dir="$1"

    case ":${PATH}:" in
        *:"$dir":*)
            ;;
        *)
            # Prepending path in case a system-installed rustc needs to be overridden
            export PATH="$dir:$PATH"
            ;;
    esac
}
