resource "azurerm_linux_virtual_machine" "example" {
  name                                                   = module.vm_name.naming_convention_output[var.naming_convention_info.name].names.0
  resource_group_name                                    = var.resource_group_name
  location                                               = var.location
  size                                                   = "Standard_D2s_v3"
  admin_username                                         = "P@ssw0rd1234!"
  admin_password                                         = "P@ssw0rd1234!"
  allow_extension_operations                             = var.allow_extension_operations
  availability_set_id                                    = var.availability_set_id
  bypass_platform_safety_checks_on_user_schedule_enabled = var.bypass_platform_safety_checks_on_user_schedule_enabled
  capacity_reservation_group_id                          = var.capacity_reservation_group_id
  computer_name                                          = var.computer_name
  custom_data                                            = var.custom_data
  dedicated_host_id                                      = var.dedicated_host_id
  dedicated_host_group_id                                = var.dedicated_host_group_id
  disk_controller_type                                   = var.disk_controller_type
  edge_zone                                              = var.edge_zone
  encryption_at_host_enabled                             = var.encryption_at_host_enabled
  eviction_policy                                        = var.eviction_policy
  extensions_time_budget                                 = var.extensions_time_budget
  disable_password_authentication                        = false
  network_interface_ids                                  = var.network_interface_ids
  patch_assessment_mode                                  = var.patch_assessment_mode
  patch_mode                                             = var.patch_mode
  max_bid_price                                          = var.max_bid_price
  platform_fault_domain                                  = var.platform_fault_domain
  priority                                               = var.priority
  provision_vm_agent                                     = var.provision_vm_agent
  proximity_placement_group_id                           = var.proximity_placement_group_id
  reboot_setting                                         = var.reboot_setting
  secure_boot_enabled                                    = var.secure_boot_enabled
  source_image_id                                        = var.source_image_id
  user_data                                              = var.user_data
  vm_agent_platform_updates_enabled                      = var.vm_agent_platform_updates_enabled
  vtpm_enabled                                           = var.vtpm_enabled
  virtual_machine_scale_set_id                           = var.virtual_machine_scale_set_id
  zone                                                   = var.zone
  tags                                                   = var.tags

  dynamic "source_image_reference" {
    for_each = var.source_image_reference != null ? [] : [var.source_image_reference]
    content {
      publisher = var.source_image_reference.publisher
      offer     = var.source_image_reference.offer
      sku       = var.source_image_reference.sku
      version   = var.source_image_reference.version
    }
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  boot_diagnostics {
    storage_account_uri = var.boot_diagnostics.storage_account_uri
  }

  identity {
    type         = "SystemAssigned"
    identity_ids = []
  }

  additional_capabilities {
    ultra_ssd_enabled   = var.additional_capabilities.ultra_ssd_enabled
    hibernation_enabled = var.additional_capabilities.hibernation_enabled

  }

  dynamic "admin_ssh_key" {
    for_each = var.admin_ssh_key != null ? [] : [var.admin_ssh_key]
    content {
      public_key = var.admin_ssh_key.public_key
      username   = var.admin_ssh_key.username
    }
  }

  dynamic "gallery_application" {

    for_each = var.gallery_application != null ? [] : [var.gallery_application]
    content {
      version_id                                  = gallery_application.value.version_id
      automatic_upgrade_enabled                   = gallery_application.value.automatic_upgrade_enabled
      configuration_blob_uri                      = gallery_application.value.configuration_blob_uri
      order                                       = gallery_application.value.order
      tag                                         = gallery_application.value.tag
      treat_failure_as_deployment_failure_enabled = gallery_application.value.treat_failure_as_deployment_failure_enabled
    }
  }

  dynamic "plan" {
    for_each = var.plan != null ? [] : [var.plan]
    content {
      name      = var.plan.name
      product   = var.plan.product
      publisher = var.plan.publisher
    }
  }

  os_image_notification {
    timeout = var.os_image_notification.timeout
  }
  termination_notification {
    enabled = var.termination_notification.enabled
    timeout = var.termination_notification.timeout
  }

  dynamic "secret" {
    for_each = var.secret != null ? [] : [var.secret]
    content {
      dynamic "certificate" {
        for_each = var.secret.certificate != null ? [] : [var.secret.certificate]
        content {
          url = var.secret.certificate.url
        }
      }
      key_vault_id = var.secret.key_vault_id
    }
  }
}








