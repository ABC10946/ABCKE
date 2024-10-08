#!/bin/bash

ssh-keygen -f "$HOME/.ssh/known_hosts" -R k8s-master1.local
ssh-keygen -f "$HOME/.ssh/known_hosts" -R k8s-master2.local
ssh-keygen -f "$HOME/.ssh/known_hosts" -R k8s-master3.local
ssh-keygen -f "$HOME/.ssh/known_hosts" -R k8s-worker1.local
ssh-keygen -f "$HOME/.ssh/known_hosts" -R k8s-worker2.local
ssh-keygen -f "$HOME/.ssh/known_hosts" -R k8s-worker3.local
