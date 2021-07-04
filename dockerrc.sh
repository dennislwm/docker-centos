alias dbs='docker container run --rm -it --network host --pid host --userns host --cap-add audit_control \
    -e DOCKER_CONTENT_TRUST=$DOCKER_CONTENT_TRUST \
    -v /var/lib:/var/lib \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /usr/lib/systemd:/usr/lib/systemd \
    -v /etc:/etc --label docker_bench_security \
    docker/docker-bench-security'
alias dkd='docker stack deploy --compose-file docker-compose.yml prometheus'
alias dkl='docker stack ls'
alias dsl='docker service ls'
alias chown1='sudo chown nfsnobody:nfsnobody -R /var/lib/docker/volumes/prometheus_data'
alias chown2='sudo chown nfsnobody:nfsnobody prometheus.yml'
