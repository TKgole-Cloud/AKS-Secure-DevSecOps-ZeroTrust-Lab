# AKS Secure DevSecOps & Zero Trust Lab

## Overview

This project demonstrates the deployment, security, intentional failure,
investigation, and remediation of a containerized workload running on
Azure Kubernetes Service (AKS).

The project follows:

> BUILD → AUTOMATE → SECURE → BREAK → INVESTIGATE → FIX → VALIDATE → DOCUMENT

## Architecture

The lab will progressively build:

- Azure infrastructure
- Azure Container Registry
- Azure Kubernetes Service
- GitHub Actions CI/CD
- Kubernetes workload security
- Zero Trust IAM
- RBAC and least privilege
- Network security
- Controlled attack scenarios
- Troubleshooting and remediation

## Part 1 — Azure Foundation

Terraform successfully provisioned the initial Azure foundation.

### Resources Created

- Resource Group: `rg-aks-zero-trust-lab`
- Virtual Network: `vnet-aks-zero-trust`
- AKS Subnet: `snet-aks`
- Azure Container Registry: `zembeakszerotrust01`

### Infrastructure Flow

```text
Terraform
   │
   ▼
Azure Resource Group
   │
   ├── VNet
   │    └── AKS Subnet
   │
   └── Azure Container Registry

   ## Part 2 — Application Containerization

A lightweight Node.js/Express API was created as the workload for the lab.

### Application Endpoints

- `/` — application status
- `/health` — health check

### Containerization

The application was packaged into a Docker container using:

```text
node:24-alpine

## Part 3 — Azure Container Registry

The container image was pushed from the local Docker environment into
Azure Container Registry (ACR).

### Image

```text
zero-trust-api:v1

## Part 4 — Azure Kubernetes Service

The AKS cluster was deployed using Terraform.

### Cluster Configuration

- Cluster: `aks-zero-trust-lab`
- Node count: `1`
- VM size: `Standard_D2s_v6`
- Kubernetes networking: Azure CNI
- Network policy: Azure
- Identity: System-assigned managed identity
- Container registry access: `AcrPull`

### AKS → ACR Access

The AKS kubelet managed identity was granted the minimum required
`AcrPull` role on the Azure Container Registry.

```text
AKS Managed Identity
        │
        │ AcrPull
        ▼
Azure Container Registry
        │
        └── zero-trust-api:v1