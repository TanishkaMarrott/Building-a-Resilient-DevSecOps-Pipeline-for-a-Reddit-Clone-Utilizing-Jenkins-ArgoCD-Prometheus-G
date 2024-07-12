#!/bin/bash

# Add Helm repositories
helm repo add jenkins https://charts.jenkins.io
helm repo add sonarqube https://charts.sonarqube.org
helm repo add trivy https://charts.trivy.dev

# Update Helm repositories
helm repo update

# Create namespaces
kubectl create namespace devsecops

# Install Jenkins
helm install jenkins jenkins/jenkins --namespace devsecops

# Install SonarQube
helm install sonarqube sonarqube/sonarqube --namespace devsecops

# Install Trivy
helm install trivy trivy/trivy --namespace devsecops
