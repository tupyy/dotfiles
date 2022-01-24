# bash
alias ll="ls -alhF --group-directories-first"

# Kerbernetes
alias kube_gtp=export KUBECONFIG=/home/cosmin/.kube/kubeconfig-ctp-admin
alias k=/usr/local/bin/kubectl
alias kgp="kubectl get pods"
alias kdp="kubectl describe pod"
alias krp="kubectl delete pod"
alias kgmap="kubectl describe configMap"
alias kgctx="kubectl config current-context"
alias kgevents="kubectl get events --sort-by='.metadata.creationTimestamp'"
alias kube_val="export KUBECONFIG=$HOME/.kube/kubeconfig-ctp-val-admin"
alias kube_int="export KUBECONFIG=$HOME/.kube/kubeconfig-ctp-admin"

# stuff
alias v=vim
alias nv='nvim'
alias ctp='cd $HOME/projects/tolling-proxy'
alias ctb='cd $HOME/projects/bitbucket'
alias vfim="`which vifm` $HOME/projects/tolling-proxy $HOME/projects/tolling-proxy"
alias cdg='cd $HOME/projects/perso/gphotos'
alias get_token='cat $HOME/.artifactory | tail -n 1'
alias get_api_key='cat $HOME/.artifactory | head -n 1'
alias run_stores_postgres="docker run -d --rm -p 5432:5432 docker.repo.tooling.prod.cdsf.io/cloud/continental/ctp/tools/dev/local-postgres:latest"
alias encrypt_yaml='openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter 10000 -in ./.gophoto-prod.yaml -out ./.gophoto-prod.enc -pass file:./key.bin'
alias decrypt_yaml='openssl enc -aes-256-cbc -d -md sha512 -pbkdf2 -iter 10000 -in ./.gophoto-prod.enc -out ./.gophoto-prod.yaml -pass file:./key.bin'

## ssh
alias ssh-fedora="ssh cosmin@fedorasrv"

# psql
alias psql_tolling="psql -h localhost -p 5432 tolling resources_admin"
alias psql_tollingproxy="psql -h localhost -p 5432 tollingproxy resources_admin"
alias psql_portforward="kubectl port-forward -n ctp-test port-forward-pg-78d669d76-np4zp 5432:5432"
alias run_stores_postgres="docker run --rm -d -p 5432:5432 docker.repo.tooling.prod.cdsf.io/cloud/continental/ctp/tools/dev/local-postgres:latest"

# docker
alias dps='docker ps --format "{{json .}}" | jq "del(.Labels,.LocalVolumes,.Size,.Mounts)"'
alias drm='docker ps -a --format "{{.ID}}" | xargs docker rm --force'
export DOCKER_REGISTRY="harbor.registry.prod.cdsf.io"

# podman
alias pd=`which podman`
alias pcls='podman container ls'
alias pclsa='podman container ls -a'
alias pcrm='podman container rm --force'
alias pcs='podman container stop'
alias pl='podman logs'
alias plf='podman logs -f'

# minikube
alias mfr='docker run --rm -it --network=host alpine ash -c "apk add socat && socat TCP-LISTEN:5000,reuseaddr,fork TCP:$(minikube ip):5000"'

#ADL
DEFAULT="\e[39m"
GREEN="\e[32m"
RED="\e[31m"
  
function clock_sync() {
    sudo /usr/sbin/VBoxService --timesync-set-start --timesync-set-on-restore --timesync-set-threshold 1000 --timesync-interval 5000
    return
}
alias cls='clock_sync'
# AWS
function check_aws_connection() {
    echo -en "${DEFAULT}AWS_CONNECTION : " && aws s3 ls > /dev/null && { echo -e "${GREEN}OK"; return 0; } || { echo -e "${RED}KO"; return 1; }
}
  
export PATH=$PATH:~/.local/bin
  
function adfs_login() {
    unset AWS_PROFILE
    echo "Usage : adl <PROFILE> (e.g. adl 1116)"
    echo "WARNING : cw01/uie12468 / passwd = <ldap one>"
    PROFILE=$1
    if [[ ! -z $PROFILE ]]
    then
        echo "aws-adfs login --adfs-host=adfs.contiwan.com --session-duration 43200 --profile=$PROFILE"
        aws-adfs login --adfs-host=adfs.contiwan.com --session-duration 43200 --profile=$PROFILE
        export AWS_PROFILE=$PROFILE
    else
        echo "aws-adfs login --adfs-host=adfs.contiwan.com --session-duration 43200"
        aws-adfs login --adfs-host=adfs.contiwan.com --session-duration 43200
        echo "Set AWS_PROFILE !"
    fi
    export AWS_DEFAULT_REGION="eu-central-1"
    export AWS_PROFILE="tts"
      
    check_aws_connection || { echo -e "${DEFAULT}Sync VM clock : " && clock_sync && check_aws_connection; }
}
alias adl='adfs_login'



alias butane='podman run --rm --interactive       \
              --security-opt label=disable        \
              --volume ${PWD}:/pwd --workdir /pwd \
              quay.io/coreos/butane:release'

alias coreos-installer='podman run --pull=always            \
                        --rm --interactive                  \
                        --security-opt label=disable        \
                        --volume ${PWD}:/pwd --workdir /pwd \
                        quay.io/coreos/coreos-installer:release'

alias ignition-validate='podman run --rm --interactive       \
                         --security-opt label=disable        \
                         --volume ${PWD}:/pwd --workdir /pwd \
                         quay.io/coreos/ignition-validate:release'


