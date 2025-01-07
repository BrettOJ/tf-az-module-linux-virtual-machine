

# Variables file for an azure linux virtual machine

variable "admin_username" {
  type        = string
  description = "The Username which should be used for the Virtual Machine."
}

variable "admin_password" {
  type        = string
  description = "The Password which should be used for the local-administrator on this Virtual Machine."
}

variable "location" {
  type        = string
  description = "The Azure location where the Linux Virtual Machine should exist."
}

variable "network_interface_ids" {
  type        = list(string)
  description = "A list of Network Interface IDs which should be attached to this Virtual Machine. The first Network Interface ID in this list will be the Primary Network Interface on the Virtual Machine."
}

variable "os_disk" {
  type = object({
    caching              = string
    storage_account_type = string
  })
  description = "A os_disk block as defined below."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group in which the Linux Virtual Machine should be exist. Changing this forces a new resource to be created."
}

variable "size" {
  type        = string
  description = "The SKU which should be used for this Virtual Machine, such as Standard_F2."
}

variable "additional_capabilities" {
  type = object({
    ultra_ssd_enabled   = bool
    hibernation_enabled = bool
  })
  description = "A additional_capabilities block as defined below."
}

variable "admin_ssh_key" {
  type = object({
    public_key = string
    username   = string
  })
  default = {
    public_key = null
    username   = null
  }
  description = "One or more admin_ssh_key blocks as defined below. Changing this forces a new resource to be created."
}

variable "allow_extension_operations" {
  type        = bool
  description = "Should Extension Operations be allowed on this Virtual Machine? Defaults to true."
}

variable "availability_set_id" {
  type        = string
  description = "Specifies the ID of the Availability Set in which the Virtual Machine should exist. Changing this forces a new resource to be created."
}

variable "boot_diagnostics" {
  type = object({
    storage_account_uri = string
  })
  description = "A boot_diagnostics block as defined below."
}

variable "bypass_platform_safety_checks_on_user_schedule_enabled" {
  type        = bool
  description = "Specifies whether to skip platform scheduled patching when a user schedule is associated with the VM. Defaults to false."
}

variable "capacity_reservation_group_id" {
  type        = string
  description = "Specifies the ID of the Capacity Reservation Group which the Virtual Machine should be allocated to."
}

variable "computer_name" {
  type        = string
  description = "Specifies the Hostname which should be used for this Virtual Machine. If unspecified this defaults to the value for the name field. If the value of the name field is not a valid computer_name, then you must specify computer_name. Changing this forces a new resource to be created."
}

variable "custom_data" {
  type        = string
  description = "The Base64-Encoded Custom Data which should be used for this Virtual Machine. Changing this forces a new resource to be created."
}

variable "dedicated_host_id" {
  type        = string
  description = "The ID of a Dedicated Host where this machine should be run on. Conflicts with dedicated_host_group_id."
}

variable "dedicated_host_group_id" {
  type        = string
  description = "The ID of a Dedicated Host Group that this Linux Virtual Machine should be run within. Conflicts with dedicated_host_id."
}

variable "disable_password_authentication" {
  type        = bool
  description = "Should Password Authentication be disabled on this Virtual Machine? Defaults to true. Changing this forces a new resource to be created."
}

variable "disk_controller_type" {
  type        = string
  description = "(Optional) Specifies the Disk Controller Type used for this Virtual Machine. Possible values are SCSI and NVMe."
}

variable "edge_zone" {
  type        = string
  description = "Specifies the Edge Zone within the Azure Region where this Linux Virtual Machine should exist. Changing this forces a new Linux Virtual Machine to be created."
}

variable "encryption_at_host_enabled" {
  type        = bool
  description = "Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host?"
}

variable "eviction_policy" {
  type        = string
  description = "Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance. Possible values are Deallocate and Delete. Changing this forces a new resource to be created."
}

variable "extensions_time_budget" {
  type        = string
  description = "Specifies the duration allocated for all extensions to start. The time duration should be between 15 minutes and 120 minutes (inclusive) and should be specified in ISO 8601 format. Defaults to PT1H30M."
}


variable "gallery_application" {
  type = object({
    version_id                                  = string
    automatic_upgrade_enabled                   = bool
    configuration_blob_uri                      = string
    order                                       = number
    tag                                         = string
    treat_failure_as_deployment_failure_enabled = bool
  })
  description = "One or more gallery_application blocks as defined below."
}

