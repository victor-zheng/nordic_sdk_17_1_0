nrfutil settings generate --family NRF52 --application app1.hex --application-version 1 --bootloader-version 1 --bl-settings-version 2 settings.hex
mergehex --merge bl.hex settings.hex --output bl_temp.hex
mergehex --merge bl_temp.hex app1.hex mbr_nrf52_2.4.1_mbr.hex --output whole.hex
nrfjprog --eraseall -f NRF52
nrfjprog --program whole.hex --verify -f NRF52
nrfjprog --reset -f NRF52  
pause