# Git
alias git-log="git log --graph --pretty=oneline --abbrev-commit"
alias git-commit="git commit --all"
alias git-branch="git branch -vv"
alias git-tracked-files="git ls-files -t"
alias night-colors="qdbus org.kde.kglobalaccel /component/kwin invokeShortcut \"Toggle Night Color\""

# vim
alias edit-vimrc="vim $HOME/.vimrc"

# Spring boot debug
alias debug-spring-boot="mvn spring-boot:run -Dspring-boot.run.jvmArguments=\"-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=7000\""

# delete vim swap files
alias rmswp="find . -type f -name \"*.sw[klmnop]\" -delete"

#aws cli
alias describe-instances="aws ec2 describe-instances --filter Name=tag:Name,Values=openwis* --query 'Reservations[*].Instances[*].[Tags[?Key==\`Name\`].Value|[0], InstanceId, State.Name, NetworkInterfaces[0].PrivateIpAddress, PublicIpAddress, SubnetId]' --output table"
alias describe-addresses="aws ec2 describe-addresses --query \"Addresses[*].[Tags[?Key=='Name'].Value|[0],PublicIp, AllocationId,InstanceId]\" --output table"

# various
alias lzl="lazylogger --config /home/cosmin/logger.yaml"
alias netstat-listen="grc netstat -nlpt"
alias gps="grc aux"

# load all my keys
alias load-keys="find ~/.ssh ! -name \"*pub\" ! -name \"known*\" -type f -exec ssh-add {} \\;"

# spotify
alias spp="qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause"
alias sn="qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next"
alias sp="qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous"
