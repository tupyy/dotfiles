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

# aws akka
alias ssh-jump-host="ssh -i ~/.ssh/openwis.pem ubuntu@ec2-35-180-175-197.eu-west-3.compute.amazonaws.com"
alias ssh-sftp-host="ssh -i ~/.ssh/openwis.pem ec2-user@ec2-35-180-142-64.eu-west-3.compute.amazonaws.com"

#aws cli
alias describe-instances="aws ec2 describe-instances --filter Name=tag:Name,Values=openwis* --query 'Reservations[*].Instances[*].[Tags[?Key==\`Name\`].Value|[0], InstanceId, State.Name, NetworkInterfaces[0].PrivateIpAddress, PublicIpAddress, SubnetId]' --output table"
alias describe-addresses="aws ec2 describe-addresses --query \"Addresses[*].[Tags[?Key=='Name'].Value|[0],PublicIp, AllocationId,InstanceId]\" --output table"

# various
alias lzl="lazylogger --config /home/cosmin/logger.yaml"
alias netstat-listen="grc netstat -nlpt"
alias gps="grc aux"

# load all my keys
alias load-keys="find ~/.ssh ! -name \"*pub\" ! -name \"known*\" -type f -exec ssh-add {} \\;"

# start wismet aws openvpn client
alias wismet-vpn="openvpn --config ~/Downloads/wismetTesting/vpnconfig-wismet-mss-mfi.ovpn"

# WISMET
alias ssh-wismet="ssh ec2-user@wismet.jumpHost"

# AWS
alias ssh-user-portal="ssh ec2-user@openwis-user-portal"
alias ssh-admin-portal="ssh ec2-user@openwis-admin-portal"
alias ssh-dataservices="ssh ec2-user@openwis-dataservices"
alias ssh-openam="ssh ec2-user@openwis-openam"

# spotify
alias spp="qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause"
alias sn="qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next"
alias sp="qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous"
