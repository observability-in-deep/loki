#!/bin/bash

validate_os() {
    if [[ "$OSTYPE" != "linux-gnu"* ]]; then
        echo "This script is intended to run on Linux. Please visit the following URL to install on your OS:"
        echo "https://kubernetes.io/docs/tasks/tools/install-minikube/" https://kind.sigs.k8s.io/docs/user/quick-start/#installation 
        exit 1
    fi
}

echo "Choose an option to install:"
echo "1) Minikube"
echo "2) Kind"
read -p "Enter your choice [1 or 2]: " choice

case $choice in
    1)
        echo " Validade to install minikube..."
        validate_os
        # check if kubectl is installed
        if ! [ -x "$(command -v kubectl)" ]; then
            echo "kubectl is not installed. Please install kubectl first."
            exit 1
        fi
        #check if minikube is installed
        if ! [ -x "$(command -v minikube)" ]; then
            echo "minikube is not installed. installing."
            curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
            sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
        else
            echo "minikube is already installed."
        fi
        ;;
    2)
        echo "Validate to install kind..."
        validate_os
        # check if kubectl is installed
        if ! [ -x "$(command -v kubectl)" ]; then
            echo "kubectl is not installed. Please install kubectl first."
            exit 1
        fi
        #check if kind is installed
        if ! [ -x "$(command -v kind)" ]; then
            echo "kind is not installed. installing .. "
            curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
            chmod +x ./kind
            sudo mv ./kind /usr/local/bin/kind
        else
            echo "kind is already installed."
        fi
        ;;
    *)
        echo "Invalid choice. Please enter 1 or 2."
        ;;
esac