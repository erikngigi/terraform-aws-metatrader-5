```markdown
# MetaTrader Architecture with Terraform

This Terraform workspace provisions a MetaTrader architecture running on Wine in a Linux environment. It sets up the necessary network infrastructure, security configurations, and instances to support the MetaTrader application. 

## Variables

Below are the variables used in this module, along with their descriptions. You can customize these variables to suit your environment.

### Network Configuration

- **`vpc_cidr`**
  - **Description:** CIDR block of the custom VPC for the MetaTrader architecture.
  - **Type:** `string`

- **`vpc_name_tag`**
  - **Description:** Name tag of the custom VPC used for cost allocation.
  - **Type:** `string`

- **`subnet_name_tag`**
  - **Description:** Name tag of the public subnet used for cost allocation.
  - **Type:** `string`

- **`availability_zone`**
  - **Description:** Chosen availability zone to attach to the subnet.
  - **Type:** `string`

- **`internet_gateway_tag`**
  - **Description:** Name tag for the internet gateway used in cost allocation.
  - **Type:** `string`

- **`public_route_table_tag`**
  - **Description:** Name tag of the public route table used in cost allocation.
  - **Type:** `string`

- **`public_destination_route_cidr_block`**
  - **Description:** IP address range for which the specified route will apply, directing traffic to the appropriate target.
  - **Type:** `string`

### Security Configuration

- **`allow_ssh`**
  - **Description:** Boolean flag to enable or disable SSH access (port 22) to the MetaTrader VPS. Set to `true` to allow SSH connections for remote management.
  - **Type:** `bool`

- **`allow_rdp`**
  - **Description:** Boolean flag to enable or disable RDP access (port 3389) to the MetaTrader VPS. Set to `true` to allow RDP for managing the Windows-based MetaTrader application.
  - **Type:** `bool`

- **`ssh_key`**
  - **Description:** Name of the SSH key pair used to log into the MetaTrader VPS. Ensure that the key pair exists in the AWS region where the instance is launched.
  - **Type:** `string`

- **`security_group_name`**
  - **Description:** The name of the security group to be created or used. This name is used to identify the security group in the AWS console and to associate it with resources.
  - **Type:** `string`

- **`ssh_key_name`**
  - **Description:** The name of the SSH key pair used to access the instances. Ensure that the specified key pair exists in the AWS region where the instances are launched.
  - **Type:** `string`

- **`ingress_ssh_port`**
  - **Description:** The port number used for SSH access in the security group. Typically set to 22.
  - **Type:** `number`

- **`ingress_rdp_port`**
  - **Description:** The port number used for RDP access in the security group. Typically set to 3389.
  - **Type:** `number`

- **`protocol`**
  - **Description:** The network protocol for the ingress rule. Common values include `tcp` for TCP traffic, `udp` for UDP traffic, and `icmp` for ICMP traffic.
  - **Type:** `string`

- **`sg_cidr_block`**
  - **Description:** The CIDR block(s) specifying the range of IP addresses allowed to access the specified port(s) on the instances.
  - **Type:** `list(string)`

### Instance Configuration

- **`ami_id`**
  - **Description:** ID of the Amazon Machine Image (AMI) used to launch the MetaTrader VPS instance, specifying the operating system and initial setup.
  - **Type:** `string`

- **`instance_type`**
  - **Description:** EC2 instance type for the MetaTrader VPS, determining the computational power and memory capacity.
  - **Type:** `string`

- **`instance_name_tag`**
  - **Description:** The name of the instance to be created.
  - **Type:** `string`

- **`userdata_file`**
  - **Description:** Path to the shell script. This script installs Wine on the MetaTrader VPS and performs any additional setup required during instance initialization.
  - **Type:** `string`

## Usage

1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Configure Your Variables**
   Update the `terraform.tfvars` file or pass variables directly via the command line with `-var`.

3. **Initialize Terraform**
   ```bash
   terraform init
   ```

4. **Plan the Deployment**
   ```bash
   terraform plan
   ```

5. **Apply the Configuration**
   ```bash
   terraform apply
   ```

6. **Destroy the Infrastructure (when no longer needed)**
   ```bash
   terraform destroy
   ```

## License

This module is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Feel free to reach out with any questions or contributions. Happy Terraforming!
```