variable "identity" {
  type = object({
    type         = string
    identity_ids = list(string)
  })
  description = "An identity block as defined below."
}

variable "patch_assessment_mode" {
  type        = string
  description = "Specifies the mode of VM Guest Patching for the Virtual Machine. Possible values are AutomaticByPlatform or ImageDefault. Defaults to ImageDefault."
}

variable "patch_mode" {
  type        = string
  description = "Specifies the mode of in-guest patching to this Linux Virtual Machine. Possible values are AutomaticByPlatform and ImageDefault. Defaults to ImageDefault. For more information on patch modes please see the product documentation."
}

variable "max_bid_price" {
  type        = number
  description = "The maximum price you're willing to pay for this Virtual Machine, in US Dollars; which must be greater than the current spot price. If this bid price falls below the current spot price the Virtual Machine will be evicted using the eviction_policy. Defaults to -1, which means that the Virtual Machine should not be evicted for price reasons."
}

variable "plan" {
  type = object({
    name      = string
    product   = string
    publisher = string
  })
  default     = null
  description = "A plan block as defined below. Changing this forces a new resource to be created."
}

variable "platform_fault_domain" {
  type        = number
  description = "Specifies the Platform Fault Domain in which this Linux Virtual Machine should be created. Defaults to -1, which means this will be automatically assigned to a fault domain that best maintains balance across the available fault domains. Changing this forces a new Linux Virtual Machine to be created."
}

variable "priority" {
  type        = string
  description = "Specifies the priority of this Virtual Machine. Possible values are Regular and Spot. Defaults to Regular. Changing this forces a new resource to be created."
}

variable "provision_vm_agent" {
  type        = bool
  description = "Should the Azure VM Agent be provisioned on this Virtual Machine? Defaults to true. Changing this forces a new resource to be created."
}


variable "proximity_placement_group_id" {
  type        = string
  description = "The ID of the Proximity Placement Group which the Virtual Machine should be assigned to."
}

variable "reboot_setting" {
  type        = string
  description = "Specifies the reboot setting for platform scheduled patching. Possible values are Always, IfRequired and Never."
}

variable "secret" {
  type = object({
    certificate = object({
      url = string
    })
    key_vault_id = string
  })
}

variable "secure_boot_enabled" {
  type        = bool
  description = "Specifies whether secure boot should be enabled on the virtual machine. Changing this forces a new resource to be created."
}

variable "source_image_id" {
  type        = string
  description = "The ID of the Image which this Virtual Machine should be created from. Changing this forces a new resource to be created. Possible Image ID types include Image IDs, Shared Image IDs, Shared Image Version IDs, Community Gallery Image IDs, Community Gallery Image Version IDs, Shared Gallery Image IDs and Shared Gallery Image Version IDs."
  default = null
}

variable "source_image_reference" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  description = "A source_image_reference block as defined below. Changing this forces a new resource to be created."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags which should be assigned to this Virtual Machine."
}

variable "os_image_notification" {
  type = object({
    timeout = string
  })
  description = "A os_image_notification block as defined below."
}

variable "termination_notification" {
  type = object({
    enabled = bool
    timeout = string
  })
  description = "A termination_notification block as defined below."
}

variable "user_data" {
  type        = string
  description = "The Base64-Encoded User Data which should be used for this Virtual Machine."
}

variable "vm_agent_platform_updates_enabled" {
  type        = bool
  description = "Specifies whether VMAgent Platform Updates is enabled. Defaults to false."
}

variable "vtpm_enabled" {
  type        = bool
  description = "Specifies whether vTPM should be enabled on the virtual machine. Changing this forces a new resource to be created."
}

variable "virtual_machine_scale_set_id" {
  type        = string
  description = "Specifies the Orchestrated Virtual Machine Scale Set that this Virtual Machine should be created within."
}

variable "zone" {
  type        = string
  description = "Specifies the Availability Zones in which this Linux Virtual Machine should be located. Changing this forces a new Linux Virtual Machine to be created."
}

variable "naming_convention_info" {
  description = "(Required) Specify the naming convention information to the resource."
  type = object({
    name = string
    site = string
    env  = string
    app  = string
  })
}