LDD_VERSION = a59a945dd194ea7a5bb0989ad6c3140fa1a94e1d
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-danganhphuc1131997.git
LDD_SITE_METHOD = git

LDD_MODULE_SUBDIRS = scull misc-modules

# define LDD_BUILD_CMDS
# 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules modules
#     $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull modules
# endef

$(eval $(kernel-module))

# Install helper scripts for starting drivers and modules
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/sbin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/sbin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/sbin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/sbin/
endef

# define LDD_INSTALL_TARGET_CMDS
#     # Copy misc-modules and scull components to target filesystem
#     $(INSTALL) -D -m 0755 $(@D)/misc-modules/* $(TARGET_DIR)/lib/modules/
#     $(INSTALL) -D -m 0755 $(@D)/scull/* $(TARGET_DIR)/usr/bin/
# endef

$(eval $(generic-package))