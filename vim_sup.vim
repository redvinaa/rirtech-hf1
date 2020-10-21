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
endfunction

vnoremap <leader>v :call <SID>Rplc()<cr>
