    #!/usr/bin/env sh

    if [ ! `pgrep spotify` ]; then
        echo start
        /snap/bin/spotify &
        sleep 1
    fi

    i3-msg '[class="Spotify"] scratchpad show'
