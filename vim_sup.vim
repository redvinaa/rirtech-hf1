function s:Rplc()
	:s/\\mathrm{ke}/\\ke/g
	:s/\\mathrm{km}/\\km/g
	:s/\\mathrm{Ja}/\\Ja/g
	:s/\\mathrm{La}/\\La/g
	:s/\\mathrm{Ra}/\\Ra/g
	:s/\\mathrm{ks}/\\ks/g
	:s/\\mathrm{P}/P/g
	:s/\\mathrm{TI}/T_\\text{I}/g
	:s/\\mathrm{TD}/T_\\text{D}/g
	:s/\\mathrm{T0}/T_0/g
	:s/\\mathrm{tau0}/\\tau_0/g
	:s/\\mathrm{w0}/\\omega_0/g
	:s/\\mathrm{wn}/\\omega_\text{n}/g
endfunction

vnoremap <leader>v :call <SID>Rplc()<cr>
