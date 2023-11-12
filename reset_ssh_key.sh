#!/bin/bash

ssh-keygen -f "$HOME/.ssh/known_hosts" -R k8s-master1.element
ssh-keygen -f "$HOME/.ssh/known_hosts" -R k8s-master2.element
ssh-keygen -f "$HOME/.ssh/known_hosts" -R k8s-master3.element
ssh-keygen -f "$HOME/.ssh/known_hosts" -R k8s-worker1.element
ssh-keygen -f "$HOME/.ssh/known_hosts" -R k8s-worker2.element
ssh-keygen -f "$HOME/.ssh/known_hosts" -R k8s-worker3.element
