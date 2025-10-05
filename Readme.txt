
# VMware VM Provisioning with Terraform (Linux & Windows)

This repository contains **Terraform** configurations to automate the creation and management of **Linux** and **Windows** Virtual Machines (VMs) on a **VMware vSphere** environment.

This project uses the official **HashiCorp vSphere Provider** to provision VMs from existing templates, including **OS customization** for initial network and host configuration.

-----

## 🚀 Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing.

### Prerequisites

To use this configuration, you will need:

  * **Terraform** installed on your local machine (`>= 1.0`).
  * Access to a **VMware vCenter Server** with a non-free license (vSphere Provider does not work with free ESXi).
  * Pre-configured **VM Templates** for both Linux and Windows operating systems in your vCenter environment. These templates should be prepared for customization (e.g., using `sysprep` for Windows or `cloud-init`/`open-vm-tools` for Linux).
  * Network and resource details (Datacenter name, Cluster, Datastore, etc.).

### Installation and Setup

1.  **Clone the Repository**

    ```bash
    git clone https://github.com/hamid-m331/terraform.git
    cd terraform
    ```

2.  **Configure Credentials**
    Open the `main.tf` or `variables.tf` (depending on your structure) and update the `vsphere` provider block and relevant variables with your vCenter connection details.

    *Example `variables.tf` (you will need to match this to your existing files):*

    ```hcl
    variable "vsphere_user" {
      description = "vSphere username"
      type        = string
    }
    # ... other variables (password, server, network, etc.)
    ```

3.  **Initialize Terraform**
    Run the initialization command to download the necessary providers (especially `vsphere`):

    ```bash
    terraform init
    ```

-----

## 💡 Usage

### Deploying the VMs

1.  **Review the Plan**
    Generate an execution plan to see exactly what actions Terraform will take before applying any changes:

    ```bash
    terraform plan
    ```

2.  **Apply the Configuration**
    If the plan looks correct, apply the configuration to create the virtual machines:

    ```bash
    terraform apply
    ```

    You will be prompted to confirm the execution.

### Destroying the VMs

To clean up and remove all resources created by this configuration, run:

```bash
terraform destroy
```

**⚠️ Warning:** This command will permanently delete the deployed virtual machines. Use with caution.

-----

## 🗂 Project Structure (Example)

Your repository should generally follow a structure like this:

```
.
├── main.tf             # Defines the provider and the VM resource configurations
├── variables.tf        # Input variables (vCenter details, VM specs, network info)
├── outputs.tf          # Output values (e.g., VM IP addresses)
├── versions.tf         # Defines required Terraform and Provider versions
└── README.md
```

-----

## 🤝 Contributing

Feel free to fork the repository and submit pull requests. Any contributions, bug reports, or feature requests are welcome\!

-----

## 📄 License

This project is licensed under the MIT License - see the `LICENSE` file for details.

This video covers how to [Create virtual machine in VMware using terraform](https://www.youtube.com/watch?v=PaorN_tW-h4), which is directly relevant to your project's function.
