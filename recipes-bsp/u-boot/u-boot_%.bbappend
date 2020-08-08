FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append_rpi = " \
    file://fw_env.config \
"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

DEPENDS_append_rpi = " u-boot-default-script"

SRC_URI_append_raspberrypi-cm3 = " file://0001-dm-core-Move-ofdata_to_platdata-call-earlier.patch"
do_install_append_rpi () {
    install -d ${D}${sysconfdir}
    install -m 0644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
}
