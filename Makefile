# Makefile

PLASMOID_PLUGIN_NAME := $$(grep "X-KDE-PluginInfo-Name" $(PWD)/org.communia.apptitle/metadata.desktop | cut -d'=' -f2)
PLASMOID_PLUGIN_VERSION := $$(grep "X-KDE-PluginInfo-Version" $(PWD)/org.communia.apptitle/metadata.desktop | cut -d'=' -f2)
PACKAGE_FILE := $(PWD)/$(PLASMOID_PLUGIN_NAME)--v$(PLASMOID_PLUGIN_VERSION).org.communia.apptitle.plasmoid

build:
	find org.communia.apptitle/ \( -name *.qmlc -o -name *.jsc \) -exec rm -f "{}" \; && \
	cd org.communia.apptitle && \
	zip -r $(PACKAGE_FILE) *
	@echo Built $(PACKAGE_FILE)
