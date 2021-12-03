function changeFontSize() {
    size=$1
    echo "new font size: ${size}"

    sed -r -i "s/=[0-9]{2}/=${size}/g" $HOME/.Xresources
    xrdb $HOME/.Xresources
}
