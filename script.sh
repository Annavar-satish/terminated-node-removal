#!/bin/sh
until kubectl get nodes | grep 'NotReady'
do
  echo 'Deleting the Not Ready node'
  node_id=$(kubectl get nodes | grep 'NotReady' | awk '{print $1}')
  kubectl delete node $node_id
  sleep 5
done
