#1616429943
sudo rm go
#1616429950
go
#1616429955
cd
#1616429956
go
#1616429962
echo $PATH
#1616429970
go
#1616429980
cd /usr/bin/
#1616429989
ln -s go /usr/local/bin/go
#1616429992
sudo ln -s go /usr/local/bin/go
#1616429995
go
#1616430004
sudo rm go
#1616430011
sudo rm ./go
#1616430013
ll
#1616430016
ls g*
#1616430024
ls -al go
#1616430030
ls -al g*
#1616430081
sudo ln -s go /usr/local/go/bin/go
#1616430094
sudo ln -s /usr/local/go/bin/go go
#1616430095
go
#1616430098
go version
#1616430107
sudo rm gofmt
#1616430117
ln -s /usr/local/go/bin/gofmt .
#1616430122
ln -s /usr/local/go/bin/gofmt gofmt
#1616430127
sudo ln -s /usr/local/go/bin/gofmt gofmt
#1616430129
gofmt
#1616430133
gofmt -v
#1616430139
gofmt version
#1616430145
gofmt -h
#1616490804
make check.lint
#1616491534
go vet ./...
#1616491600
make check.lint
#1616494725
go vet ./...
#1616494805
make check.lint
#1616514766
make build.swagger 
#1616512896
kgp
#1616512967
k get services
#1616478369
ctp
#1616478386
cd stores.postgresql
#1616478388
nv
#1616478609
git branch
#1616478624
git branch CTP-2577-add-user-for-device-state-readonly 
#1616478625
nv
#1616478634
git checkout  CTP-2577-add-user-for-device-state-readonly 
#1616478636
nv
#1616479354
cd ..
#1616479358
cd services.orchestrator
#1616479359
nv
#1616483994
cd ..
#1616484000
cd pipelines.kas-relay.deploy/
#1616484001
nv
#1616488983
cd ..
#1616488984
ls
#1616489932
cd stores.postgresql
#1616489933
ll
#1616490186
git lg
#1616490199
git checkout master
#1616490201
git pull
#1616490259
glo
#1616490291
gli
#1616490293
git lg
#1616490306
clear
#1616490323
git branch
#1616490333
glo
#1616490363
clear
#1616490365
git st
#1616490378
git checkout CTP-2577-add-user-for-device-state-readonly 
#1616490380
glo
#1616490496
cd ..
#1616490500
cd pipelines.map-matching/
#1616490504
git checkout master
#1616490505
git pull
#1616490509
nv .wwhrd.yml 
#1616490562
git st
#1616490585
git diff
#1616490630
git ci -a -m "fix licences"
#1616490632
git push
#1616490638
cd ..
#1616490716
ctp
#1616490718
cd pipelines.dispatcher
#1616490720
nv
#1616490968
cd ..
#1616490995
cd pipelines.map-matching/
#1616490996
ll
#1616491001
nv
#1616491032
nv Jenkinsfile 
#1616491114
git diff
#1616491129
git ci -a - m "fix CD_deploy_job"
#1616491131
git push
#1616491133
git st
#1616491143
git add --all
#1616491146
git ci -a - m "fix CD_deploy_job"
#1616491153
git ci -a -m "fix CD_deploy_job"
#1616491155
git push
#1616491225
cd ..
#1616491230
cd pipelines.kas-relay
#1616491233
nv Jenkinsfile 
#1616491266
cd ..
#1616491272
cd pipelines.kas-relay.deploy/
#1616491274
nv 
#1616491491
cd ..
#1616491495
cd pipelines.kas-relay
#1616491496
nv
#1616491777
cd ..
#1616491782
cd pipelines.connector.mqtt2kafka/
#1616491787
nv
#1616492390
git st
#1616492406
git diff Jenkinsfile
#1616492415
git checkout Jenkinsfile
#1616492418
git st
#1616492421
git diff
#1616492437
nv 
#1616492451
make check.lint
#1616492459
git st
#1616492470
git ci -a -m "fix logs & makefile"
#1616492471
git push
#1616492828
cd ..
#1616493103
cd pipelines.connector.kafka2postgres
#1616493104
nv
#1616495185
cd ..
#1616495193
cd stores.postgresql
#1616495200
git checkout master 
#1616495201
git pull
#1616495217
git checkout CTP-2577-add-user-for-device-state-readonly 
#1616495222
git rebase master
#1616495225
git st
#1616495233
git mergetools
#1616495237
git mergetool
#1616495274
sudo dnf install bcompare
#1616495292
sudo dnf install bc
#1616495307
git mergetool
#1616495344
sudo dnf install meld
#1616495406
git mergetool 
#1616496119
git st
#1616496126
git rebase continue
#1616496129
git rebase --continue
#1616496145
git st
#1616496156
git push
#1616496168
git lg
#1616496205
git push
#1616496217
git push --force
#1616496586
cd ..
#1616496593
cd services.auth.mqtt
#1616496594
nv
#1616497739
cd ..
#1616497743
cd pipelines.dispatcher
#1616497749
git checkout master
#1616497750
git pull
#1616497753
nv
#1616503498
kgp
#1616503506
k logs dispatcher-7f696d4d9d-hf8v6
#1616503516
nv 
#1616503702
git ci -a -m "trim brokers"
#1616503703
git push
#1616503708
kgp
#1616503722
gp
#1616503725
kgp 
#1616503742
kgp log vernemq-mqtt2kafka-0 mqtt2kafka
#1616503747
kgp logs vernemq-mqtt2kafka-0 mqtt2kafka
#1616503751
kgp logs vernemq-mqtt2kafka-0
#1616503756
k logs vernemq-mqtt2kafka-0
#1616503761
k logs vernemq-mqtt2kafka-0 mqtt2kafka
#1616503782
gp
#1616503784
kgp
#1616503917
k logs dispatcher-7db5dcbd6c-8d98h
#1616503981
kgp
#1616505647
cd ..
#1616505655
cd services.auth.mqtt.deploy/
#1616505661
nv
#1616506127
kgp
#1616506140
k logs mqtt-auth-service-866b757875-jnfc4
#1616506160
k describe mqtt-auth-service-866b757875-jnfc4
#1616506170
k describe pod mqtt-auth-service-866b757875-jnfc4
#1616506537
k get secrets
#1616506575
k describe mqtt-auth-service-publish
#1616506580
k describe secret mqtt-auth-service-publish
#1616507574
k get secret
#1616508231
kgp
#1616508236
k get secrets
#1616508243
kgp
#1616508258
k restart pod mqtt-auth-service-866b757875-jnfc4
#1616508264
k 
#1616508335
k rolling deployment mqtt-auth-service
#1616508346
k rollout restart deployment mqtt-auth-service
#1616508351
kgp
#1616508365
k logs mqtt-auth-service-866b757875-jnfc4
#1616508716
kgp
#1616508729
k logs mqtt-auth-service-b5bf4bb74-ndlcr
#1616508839
kgp
#1616508855
k logs mqtt-auth-service-b5bf4bb74-ndlcr
#1616508858
kgp
#1616508866
k logs mqtt-auth-service-b48995b69-gzl64
#1616508906
k get secrets
#1616509115
kgp
#1616509135
k logs mqtt-auth-service-57b64d5cd9-8k9kz
#1616509281
kgp
#1616509292
k logs mqtt-auth-service-77c4d745b4-tgdxh
#1616509374
kgp
#1616512056
k logs mqtt-auth-service-77c4d745b4-tgdxh
#1616512406
k describe configMap 
#1616512413
k get configMap
#1616512424
k describe configMap mqtt-auth-config
#1616512427
kgp
#1616512436
k logs -f mqtt-auth-service-77c4d745b4-tgdxh
#1616512578
k describe configMap mqtt-auth-config
#1616512581
k logs -f mqtt-auth-service-77c4d745b4-tgdxh
#1616512591
kgp
#1616512600
k get logs mqtt-auth-service-77c4d745b4-tgdxh
#1616512607
k logs mqtt-auth-service-77c4d745b4-tgdxh
#1616512622
k logs -f mqtt-auth-service-77c4d745b4-tgdxh
#1616512691
ll
#1616512693
kgp
#1616512701
k delete mqtt-auth-service-77c4d745b4-tgdxh
#1616512706
k delete pod mqtt-auth-service-77c4d745b4-tgdxh
#1616512718
kgp
#1616512726
k logs mqtt-auth-service-77c4d745b4-97fj2
#1616512730
k logs -f mqtt-auth-service-77c4d745b4-97fj2
#1616513158
kgp
#1616513167
kgp logs -f mqtt-auth-service-77c4d745b4-9cslt
#1616513180
k logs -f mqtt-auth-service-77c4d745b4-9cslt
#1616513192
k describe mqtt-auth-service-77c4d745b4-9cslt
#1616513198
k describe pod mqtt-auth-service-77c4d745b4-9cslt
#1616513246
kgp
#1616513254
k describe pod mqtt-auth-service-77c4d745b4-9cslt
#1616513642
kgp
#1616513651
k logs mqtt-auth-service-77c4d745b4-9cslt
#1616513661
k describe pod mqtt-auth-service-77c4d745b4-9cslt
#1616513870
kgp
#1616513926
k kgp
#1616513928
kgp
#1616513935
k logs mqtt-auth-service-7d445f58d5-w22zs
#1616513944
k logs -f mqtt-auth-service-7d445f58d5-w22zs
#1616515169
kgp
#1616515181
k logs -f mqtt-auth-service-7d445f58d5-w22zs
#1616515597
kgp
#1616515607
k logs -f dispatcher-5db67d986f-7slt7
#1616515666
kgp
#1616515680
k log -f mqtt-auth-service-7d445f58d5-w22zs
#1616515685
k logs -f mqtt-auth-service-7d445f58d5-w22zs
#1616512801
kgp
#1616512808
k logs vernemq-mqtt2kafka-0
#1616512815
k logs vernemq-mqtt2kafka-0 mqtt2kafka
#1616512829
k logs vernemq-mqtt2kafka-0 vernemq
#1616512846
kgp
#1616512854
k delete pod vernemq-mqtt2kafka-0
#1616512868
kgp
#1616512878
k logs -f vernemq-mqtt2kafka-0 vernemq
#1616515196
kgp
#1616515205
k delete pod vernemq-mqtt2kafka-0
#1616515228
kgp
#1616515239
k logs -f vernemq-mqtt2kafka-0 vernemq
#1616516724
dps
#1616516733
dl
#1616516743
docker container logs vernemq-2
#1616516761
docker container exec -it vernemq-2 bash
#1616522463
make build.swagger 
#1616523150
dps
#1616516699
ctp
#1616516703
cd services.auth.mqtt
#1616516705
nv 
#1616516854
make run.infra.stop
#1616516878
docker image rm vernemq:latest 
#1616516883
docker image prune
#1616522386
make run.infra
#1616522395
dps
#1616522404
docker container logs vernemq-2
#1616522420
nv swagger.yaml 
#1616522659
cd ..
#1616522665
cd services.auth.mqtt.deploy/
#1616522724
cd k8s/base/
#1616522751
kustomize edit set image app-image=cloud/continental/ctp/services-auth-mqtt:0.0.1-c824848
#1616522764
cd ..
#1616522767
cd overlays/integration/
#1616522780
cd ..
#1616522795
kustomize k8s/overlays/integration/
#1616522802
kustomize build k8s/overlays/integration/
#1616522824
git st
#1616522827
git diff
#1616522890
kustomize build k8s/overlays/integration/
#1616524610
make build.swagger 
#1616524911
make build.swagger
#1616573555
ctp
#1616573561
cd stores.postgresql
#1616573724
cd ..
#1616573735
cd services.auth.mqtt
#1616574687
k completion bash
#1616574740
k completion bash >> ~/.utils/k_completion
#1616574784
echo 'complete -F __start_kubectl k' >>~/.bashrc
#1616574789
vim .bashrc
#1616574800
cd
#1616574805
vim .bashrc
#1616574883
cd /usr/share/
#1616574891
cd bash-completion/
#1616574891
ll
#1616574906
nv bash_completion 
#1616574963
echo 'source <(kubectl completion bash)' >>~/.bashrc
#1616574965
cd
#1616574969
nv .bashrc 
#1616573745
ctp
#1616573751
cd services.auth.mqtt.deploy/
#1616573759
git checkout master
#1616573760
git pull
#1616573766
git checkout fix_deploy 
#1616573772
git rebase master
#1616573787
git pull
#1616573811
git st
#1616573815
git lg
#1616573831
git push
#1616574466
kgp
#1616574490
kubectl edit 
#1616574540
k list deployment
#1616574544
k get deployment
#1616574571
k edit deployment.apps/mqtt-auth-service
#1616575040
kgp
#1616577024
cd internal/usecase/
#1616577025
ll
#1616577028
go test ./...
#1616577060
cd internal/usecase/
#1616577065
go test ./...
#1616577122
ctp
#1616577134
cd services.auth.mqtt
#1616577138
cd internal/usecase/
#1616577141
go test ./...
#1616581661
git add --all
#1616581672
git ci -am "add strings and fix set pwd"
#1616581677
git push
#1616581687
git push --set-upstream origin fix-set-pwd
#1616581792
make check.lint
#1616583429
git ci -am "temp2"
#1616583431
git push
#1616583896
git ci -am "temp2"
#1616583899
git push
#1616589332
git ci -am "remove stupid debug"
#1616589334
git push
#1616590993
git ci -am "remove stupid debug"
#1616591460
make build.docker
#1616591552
docker tag docker.io/cloud/continental/ctp/services-auth-mqtt:0.0.1-381d09b harbor.registry.prod.cdsf.io/ctp/cloud/continental/ctp/services-auth-mqtt:latest
#1616591585
docker push harbor.registry.prod.cdsf.io/ctp/cloud/continental/ctp/services-auth-mqtt:latest
#1616591705
docker tag 
#1616592083
make build.docker
#1616592133
git st
#1616592144
git ci -am "add some log"
#1616592157
make build.docker
#1616592275
docker tag docker.io/cloud/continental/ctp/services-auth-mqtt:0.0.1-a1799bf harbor.registry.prod.cdsf.io/ctp/cloud/continental/ctp/services-auth-mqtt:latest
#1616592787
docker push harbor.registry.prod.cdsf.io/ctp/cloud/continental/ctp/services-auth-mqtt:latest
#1616575873
ctp
#1616575888
cd vernemq/
#1616575892
nv
#1616575900
git checkout master
#1616575902
git pull
#1616575908
git branch
#1616575913
git branch -D CTP-2478-configure-vernemq-for-auth-webhooks 
#1616575917
nv
#1616592984
:q
#1616575965
k get secrets
#1616576110
kgp
#1616576138
k exec vernemq-mqtt2kafka-0 -- echo $MQTT2KAFKA_MQTT_USERNAME
#1616576155
k exec vernemq-mqtt2kafka-0 mqtt2kafka -- echo $MQTT2KAFKA_MQTT_USERNAME
#1616576175
k describe pod/vernemq-mqtt2kafka-0
#1616576208
k exec vernemq-mqtt2kafka-0/mqtt2kafka -- echo $MQTT2KAFKA_MQTT_USERNAME
#1616576272
k exec vernemq-mqtt2kafka-0 -c mqtt2kafka -- echo $MQTT2KAFKA_MQTT_USERNAME
#1616576291
k exec pod/vernemq-mqtt2kafka-0 -c mqtt2kafka -- echo $MQTT2KAFKA_MQTT_USERNAME
#1616589230
clear
#1616589235
k get configMap
#1616589260
k describe configmaps mqtt2kafka-config 
#1616591329
docker login harbor.registry.prod.cdsf.io
#1616591437
clear
#1616593006
dps
#1616593015
make run.infra
#1616575071
k logs mqtt-auth-service-77c4d745b4-lqlcr 
#1616575079
clear
#1616575110
k get secrets
#1616575116
kgp
#1616575124
k delete pod mqtt-auth-service-77c4d745b4-lqlcr 
#1616575141
k logs mqtt-auth-service-77c4d745b4-mdds6 
#1616575148
k logs -f mqtt-auth-service-77c4d745b4-mdds6 
#1616575238
kgp
#1616575248
k logs -f mqtt-auth-service-77c4d745b4-wt5gv 
#1616575637
kgp
#1616575845
k edit deployments.apps/vernemq-mqtt2kafka
#1616575851
k get deployments.apps 
#1616577559
k delete deployments.apps/mqtt-auth-service
#1616577599
kgp
#1616577609
k logs mqtt-auth-service-5c96ccb5-5qnl7 
#1616577614
kgp
#1616577629
k delete pod vernemq-mqtt2kafka-0 
#1616577650
kgp
#1616577656
k logs -f vernemq-mqtt2kafka-0 
#1616577665
kgp
#1616577667
k logs -f vernemq-mqtt2kafka-0 
#1616577669
k logs -f vernemq-mqtt2kafka-0 vernemq
#1616578071
k delete pod vernemq-mqtt2kafka-0 
#1616580261
k logs -f vernemq-mqtt2kafka-0 vernemq
#1616580267
clear
#1616580269
k logs -f vernemq-mqtt2kafka-0 vernemq
#1616582333
kgp
#1616582338
k logs mqtt-auth-service-5c96ccb5-5h7g7 
#1616582348
k logs -f mqtt-auth-service-5c96ccb5-5h7g7 
#1616582502
kgp
#1616582532
k describe deployments.apps mqtt-auth-service 
#1616582595
k logs mqtt-auth-service-5c96ccb5-5h7g7 
#1616582677
kgp
#1616582691
k delete deployments.apps mqtt-auth-service 
#1616582784
kgp
#1616582791
k logs -f mqtt-auth-service-5c96ccb5-cn74s 
#1616583439
k delete deployments.apps mqtt-auth-service 
#1616583633
kgp
#1616583641
k logs mqtt-auth-service-5c96ccb5-lk94r 
#1616583646
k logs -f mqtt-auth-service-5c96ccb5-lk94r 
#1616583905
k delete deployments.apps mqtt-auth-service 
#1616584135
k logs -f mqtt-auth-service-5c96ccb5-lk94r 
#1616584142
k logs -f mqtt-auth-service-5c96ccb5-55vgt app 
#1616589342
k delete deployments.apps mqtt-auth-service 
#1616589486
kgp
#1616589493
k logs -f mqtt-auth-service-5c96ccb5-tjxf8 
#1616589500
clear
#1616589501
k logs -f mqtt-auth-service-5c96ccb5-tjxf8 
#1616589504
clear
#1616589505
k logs -f mqtt-auth-service-5c96ccb5-tjxf8 
#1616589510
clear
#1616589511
k logs -f mqtt-auth-service-5c96ccb5-tjxf8 
#1616589513
clear
#1616589514
k logs -f mqtt-auth-service-5c96ccb5-tjxf8 
#1616589516
clear
#1616589519
k logs -f mqtt-auth-service-5c96ccb5-tjxf8 
#1616589525
kgp
#1616589538
clear
#1616589539
kgp
#1616589549
k describe pod mqtt-auth-service-5c96ccb5-tjxf8 
#1616589570
kgp
#1616589605
clear
#1616589607
k describe pod mqtt-auth-service-5c96ccb5-tjxf8 
#1616589617
kgp
#1616589623
k delete deployments.apps mqtt-auth-service 
#1616589668
kgp
#1616589681
k logs -f mqtt-auth-service-5c96ccb5-ds9k6
#1616591616
k delete deployments.apps mqtt-auth-service 
#1616591674
kgp
#1616591686
clear
#1616591734
kgp
#1616591743
k logs -f mqtt-auth-service-5c96ccb5-nsqm8 
#1616592696
k delete deployments.apps mqtt-auth-service 
#1616592729
kgp
#1616592740
k logs mqtt-auth-service-5c96ccb5-dnqp7 
#1616592747
k logs -f mqtt-auth-service-5c96ccb5-dnqp7 
#1616592763
kgp
#1616592801
k delete deployments.apps mqtt-auth-service 
#1616592832
kgp
#1616592840
k logs -f mqtt-auth-service-5c96ccb5-2dhhg 
#1616575177
k delete pod vernemq-mqtt2kafka-0 
#1616575198
kgp
#1616575205
k logs vernemq-mqtt2kafka-0 vernemq
#1616575217
k logs -f vernemq-mqtt2kafka-0 vernemq
#1616577705
kgp
#1616577709
k logs mqtt-auth-service-5c96ccb5-5qnl7 
#1616577714
k logs -f mqtt-auth-service-5c96ccb5-5qnl7 
#1616577759
kgp
#1616578017
k logs -f mqtt-auth-service-5c96ccb5-5qnl7 
#1616578024
kgp
#1616578053
k logs mqtt-auth-service-5c96ccb5-5qnl7 
#1616578060
k logs -f mqtt-auth-service-5c96ccb5-5qnl7 
#1616578150
k delete deployments.apps/mqtt-auth-service
#1616578228
kgp
#1616578246
k logs mqtt-auth-service-5c96ccb5-9zvp5 
#1616578252
k logs -f mqtt-auth-service-5c96ccb5-9zvp5 
#1616580128
k delete deployments.apps/mqtt-auth-service
#1616580203
kgp
#1616580233
k logs -f mqtt-auth-service-5c96ccb5-v2p99 
#1616580469
k delete deployments.apps/mqtt-auth-service
#1616580839
k logs -f mqtt-auth-service-5c96ccb5-v2p99 
#1616580845
k logs -f mqtt-auth-service-5c96ccb5-cf6ss 
#1616581987
kgp
#1616582003
k delete deployments.apps/vernemq-mqtt2kafka
#1616582011
k get deployments.apps 
#1616582021
k get statefulsets.apps 
#1616582033
k delete statefulsets.apps/vernemq-mqtt2kafka
#1616582272
kgp
#1616582300
k logs vernemq-mqtt2kafka-0 mqtt2kafka
#1616582321
k logs vernemq-mqtt2kafka-0 vernemq 
#1616582358
k logs -f vernemq-mqtt2kafka-0 vernemq 
#1616582371
kgp
#1616582387
k delete pod vernemq-mqtt2kafka-0 
#1616582410
k edit statefulsets.apps vernemq-mqtt2kafka 
#1616582445
kgop
#1616582447
kgp
#1616582457
k logs vernemq-mqtt2kafka-0 vernemq
#1616582462
k logs -f vernemq-mqtt2kafka-0 vernemq
#1616582803
k delete pod vernemq-mqtt2kafka-0 
#1616589811
kgp
#1616589960
k delete pod vernemq-mqtt2kafka-0 
#1616589975
kgp
#1616589995
k delete statefulsets.apps vernemq-mqtt2kafka 
#1616589997
kgp
#1616590179
k delete pod vernemq-mqtt2kafka-0 --force
#1616590185
kgp
#1616590270
clear
#1616590271
kgp
#1616590274
clear
#1616590276
kgp
#1616590279
clear
#1616590281
kgp
#1616590304
clear
#1616590442
kgp
#1616590576
k describe pod vernemq-mqtt2kafka-0 
#1616591061
k edit po vernemq-mqtt2kafka-0 
#1616591086
clear
#1616591493
docker images
#1616591756
k delete pod vernemq-mqtt2kafka-0 
#1616593150
make run.infra.stop
#1616593180
ctp
#1616593191
cd services.auth.mqtt
#1616593205
make run.auth.publish.ok
#1616593215
nv
#1616593393
make run.auth.subscribe.ok 
#1616593402
nv
#1616594069
make build.docker
#1616594084
git ci -am "test1"
#1616594099
git make build.docker
#1616594107
make build.docker
#1616594146
make build.local
#1616594160
git ci -am "test1"
#1616594162
make build.local
#1616594172
make build.docker
#1616594222
docker tag docker.io/cloud/continental/ctp/services-auth-mqtt:0.0.1-0be64a6 harbor.registry.prod.cdsf.io/ctp/cloud/continental/ctp/services-auth-mqtt:latest
#1616594225
docker push harbor.registry.prod.cdsf.io/ctp/cloud/continental/ctp/services-auth-mqtt:latest
#1616594766
make build.local
#1616594771
make run.local
#1616594801
git ci -am "impl stringer for conf"
#1616594812
make build.docker
#1616594853
docker tag docker.io/cloud/continental/ctp/services-auth-mqtt:0.0.1-6aa973f harbor.registry.prod.cdsf.io/ctp/cloud/continental/ctp/services-auth-mqtt:latest
#1616594856
docker push harbor.registry.prod.cdsf.io/ctp/cloud/continental/ctp/services-auth-mqtt:latest
#1616596494
git ci -am "f"
#1616596498
make build.docker
#1616596546
docker tag docker.io/cloud/continental/ctp/services-auth-mqtt:0.0.1-ed0ed38 harbor.registry.prod.cdsf.io/ctp/cloud/continental/ctp/services-auth-mqtt:latest
#1616596557
docker push harbor.registry.prod.cdsf.io/ctp/cloud/continental/ctp/services-auth-mqtt:latest
#1616596758
git push --help
#1616596826
git ci -am "f" --amend
#1616596842
git ci -am "decomment test topic" --amend
#1616596902
git st
#1616596907
git add --all
#1616596916
git ci -am "add subscribe json"
#1616596919
git st
#1616596921
git lg
#1616596943
git rebase --iteractive 1d6b1f3
#1616596949
git rebase --interactive 1d6b1f3
#1616597021
git st
#1616597031
git rebase --continue
#1616597047
git rebase --edit-todo
#1616597064
git st
#1616597077
git rebase --continue
#1616597080
git lg
#1616597093
git push
#1616597163
make check.lint
#1616597222
git ci -am "fix lint"
#1616597224
git push
#1616593483
ctp
#1616593488
cd services.auth.mqtt
#1616593497
make run.auth.subscribe.ok 
#1616594320
kgp
#1616594324
k delete pod vernemq-mqtt2kafka-0 
#1616595351
k logs vernemq-mqtt2kafka-0 vernemq
#1616595357
clear
#1616596649
k delete pod vernemq-mqtt2kafka-0 
#1616575727
ctp
#1616575735
cd pipelines.connector.mqtt2kafka/
#1616575740
git checkout master
#1616575741
git pull
#1616575745
nv
#1616581268
git pull
#1616581272
git push
#1616581278
git push --force
#1616581301
git lg
#1616581310
git reset --hard HEAD~
#1616581322
git checkout -b fix-set-pwd
#1616581325
nv
#1616593002
clear
#1616593086
make build.local
#1616593795
claer
#1616593796
clear
#1616593797
kgp
#1616593805
k logs -f mqtt-auth-service-5c96ccb5-2dhhg
#1616595065
clar
#1616595066
clear
#1616595068
cd ..
#1616595075
cd services.auth.mqtt.deploy/
#1616595083
nv 
#1616595135
git ci -am "fix env var"
#1616595137
git push
#1616598550
kgp
#1616598556
k logs mqtt-auth-service-6885d55467-t6mx7 
#1616598579
clear
#1616598585
git checkout master
#1616598586
git pull
#1616598667
cd pull
#1616598670
cd ..
#1616598673
cd services.auth.mqtt
#1616598676
git pull
#1616598679
clear
#1616598680
cd ..
#1616598688
cd libs.go.client.postgres/
#1616598693
cd ..
#1616598696
cd libs.go.pipelines/
#1616598700
git fetch
#1616598704
git branch -a
#1616599422
cd ..
#1616599428
cd services.auth.mqtt
#1616599431
nv Jenkinsfile 
#1616599464
cd ..
#1616599470
cd pipelines.connector.kafka2postgres
#1616599476
git checkout master
#1616599479
git pull
#1616599483
nv Jenkinsfile 
#1616599892
git ci -am "add missing quote"
#1616599894
git push
#1616600652
git ci -am "add missing tag image" --amend
#1616600662
git push --force
#1616600667
git pull
#1616606323
k get secrets
#1616606977
ctp
#1616606978
ll
#1616605962
ctp
#1616605968
cd pipelines.connector.kafka2postgres
#1616605970
nv
#1616609784
cd ..
#1616609798
ll
#1616609807
cd pipelines.connector.kafka2postgres
#1616609810
cd internal/
#1616609823
kustomize edit set image app-image=test
#1616609847
cd ..
#1616609863
cd pipelines.connector.kafka2postgres.deploy/k8s/overlays/integration/
#1616609865
kustomize edit set image app-image=test
#1616609874
git diff
#1616609888
nv
#1616609911
kustomize build .
#1616610039
kustomize edit set image app-image=test:v1
#1616610042
kustomize build .
#1616610250
kustomize edit set image app-image=test:v1
#1616610252
git st
#1616610255
git diff
#1616610271
kustomize build .
#1616610873
:q
#1616610888
ctp
#1616610892
cd pipelines.connector.kafka2postgres
#1616610896
nv Makefile 
#1616612086
go vet ./...
#1616612092
make build.local
#1616612097
make run.local
#1616611567
ctp
#1616611575
cd pipelines.connector.kafka2postgres.deploy/
#1616611577
cd ..
#1616611580
cd pipelines.connector.kafka2postgres
#1616611581
nv
#1616611649
clear
#1616611867
nv
#1616612249
make run.local
#1616612268
git st
#1616612270
git add --all
#1616612281
git ci -am "implement stringer for kafka config"
#1616612283
git push
#1616612286
clear
#1616613220
ctp
#1616613224
cd stores.p
#1616613227
cd stores.postgresql
#1616613237
git checkout master
#1616613239
git pull
#1616613245
nv
#1616613966
git diff
#1616613983
git ci -am "fix some typos"
#1616613984
git push
#1616613257
ctp
#1616613265
cd stores.postgresql
#1616613267
nv
#1616612456
bas64
#1616612460
man base64
#1616612480
echo "bG9jYXRpb25zX2hhbmRsZXI=" | base64 --decode -
#1616612505
echo "SmVua2luc2ZpbGUgTWFrZWZpbGUgUkVBRE1FLm1kIFZFUlNJT04gZGVwbG95IGdlbmVyYXRlIGdvLm1vZCBnby5zdW0gZ290ZXN0IGt1YmVjb25maWcuY29uZiBsb2NhbCBtb2RlbHMgcmRzLXVybC50eHQgc3FsIHRlcnJhZm9ybSB0ZXJyYWZvcm1AdG1wIHRvbGxpbmdtb2RlbHM=" | base64 --decode -
#1616612530
man base64
#1616612547
echo "azerty" | base64 -
#1616612573
echo "YXplcnR5Cg==" | base64 --decode -
#1616613156
echo "SmVua2luc2ZpbGUgTWFrZWZpbGUgUkVBRE1FLm1kIFZFUlNJT04gZGVwbG95IGdlbmVyYXRlIGdvLm1vZCBnby5zdW0gZ290ZXN0IGt1YmVjb25maWcuY29uZiBsb2NhbCBtb2RlbHMgcmRzLXVybC50eHQgc3FsIHRlcnJhZm9ybSB0ZXJyYWZvcm1AdG1wIHRvbGxpbmdtb2RlbHM=" | base64 --decode -
#1616613200
echo "YXplcnR5MTIzNDU2" | base64 --decode -
#1616613326
echo "YXplcnR5" | base64 --decode -
#1616613329
clear
#1616613605
echo "SmVua2luc2ZpbGUgTWFrZWZpbGUgUkVBRE1FLm1kIFZFUlNJT04gZGVwbG95IGdlbmVyYXRlIGdvLm1vZCBnby5zdW0gZ290ZXN0IGt1YmVjb25maWcuY29uZiBsb2NhbCBtb2RlbHMgcmRzLXVybC50eHQgc3FsIHRlcnJhZm9ybSB0ZXJyYWZvcm1AdG1wIHRvbGxpbmdtb2RlbHM=" | base64 --decode -
#1616654383
make check.lint
#1616654403
git st
#1616654414
git ci -am "split brokers"
#1616654415
git push
#1616611202
ctp
#1616611208
cd pipelines.connector.kafka2postgres.deploy/
#1616611219
cd k8s/overlays/integration/
#1616611239
kustomize edit set image app-image=harbor.registry.prod.cdsf.io/ctp/cloud/continental/ctp/pipelines-connector-kafka2postgres:latest
#1616611242
git diff
#1616611259
kustomize build . | kubectl apply --force
#1616611280
kustomize build . | kubectl apply -f --force
#1616611327
kustomize build .
#1616611363

