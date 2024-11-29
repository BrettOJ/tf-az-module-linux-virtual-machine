Manages a Linux Virtual Machine.

## [Disclaimers](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#disclaimers)

## [Example Usage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#example-usage)

This example provisions a basic Linux Virtual Machine on an internal network. Additional examples of how to use the `azurerm_linux_virtual_machine` resource can be found [in the ./examples/virtual-machines/linux directory within the GitHub Repository](https://github.com/hashicorp/terraform-provider-azurerm/tree/main/examples/virtual-machines/linux).

```hcl
resource "azurerm_resource_group" "example" { name = "example-resources" location = "West Europe" } resource "azurerm_virtual_network" "example" { name = "example-network" address_space = ["10.0.0.0/16"] location = azurerm_resource_group.example.location resource_group_name = azurerm_resource_group.example.name } resource "azurerm_subnet" "example" { name = "internal" resource_group_name = azurerm_resource_group.example.name virtual_network_name = azurerm_virtual_network.example.name address_prefixes = ["10.0.2.0/24"] } resource "azurerm_network_interface" "example" { name = "example-nic" location = azurerm_resource_group.example.location resource_group_name = azurerm_resource_group.example.name ip_configuration { name = "internal" subnet_id = azurerm_subnet.example.id private_ip_address_allocation = "Dynamic" } } resource "azurerm_linux_virtual_machine" "example" { name = "example-machine" resource_group_name = azurerm_resource_group.example.name location = azurerm_resource_group.example.location size = "Standard_F2" admin_username = "adminuser" network_interface_ids = [ azurerm_network_interface.example.id, ] admin_ssh_key { username = "adminuser" public_key = file("~/.ssh/id_rsa.pub") } os_disk { caching = "ReadWrite" storage_account_type = "Standard_LRS" } source_image_reference { publisher = "Canonical" offer = "0001-com-ubuntu-server-jammy" sku = "22_04-lts" version = "latest" } }
```

## [Argument Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#argument-reference)

The following arguments are supported:

-   [`admin_username`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#admin_username-4) - (Required) The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created.
    
-   [`location`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#location-4) - (Required) The Azure location where the Linux Virtual Machine should exist. Changing this forces a new resource to be created.
    
-   [`license_type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#license_type-4) - (Optional) Specifies the License Type for this Virtual Machine. Possible values are `RHEL_BYOS`, `RHEL_BASE`, `RHEL_EUS`, `RHEL_SAPAPPS`, `RHEL_SAPHA`, `RHEL_BASESAPAPPS`, `RHEL_BASESAPHA`, `SLES_BYOS`, `SLES_SAP`, `SLES_HPC`, `UBUNTU_PRO`.
    
-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#name-11) - (Required) The name of the Linux Virtual Machine. Changing this forces a new resource to be created.
    
-   [`network_interface_ids`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#network_interface_ids-4) - (Required). A list of Network Interface IDs which should be attached to this Virtual Machine. The first Network Interface ID in this list will be the Primary Network Interface on the Virtual Machine.
    
-   [`os_disk`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#os_disk-3) - (Required) A `os_disk` block as defined below.
    
-   [`resource_group_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#resource_group_name-4) - (Required) The name of the Resource Group in which the Linux Virtual Machine should be exist. Changing this forces a new resource to be created.
    
-   [`size`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#size-3) - (Required) The SKU which should be used for this Virtual Machine, such as `Standard_F2`.
    

___

-   [`additional_capabilities`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#additional_capabilities-4) - (Optional) A `additional_capabilities` block as defined below.
    
-   [`admin_password`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#admin_password-4) - (Optional) The Password which should be used for the local-administrator on this Virtual Machine. Changing this forces a new resource to be created.
    

-   [`admin_ssh_key`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#admin_ssh_key-1) - (Optional) One or more `admin_ssh_key` blocks as defined below. Changing this forces a new resource to be created.

-   [`allow_extension_operations`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#allow_extension_operations-3) - (Optional) Should Extension Operations be allowed on this Virtual Machine? Defaults to `true`.
    
-   [`availability_set_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#availability_set_id-4) - (Optional) Specifies the ID of the Availability Set in which the Virtual Machine should exist. Changing this forces a new resource to be created.
    
-   [`boot_diagnostics`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#boot_diagnostics-4) - (Optional) A `boot_diagnostics` block as defined below.
    
-   [`bypass_platform_safety_checks_on_user_schedule_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#bypass_platform_safety_checks_on_user_schedule_enabled-3) - (Optional) Specifies whether to skip platform scheduled patching when a user schedule is associated with the VM. Defaults to `false`.
    

-   [`capacity_reservation_group_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#capacity_reservation_group_id-3) - (Optional) Specifies the ID of the Capacity Reservation Group which the Virtual Machine should be allocated to.

-   [`computer_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#computer_name-4) - (Optional) Specifies the Hostname which should be used for this Virtual Machine. If unspecified this defaults to the value for the `name` field. If the value of the `name` field is not a valid `computer_name`, then you must specify `computer_name`. Changing this forces a new resource to be created.
    
-   [`custom_data`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#custom_data-4) - (Optional) The Base64-Encoded Custom Data which should be used for this Virtual Machine. Changing this forces a new resource to be created.
    
-   [`dedicated_host_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#dedicated_host_id-3) - (Optional) The ID of a Dedicated Host where this machine should be run on. Conflicts with `dedicated_host_group_id`.
    
-   [`dedicated_host_group_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#dedicated_host_group_id-3) - (Optional) The ID of a Dedicated Host Group that this Linux Virtual Machine should be run within. Conflicts with `dedicated_host_id`.
    
-   [`disable_password_authentication`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#disable_password_authentication-2) - (Optional) Should Password Authentication be disabled on this Virtual Machine? Defaults to `true`. Changing this forces a new resource to be created.
    

-   [`disk_controller_type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#disk_controller_type-3) - (Optional) Specifies the Disk Controller Type used for this Virtual Machine. Possible values are `SCSI` and `NVMe`.
    
-   [`edge_zone`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#edge_zone-3) - (Optional) Specifies the Edge Zone within the Azure Region where this Linux Virtual Machine should exist. Changing this forces a new Linux Virtual Machine to be created.
    
-   [`encryption_at_host_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#encryption_at_host_enabled-3) - (Optional) Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host?
    
-   [`eviction_policy`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#eviction_policy-3) - (Optional) Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance. Possible values are `Deallocate` and `Delete`. Changing this forces a new resource to be created.
    

-   [`extensions_time_budget`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#extensions_time_budget-3) - (Optional) Specifies the duration allocated for all extensions to start. The time duration should be between 15 minutes and 120 minutes (inclusive) and should be specified in ISO 8601 format. Defaults to `PT1H30M`.
    
-   [`gallery_application`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#gallery_application-3) - (Optional) One or more `gallery_application` blocks as defined below.
    

-   [`identity`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#identity-7) - (Optional) An `identity` block as defined below.
    
-   [`patch_assessment_mode`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#patch_assessment_mode-3) - (Optional) Specifies the mode of VM Guest Patching for the Virtual Machine. Possible values are `AutomaticByPlatform` or `ImageDefault`. Defaults to `ImageDefault`.
    

-   [`patch_mode`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#patch_mode-3) - (Optional) Specifies the mode of in-guest patching to this Linux Virtual Machine. Possible values are `AutomaticByPlatform` and `ImageDefault`. Defaults to `ImageDefault`. For more information on patch modes please see the [product documentation](https://docs.microsoft.com/azure/virtual-machines/automatic-vm-guest-patching#patch-orchestration-modes).

-   [`max_bid_price`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#max_bid_price-3) - (Optional) The maximum price you're willing to pay for this Virtual Machine, in US Dollars; which must be greater than the current spot price. If this bid price falls below the current spot price the Virtual Machine will be evicted using the `eviction_policy`. Defaults to `-1`, which means that the Virtual Machine should not be evicted for price reasons.

-   [`plan`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#plan-4) - (Optional) A `plan` block as defined below. Changing this forces a new resource to be created.
    
-   [`platform_fault_domain`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#platform_fault_domain-3) - (Optional) Specifies the Platform Fault Domain in which this Linux Virtual Machine should be created. Defaults to `-1`, which means this will be automatically assigned to a fault domain that best maintains balance across the available fault domains. Changing this forces a new Linux Virtual Machine to be created.
    
-   [`priority`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#priority-3) - (Optional) Specifies the priority of this Virtual Machine. Possible values are `Regular` and `Spot`. Defaults to `Regular`. Changing this forces a new resource to be created.
    
-   [`provision_vm_agent`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#provision_vm_agent-4) - (Optional) Should the Azure VM Agent be provisioned on this Virtual Machine? Defaults to `true`. Changing this forces a new resource to be created.
    

-   [`proximity_placement_group_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#proximity_placement_group_id-4) - (Optional) The ID of the Proximity Placement Group which the Virtual Machine should be assigned to.
    
-   [`reboot_setting`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#reboot_setting-3) - (Optional) Specifies the reboot setting for platform scheduled patching. Possible values are `Always`, `IfRequired` and `Never`.
    

-   [`secret`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#secret-3) - (Optional) One or more `secret` blocks as defined below.
    
-   [`secure_boot_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#secure_boot_enabled-3) - (Optional) Specifies whether secure boot should be enabled on the virtual machine. Changing this forces a new resource to be created.
    
-   [`source_image_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#source_image_id-3) - (Optional) The ID of the Image which this Virtual Machine should be created from. Changing this forces a new resource to be created. Possible Image ID types include `Image ID`s, `Shared Image ID`s, `Shared Image Version ID`s, `Community Gallery Image ID`s, `Community Gallery Image Version ID`s, `Shared Gallery Image ID`s and `Shared Gallery Image Version ID`s.
    

-   [`source_image_reference`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#source_image_reference-3) - (Optional) A `source_image_reference` block as defined below. Changing this forces a new resource to be created.

-   [`tags`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#tags-4) - (Optional) A mapping of tags which should be assigned to this Virtual Machine.
    
-   [`os_image_notification`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#os_image_notification-3) - (Optional) A `os_image_notification` block as defined below.
    
-   [`termination_notification`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#termination_notification-3) - (Optional) A `termination_notification` block as defined below.
    
-   [`user_data`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#user_data-3) - (Optional) The Base64-Encoded User Data which should be used for this Virtual Machine.
    
-   [`vm_agent_platform_updates_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#vm_agent_platform_updates_enabled-3) - (Optional) Specifies whether VMAgent Platform Updates is enabled. Defaults to `false`.
    
-   [`vtpm_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#vtpm_enabled-3) - (Optional) Specifies whether vTPM should be enabled on the virtual machine. Changing this forces a new resource to be created.
    
-   [`virtual_machine_scale_set_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#virtual_machine_scale_set_id-3) - (Optional) Specifies the Orchestrated Virtual Machine Scale Set that this Virtual Machine should be created within.
    

-   [`zone`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#zone-3) - (Optional) Specifies the Availability Zones in which this Linux Virtual Machine should be located. Changing this forces a new Linux Virtual Machine to be created.

___

A `additional_capabilities` block supports the following:

-   [`ultra_ssd_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#ultra_ssd_enabled-4) - (Optional) Should the capacity to enable Data Disks of the `UltraSSD_LRS` storage account type be supported on this Virtual Machine? Defaults to `false`.
    
-   [`hibernation_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#hibernation_enabled-3) - (Optional) Whether to enable the hibernation capability or not.
    

___

A `admin_ssh_key` block supports the following:

-   [`public_key`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#public_key-1) - (Required) The Public Key which should be used for authentication, which needs to be in `ssh-rsa` format with at least 2048-bit or in `ssh-ed25519` format. Changing this forces a new resource to be created.
    
-   [`username`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#username-1) - (Required) The Username for which this Public SSH Key should be configured. Changing this forces a new resource to be created.
    

___

A `boot_diagnostics` block supports the following:

-   [`storage_account_uri`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#storage_account_uri-3) - (Optional) The Primary/Secondary Endpoint for the Azure Storage Account which should be used to store Boot Diagnostics, including Console Output and Screenshots from the Hypervisor.

___

A `certificate` block supports the following:

-   [`url`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#url-3) - (Required) The Secret URL of a Key Vault Certificate.

___

A `diff_disk_settings` block supports the following:

-   [`option`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#option-3) - (Required) Specifies the Ephemeral Disk Settings for the OS Disk. At this time the only possible value is `Local`. Changing this forces a new resource to be created.
    
-   [`placement`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#placement-3) - (Optional) Specifies where to store the Ephemeral Disk. Possible values are `CacheDisk` and `ResourceDisk`. Defaults to `CacheDisk`. Changing this forces a new resource to be created.
    

___

A `gallery_application` block supports the following:

-   [`version_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#version_id-3) - (Required) Specifies the Gallery Application Version resource ID.
    
-   [`automatic_upgrade_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#automatic_upgrade_enabled-3) - (Optional) Specifies whether the version will be automatically updated for the VM when a new Gallery Application version is available in PIR/SIG. Defaults to `false`.
    
-   [`configuration_blob_uri`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#configuration_blob_uri-3) - (Optional) Specifies the URI to an Azure Blob that will replace the default configuration for the package if provided.
    
-   [`order`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#order-3) - (Optional) Specifies the order in which the packages have to be installed. Possible values are between `0` and `2147483647`. Defaults to `0`.
    
-   [`tag`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#tag-3) - (Optional) Specifies a passthrough value for more generic context. This field can be any valid `string` value.
    
-   [`treat_failure_as_deployment_failure_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#treat_failure_as_deployment_failure_enabled-3) - (Optional) Specifies whether any failure for any operation in the VmApplication will fail the deployment of the VM. Defaults to `false`.
    

___

An `identity` block supports the following:

-   [`type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#type-4) - (Required) Specifies the type of Managed Service Identity that should be configured on this Linux Virtual Machine. Possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned` (to enable both).
    
-   [`identity_ids`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#identity_ids-4) - (Optional) Specifies a list of User Assigned Managed Identity IDs to be assigned to this Linux Virtual Machine.
    

___

A `os_disk` block supports the following:

-   [`caching`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#caching-5) - (Required) The Type of Caching which should be used for the Internal OS Disk. Possible values are `None`, `ReadOnly` and `ReadWrite`.
    
-   [`storage_account_type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#storage_account_type-3) - (Required) The Type of Storage Account which should back this the Internal OS Disk. Possible values are `Standard_LRS`, `StandardSSD_LRS`, `Premium_LRS`, `StandardSSD_ZRS` and `Premium_ZRS`. Changing this forces a new resource to be created.
    
-   [`diff_disk_settings`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#diff_disk_settings-3) - (Optional) A `diff_disk_settings` block as defined above. Changing this forces a new resource to be created.
    

-   [`disk_encryption_set_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#disk_encryption_set_id-3) - (Optional) The ID of the Disk Encryption Set which should be used to Encrypt this OS Disk. Conflicts with `secure_vm_disk_encryption_set_id`.

-   [`disk_size_gb`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#disk_size_gb-5) - (Optional) The Size of the Internal OS Disk in GB, if you wish to vary from the size used in the image this Virtual Machine is sourced from.

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#name-12) - (Optional) The name which should be used for the Internal OS Disk. Changing this forces a new resource to be created.
    
-   [`secure_vm_disk_encryption_set_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#secure_vm_disk_encryption_set_id-3) - (Optional) The ID of the Disk Encryption Set which should be used to Encrypt this OS Disk when the Virtual Machine is a Confidential VM. Conflicts with `disk_encryption_set_id`. Changing this forces a new resource to be created.
    

-   [`security_encryption_type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#security_encryption_type-3) - (Optional) Encryption Type when the Virtual Machine is a Confidential VM. Possible values are `VMGuestStateOnly` and `DiskWithVMGuestState`. Changing this forces a new resource to be created.

-   [`write_accelerator_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#write_accelerator_enabled-5) - (Optional) Should Write Accelerator be Enabled for this OS Disk? Defaults to `false`.

___

A `plan` block supports the following:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#name-13) - (Required) Specifies the Name of the Marketplace Image this Virtual Machine should be created from. Changing this forces a new resource to be created.
    
-   [`product`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#product-4) - (Required) Specifies the Product of the Marketplace Image this Virtual Machine should be created from. Changing this forces a new resource to be created.
    
-   [`publisher`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#publisher-7) - (Required) Specifies the Publisher of the Marketplace Image this Virtual Machine should be created from. Changing this forces a new resource to be created.
    

___

A `secret` block supports the following:

-   [`certificate`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#certificate-3) - (Required) One or more `certificate` blocks as defined above.
    
-   [`key_vault_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#key_vault_id-3) - (Required) The ID of the Key Vault from which all Secrets should be sourced.
    

___

The `source_image_reference` block supports the following:

-   [`publisher`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#publisher-8) - (Required) Specifies the publisher of the image used to create the virtual machines. Changing this forces a new resource to be created.
    
-   [`offer`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#offer-4) - (Required) Specifies the offer of the image used to create the virtual machines. Changing this forces a new resource to be created.
    
-   [`sku`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#sku-4) - (Required) Specifies the SKU of the image used to create the virtual machines. Changing this forces a new resource to be created.
    
-   [`version`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#version-4) - (Required) Specifies the version of the image used to create the virtual machines. Changing this forces a new resource to be created.
    

___

A `os_image_notification` block supports the following:

-   [`timeout`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#timeout-5) - (Optional) Length of time a notification to be sent to the VM on the instance metadata server till the VM gets OS upgraded. The only possible value is `PT15M`. Defaults to `PT15M`.

___

A `termination_notification` block supports the following:

-   [`enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#enabled-4) - (Required) Should the termination notification be enabled on this Virtual Machine?
    
-   [`timeout`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#timeout-6) - (Optional) Length of time (in minutes, between `5` and `15`) a notification to be sent to the VM on the instance metadata server till the VM gets deleted. The time duration should be specified in ISO 8601 format. Defaults to `PT5M`.
    

## [Attributes Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#attributes-reference)

In addition to the Arguments listed above - the following Attributes are exported:

-   [`id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#id-5) - The ID of the Linux Virtual Machine.
    
-   [`identity`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#identity-8) - An `identity` block as documented below.
    
-   [`private_ip_address`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#private_ip_address-3) - The Primary Private IP Address assigned to this Virtual Machine.
    
-   [`private_ip_addresses`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#private_ip_addresses-3) - A list of Private IP Addresses assigned to this Virtual Machine.
    
-   [`public_ip_address`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#public_ip_address-3) - The Primary Public IP Address assigned to this Virtual Machine.
    
-   [`public_ip_addresses`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#public_ip_addresses-3) - A list of the Public IP Addresses assigned to this Virtual Machine.
    
-   [`virtual_machine_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#virtual_machine_id-3) - A 128-bit identifier which uniquely identifies this Virtual Machine.
    

___

An `identity` block exports the following:

-   [`principal_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#principal_id-4) - The Principal ID associated with this Managed Service Identity.
    
-   [`tenant_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#tenant_id-4) - The Tenant ID associated with this Managed Service Identity.
    

## [Timeouts](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#timeouts)

The `timeouts` block allows you to specify [timeouts](https://www.terraform.io/language/resources/syntax#operation-timeouts) for certain actions:

-   [`create`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#create-4) - (Defaults to 45 minutes) Used when creating the Linux Virtual Machine.
-   [`update`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#update-4) - (Defaults to 45 minutes) Used when updating the Linux Virtual Machine.
-   [`delete`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#delete-4) - (Defaults to 45 minutes) Used when deleting the Linux Virtual Machine.
-   [`read`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#read-4) - (Defaults to 5 minutes) Used when retrieving the Linux Virtual Machine.

## [Import](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#import)

Linux Virtual Machines can be imported using the `resource id`, e.g.

```shell
terraform import azurerm_linux_virtual_machine.example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.Compute/virtualMachines/machine1
```