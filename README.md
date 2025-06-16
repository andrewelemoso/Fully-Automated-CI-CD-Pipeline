# Fully-Automated CI/CD Pipeline with Terraform and Azure

This repository contains Infrastructure as Code (IaC) using Terraform to provision and manage Azure resources with automated CI/CD pipeline using GitHub Actions.

## Architecture Overview

The infrastructure includes:
- Azure Kubernetes Service (AKS)
- Azure Storage
- Virtual Networks
- Microsoft Entra ID (Azure AD) Integration
- RBAC Configuration

## Prerequisites

- Azure Subscription
- GitHub Account
- Azure CLI
- Terraform
- Service Principal with required permissions

## Repository Structure

```
├── Terraform/
│   ├── main.tf
│   ├── outputs.tf
│   ├── providers.tf
│   ├── variables.tf
│   └── modules/
│       ├── aks/
│       ├── Azure-AD/
│       ├── entra-id/
│       ├── rbac/
│       ├── storage/
│       ├── vnet/
│       └── vnet peering/
└── .github/
    └── workflows/
        └── terraform.yml
```

## Setup Instructions

1. **Azure Prerequisites**
   - Create an Azure Service Principal
   - Create Azure Storage Account for Terraform state
   - Configure necessary RBAC permissions

2. **GitHub Configuration**
   - Add required GitHub Secrets:
     - AZURE_CLIENT_ID
     - AZURE_CLIENT_SECRET
     - AZURE_SUBSCRIPTION_ID
     - AZURE_TENANT_ID
     - AZURE_STORAGE_ACCOUNT
     - AZURE_STORAGE_KEY
     - AZURE_STORAGE_CONTAINER
     - AZURE_TFVARS_BLOB
     - AZURE_RG
     - AZURE_KEY

3. **Local Development Setup**
   ```bash
   # Clone the repository
   git clone <repository-url>
   cd Fully-Automated-CI-CD-Pipeline

   # Initialize Terraform
   cd Terraform
   terraform init
   ```

## CI/CD Pipeline

The GitHub Actions workflow (`terraform.yml`) automates:
- Terraform initialization
- Code formatting checks
- Infrastructure plan
- Infrastructure application
- State management

The pipeline runs on push events and ensures infrastructure changes are properly validated before deployment.

## Security Considerations

- Sensitive values are stored in GitHub Secrets
- Service Principal uses minimum required permissions
- State file is stored in Azure Storage with encryption
- RBAC is implemented for resource access control

## Contributing

1. Create a feature branch
2. Make your changes
3. Submit a Pull Request
4. Wait for CI checks to pass
5. Request review

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

- Email: andrew.elemoso@gmail.com
- LinkedIn: [Andrew Elemoso](https://www.linkedin.com/in/andrew-elemoso/)