#1616611782
kustomize build . | kubectl apply -f - --force
#1616612128
docker container ls
#1616612136
docker container ls -a
#1616612146
docker start docker.repo.tooling.prod.cdsf.io/cloud/continental/ctp/tools/dev/local-postgres:latest
#1616612185
docker start postgres 
#1616612297
clear
#1616612299
kgp
#1616612313
k logs pipelines-connector-kafka2postgres-7fb7968ffd-vgw7f 
#1616612336
k get secretes
#1616612341
k get secrets
#1616612364
k describe secret postgres-locations-handler 
#1616612441
k edit secrets postgres-locations-handler 
#1616613115
clear
#1616613119
kgp
#1616613124
k get secrets
#1616613137
k edit secrets postgres-locations-handler 
#1616613186
k edit secrets postgres-mqtt-auth-service 
#1616613296
k edit secrets postgres-obu-tracker-service 
#1616613309
k edit secrets postgres-user-auth-service 
#1616613589
k edit secrets postgres-locations-handler 
#1616613789
k delete secrets postgres-locations-handler 
#1616613808
k get secrets
#1616613877
kgp
#1616613880
k get secrets
#1616613889
k edit secrets postgres-locations-handler 
#1616613898
clear
#1616613999
k delete deployments.apps pipelines-connector-kafka2postgres 
#1616614002
kgp
#1616614022
k logs test-debug 
#1616614039
k delete deployments.apps test-debug
#1616614044
kgp
#1616614050
k delete pod test-debug 
#1616614062
kgp
#1616614072
k logs pipelines-connector-kafka2postgres-7fb7968ffd-55wxl 
#1616614086
ctp
#1616614091
cd pipelines.connector.kafka2postgres
#1616614103
make logs
#1616654306
nv
#1616657121
ctp
#1616657128
cd pipelines.map-matching/
#1616657129
nv
#1616657143
cd ..
#1616657150
cd pipelines.connector.kafka2postgres
#1616657151
nv
#1616657302
ctp
#1616657309
cd pipelines.connector.kafka2postgres
#1616657320
git ci -am "fix kakfa clientid"
#1616657324
git push
#1616657327
nv
#1616605771
ctp
#1616605780
cd pipelines.connector.kafka2postgres.deploy/
#1616605783
cd ..
#1616605790
cd services.auth.mqtt.deploy/
#1616605886
nv
#1616606176
cd ..
#1616606177
ll
#1616606188
cd pipelines.kas-relay
#1616606190
cd ..
#1616606193
cd pipelines.kas-relay.deploy/
#1616606202
git checkout master
#1616606203
git pull
#1616606205
nv
#1616606417
cd ..
#1616606418
ll
#1616606426
cd pipelines.dispatcher.deploy/
#1616606427
nv
#1616606664
cd ..
#1616606670
cd services.auth.mqtt.deploy/
#1616606671
nv
#1616609096
kgp
#1616609131
k describe deployments.apps pipelines-connector-kafka2postgres 
#1616609159
kgp
#1616609298
k describe deployments.apps pipelines-connector-kafka2postgres 
#1616609309
gp
#1616609310
kgp
#1616609314
k describe deployments.apps pipelines-connector-kafka2postgres 
#1616609530
kgp
#1616609550
k describe pipelines-connector-kafka2postgres-75b9bcbd5f-4qtf5
#1616609574
kgp
#1616609584
k describe pipelines-connector-kafka2postgres-74c6dcfb7c-5rmp7
#1616609595
k describe pipelines-connector-kafka2postgres-75b9bcbd5f-4qtf5
#1616609603
k describe deployments.apps pipelines-connector-kafka2postgres 
#1616609672
kgp
#1616609977
k delete deployments.apps pipelines-connector-kafka2postgres 
#1616610305
kgp
#1616610317
k describe deployments.apps mqtt-auth-service 
#1616610644
clear
#1616610646
kgp
#1616610671
k describe deployments.apps pipelines-connector-kafka2postgres 
#1616610679
kgp
#1616610776
k describe deployments.apps pipelines-connector-kafka2postgres 
#1616610830
kgp
#1616610845
k logs pipelines-connector-kafka2postgres-7fb7968ffd-hckxs 
#1616610944
k get configmaps
#1616610956
k describe pipelines-connector-kafka2postgres
#1616610964
k describe configmap pipelines-connector-kafka2postgres
#1616610989
clear
#1616610990
kgp
#1616611032
k get events
#1616611061
kubectl get events --sort-by='.metadata.creationTimestamp'
#1616611092
k get configmaps
#1616611296
kgp
#1616611316
k delete deployments.apps  pipelines-connector-kafka2postgres 
#1616611319
kgp
#1616611521
k get configmaps
#1616611533
k delete configmaps pipelines-connector-kafka2postgres*
#1616611535
k delete configmaps pipelines-connector-kafka2postgres
#1616611539
k delete configmaps pipelines-connector-kafka2postgres-config 
#1616611541
celar
#1616611543
clear
#1616611748
kgp
#1616611763
k delete deployments.apps pipelines-connector-kafka2postgres 
#1616611790
kgp
#1616611798
k logs pipelines-connector-kafka2postgres-7fb7968ffd-vgw7f 
#1616612587
kgp
#1616612604
k delete deployments.apps pipelines-connector-kafka2postgres 
#1616612625
clear
#1616612628
kgp
#1616612637
k logs pipelines-connector-kafka2postgres-7fb7968ffd-lglj7 
#1616612672
kgp
#1616612679
k logs pipelines-connector-kafka2postgres-7fb7968ffd-lglj7 
#1616612811
clear
#1616612813
kgp
#1616612821
k delete pod pipelines-connector-kafka2postgres-7fb7968ffd-lglj7 
#1616612826
kgp
#1616612831
k logs pipelines-connector-kafka2postgres-7fb7968ffd-99q9r 
#1616654039
kgp
#1616654053
k get secrets
#1616654085
k delete secrets postgres-mqtt-auth-handler
#1616654162
cd ..
#1616654168
cd pipelines.connector.kafka2postgres.deploy/
#1616654179
cd k8s/overlays/integration/
#1616654194
k describe deployments.apps pipelines-connector-kafka2postgres 
#1616654209
kustomize edit set image app-image=harbor.registry.prod.cdsf.io/ctp/cloud/continental/ctp/pipelines-connector-kafka2postgres:latest
#1616654212
git diff
#1616654220
kustomize build .
#1616654237
k delete deployments.apps pipelines-connector-kafka2postgres 
#1616654251
kustomize build . | kubectl apply -f - --force
#1616654260
kgp
#1616654266
k logs pipelines-connector-kafka2postgres-bf49cc5bb-5zrp5 
#1616654596
kgp
#1616654607
k delete deployments.apps pipelines-connector-kafka2postgres 
#1616654610
kgp
#1616654719
kustomize build . | kubectl apply -f - --force
#1616654726
kgp
#1616654736
k logs pipelines-connector-kafka2postgres-bf49cc5bb-z9hms 
#1616655073
kustomize build . | kubectl apply -f - --force
#1616655200
kustomize build . 
#1616655211
kustomize build . | kubectl apply -f - --force
#1616655217
kgp
#1616655228
k logs pipelines-connector-kafka2postgres-bf49cc5bb-pksj5 
#1616657295
nv
#1616657853
cd ..
#1616657856
nv
#1616658717
cd ..
#1616658721
cd stores.postgresql
#1616658724
nv 
#1616658802
ctp
#1616658806
cd stores.postgresql
#1616658807
nv
#1616662751
git ci -am "fix image name"
#1616662754
git push
#1616660244
ctp
#1616660252
cd pipelines.map-matching.deploy/
#1616660257
cd k8s/overlays/integration/
#1616660263
kustomize build .
#1616660626
stat /home/cosmin/projects/tolling-proxy/pipelines.map-matching.deploy/k8s/base/secrets
#1616660649
stat /home/cosmin/projects/tolling-proxy/pipelines.map-matching.deploy/k8s/base/secrets/
#1616660653
stat /home/cosmin/projects/tolling-proxy/pipelines.map-matching.deploy/k8s/base/
#1616660659
ls /home/cosmin/projects/tolling-proxy/pipelines.map-matching.deploy/k8s/base/
#1616661187
kustomize build .
#1616661595
kustomize build . | kubectl apply -f - --force
#1616661653
kgp
#1616661675
k delete deployments.apps pipelines-map-matching 
#1616662239
k describe deployments.apps pipelines-map-matching 
#1616662261
k delete deployments.apps pipelines-map-matching 
#1616664668
make build.docker
#1616664711
make push.harbor 
#1616666254
make proto.gen.go
#1616666260
git st
#1616666317
git diff
#1616666900
make proto.gen.go
#1616666928
docker images | grep protp
#1616666931
docker images | grep proto
#1616666971
docker image rm cloud/continental/ctp/lib-proto-message:latest
#1616666979
make proto.gen.go
#1616667096
make build.docker
#1616667532
make proto.gen.go
#1616667537
git diff
#1616667556
git st
#1616667559
git diff
#1616667849
make proto.gen.go
#1616667856
git st
#1616667859
git diff
#1616667888
protoc
#1616667891
protoc --version
#1616668592
git st
#1616668597
git diff
#1616665942
ctp
#1616665944
ll
#1616665960
cd libs.proto.messages/
#1616665965
git checkout master
#1616665966
git pull
#1616665970
nv
#1616666005
git checkout -b CPT-2656-wrong-type-for-cellID
#1616666008
nv
#1616605696
ctp
#1616605706
cd pipelines.connector.kafka2postgres.deploy/
#1616605711
git pull
#1616605715
git st
#1616605733
git ci -am "fix jenkins"
#1616605737
git push
#1616605741
nv 
#1616606879
nv
#1616656414
git st
#1616656419
git diff
#1616656986
CD ..
#1616656990
cd ..
#1616656995
cd pipelines.map-matching/
#1616656997
nv
#1616659539
nv Jenkinsfile 
#1616661319
git st
#1616661329
git diff
#1616661465
git ci -am "fix jenkins&split kafka config"
#1616661467
git push
#1616662165
ll
#1616662707
nv
#1616663164
cd ..
#1616663168
cd pipelines.map-matching.deploy/
#1616663170
nv
#1616663291
cd ..
#1616663298
cd pipelines.connector.kafka2postgres.deploy/
#1616663299
vf
#1616664336
cd ..
#1616664340
cd pipelines.connector.kafka2postgres
#1616664346
nv custom.mk 
#1616743016
df -h /
#1616741071
ll
#1616741081
cd .urxvt/
#1616741082
ll
#1616741084
cd ..
#1616741107
cd .dotfiles/
#1616741109
git st
#1616741115
ll
#1616741119
cd Xresource/
#1616741120
l
#1616741122
ll
#1616741137
git add --all
#1616741142
git add .Xresources 
#1616741161
git ci -am "add complation for kube"
#1616741183
cat vifm/.config/vifm/vifminfo.json
#1616741189
cat .config/vifm/vifminfo.json
#1616741196
cd ..
#1616741200
cat vifm/.config/vifm/vifminfo.json
#1616741209
git st
#1616741219
git lg
#1616741233
git reset --soft HEAD~
#1616741234
git st
#1616741246
git rm --cached vifm/.config/vifm/vifminfo.json
#1616741248
git st
#1616741259
echo "vifm/.config/vifm/vifminfo.json" >> .gitignore
#1616741261
git st
#1616741270
git add --all
#1616741271
git st
#1616741286
git ci -am --ammend
#1616741291
git push
#1616741424
ll
#1616741440
git push
#1616741459
ll
#1616741461
cd ..
#1616741462
ll
#1616741468
cd .local/share/
#1616741469
ll
#1616741472
cd fonts/
#1616741472
ll
#1616741476
cd NerdFonts/
#1616741477
ll
#1616741483
cd ..
#1616741502
tar -xzf NerdFonts/ nerd.tar.gz
#1616741519
tar -czf nerd.tar.gz NerdFonts/
#1616741521
ll
#1616741537
mv nerd.tar.gz /mnt/
#1616742584
cd /mnt
#1616742584
ll
#1616742743
kgp
#1616742888
cat /etc/fstab 
#1616742958
kgp
#1616742972
k logs pipelines-connector-kafka2postgres-f99fbdc9c-lpmrj 
#1616742989
kgp
#1616743001
k delete pod pipelines-connector-kafka2postgres-f99fbdc9c-lpmrj 
#1616743024
kgp
#1616743035
k logs pipelines-connector-kafka2postgres-f99fbdc9c-hxrg7 
#1616743081
xrandr
#1616743095
cvt
#1616743133
clear
#1616743137
xrandr
#1616743150
kgp
#1616747086
k describe deployments.apps pipelines-connector-kafka2postgres 
#1616747105
k edit deployments.apps pipelines-connector-kafka2postgres 
#1616747307
k describe configmap pipelines-connector-kafka2postgres-config 
#1616747384
kgp
#1616747395
k logs pipelines-map-matching-68b89cccb7-98g4t 
#1616747429
kgp
#1616747441
k logs pipelines-connector-kafka2postgres-f99fbdc9c-hxrg7 
