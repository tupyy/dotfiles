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
alias get_token='cat $HOME/.artifactory | tail -n 1'
alias get_api_key='cat $HOME/.artifactory | head -n 1'
alias encrypt_yaml='openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter 10000 -in ./.gophoto-prod.yaml -out ./.gophoto-prod.enc -pass file:./key.bin'
alias decrypt_yaml='openssl enc -aes-256-cbc -d -md sha512 -pbkdf2 -iter 10000 -in ./.gophoto-prod.enc -out ./.gophoto-prod.yaml -pass file:./key.bin'

## ssh
alias ssh-fedora="ssh cosmin@fedorasrv"

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


