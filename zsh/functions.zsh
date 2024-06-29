warn () {
    print -P "%F{yellow}WARN:%F{reset} $*"
}

add-path () {
    if (( $# != 1 )) ; then
        warn "add-path requieres 1 argument"
        return
    fi

    local npath="$1"

    case ":${PATH}:" in
        *:"$npath":*)
            ;;
        *)
            # Prepending path in case a system-installed rustc needs to be overridden
            export PATH="$npath:$PATH"
            ;;
    esac
}
