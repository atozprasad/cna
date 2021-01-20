# K8S quick commands


Edit and indent in VIM
First, write these in your .vimrc :
cat > .vmrc <<EOF
# .vimrc
set tabstop=2
set expandtab
set shiftwidth=2
EOF


## Preparation
alias k=kubectl
k version --short # tested with v1.19.0


export do="--dry-run=client -o yaml"

## Pod creation yaml file
### Simple
k run pod1 --image=nginx $do
### Detailed
k run pod1 \
    -oyaml \
    --dry-run=client \
    --image=busybox \
    --requests "cpu=100m,memory=256Mi" \
    --limits "cpu=200m,memory=512Mi" \
    --command \
    -- sh -c "sleep 1d"

## Deployment creation yaml file
### Simple
k create deploy deploy1 --image=nginx -oyaml --dry-run=client

### Detailed
#### we generate a deployment into a file
k create deploy deploy1 -oyaml --image=busybox --dry-run=client > deploy1.yaml
#### generate pod yaml and append to same file
k run deploy1 \
    -oyaml \
    --dry-run=client \
    --image=busybox \
    --requests "cpu=100m,memory=256Mi" \
    --limits "cpu=200m,memory=512Mi" \
    --command \
    -- sh -c "sleep 1d" >> deploy1.yaml
#### now edit deploy1.yaml, copy everything you need from the pod yaml
vim deploy1.yaml


> ##Create a Job YAML
 ### Simple
 k create job job1 -oyaml --dry-run=client --image=busybox
### Detail
#### we can create a job
k create job job1 -oyaml --image=busybox --dry-run=client > job1.yaml
#### we create a pod to copy yaml from
k run job1 \
    -oyaml \
    --dry-run=client \
    --image=busybox \
    --requests "cpu=100m,memory=256Mi" \
    --limits "cpu=200m,memory=512Mi" \
    --command \
    -- sh -c "sleep 1d" >> job1.yaml
#### edit and copy the containers section from pod
vim job1.yaml
#### Here you have to make sure that the Job template still contains 
restartPolicy: Never or restartPolicy: OnFailure.


> 
## Create CronJob YAML

### Simple
k create cj cj1 -oyaml --dry-run=client --schedule="* * * * *" --image=busybox

### Detailed
# we create the cronjob yaml
k create cj cj1 -oyaml --dry-run=client --schedule="* * * * *" --image=busybox > cj1.yaml
#### now the pod yaml
k run cj1 \
    -oyaml \
    --dry-run=client \
    --image=busybox \
    --requests "cpu=100m,memory=256Mi" \
    --limits "cpu=200m,memory=512Mi" \
    --command \
    -- sh -c "sleep 1d" >> cj1.yaml
#### edit and copy the containers section from pod
vim cj1.yaml






