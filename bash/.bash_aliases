# bash
alias ll="ls -alhF --group-directories-first"

# Kerbernetes
alias kube_gtp=export KUBECONFIG=/home/cosmin/.kube/kubeconfig-ctp-admin
alias k=/usr/local/bin/kubectl
alias kgp="kubectl get pods"
alias kdp="kubectl describe pod"
alias krp="kubectl delete pod"
alias kgmap="kubectl describe configMap"
alias kgctx="kubectl config get-contexts"
alias kgevents="kubectl get events --sort-by='.metadata.creationTimestamp'"

# stuff
alias v=vim
alias nv='/home/cosmin/Downloads/nvim.appimage'
alias ctp='cd $HOME/projects/tolling-proxy'
alias ctb='cd $HOME/projects/bitbucket'
alias ctp_connector='cd $HOME/projects/tolling-proxy/pipelines.connector.mqtt2kafka'
alias vfim="`which vifm` $HOME/projects/tolling-proxy $HOME/projects/tolling-proxy"
alias stock="ticker --config $HOME/.config/ticker/.ticker.yaml"
alias cdg='cd $HOME/projects/gphoto'
alias get_token='cat $HOME/.artifactory | tail -n 1'
alias get_api_key='cat $HOME/.artifactory | head -n 1'

## ssh
alias ssh-ubuntu="ssh -i $HOME/.ssh/home cosmin@ubuntusrv"
alias ssh-cosminpc="ssh -i $HOME/.ssh/home cosmin@cosminpc"

# psql
alias psql_tolling="psql -h localhost -p 5432 tolling resources_admin"
alias psql_portforward="kubectl port-forward -n ctp-test port-forward-pg-5b67cd45bd-2fpgz 5432:5432"

# docker
alias dps='docker ps --format "{{json .}}" | jq "del(.Labels,.LocalVolumes,.Size,.Mounts)"'

# podman
alias pd=`which podman`
alias pcl='podman container ls'
alias pcla='podman container ls -a'
alias pcr='podman container rm --force'
alias pcs='podman container stop'
alias pl='podman logs'
alias plf='podman logs -f'


