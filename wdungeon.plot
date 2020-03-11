[##][init]
	Do tej pory zalujesz, ze sie tu znalazles. Tutejsi ludzie zabrali cie do podziemi i obiecali cie z nich wypuscic,
	gdy pokonasz Wladce Podziemi. Teraz nie masz juz wyboru. Nie uda ci sie otworzyc wyjsciowych drzwi,
	nie znajac hasla. Musisz isc w glab podziemi i wykonac swoja misje... /
	[->][door_static]

[##][door_static]
	Znajdujesz sie w wielkiej przestronnej komnacie.
	[->][door]

[##][door]
	[->][otworzylem_wrota = 1, drag2_w_furii = 0][door_otwarte]
	[->][otworzylem_wrota = 0, drag2_w_furii = 1][door_drag_goni]
	[->][otworzylem_wrota = 0, drag2_w_furii = 0][door_default]
	[->][FAIL]

[##][door_otwarte]
	Wielkie wrota sa otwarte. Teraz mozesz opuscic podziemia. Inna droga prowadzi na polnoc.
	[?] OPCJE:
	[#] Isc na polnoc. [^N.TTL][palad]
		Idziesz na polnoc szerokim korytarzem, az dochodzisz do skrzyzowania w ksztalcie litery T.
	[#] Opuscic podziemia. [^S.SPC][door_na_zewnatrz]

[##][door_na_zewnatrz]
	Robisz krok do przodu. Potem drugi. W miare jak idziesz korytarzem, czujesz, ze robi sie
	coraz jasniej. W koncu wychodzisz na zewnatrz. Wreszcie jestes wolny! Zdolales wydostac sie
	z podziemi. Wykonales swoje zadanie.
	[!]

[##][door_default][^.TV]
	W poludniowej scianie sa wielkie wrota. Otworza sie dopiero wtedy, gdy podasz haslo.
	Jedyna inna droga prowadzi na polnoc.
	[?] OPCJE:
	[#] Isc na polnoc. [^N.TTL][palad]
		Idziesz na polnoc szerokim korytarzem, az dochodzisz do skrzyzowania w ksztalcie litery T.
	[#] Podac Haslo. [password] Jakie?

[##][password]
	[?] OPCJE:
	[#] Arbalestta [bad_password]
	[#] Arwena [bad_password]
	[#] Antaress [bad_password]
	[#] Dupa123 [bad_password]
	[#] [drag2_w_furii = 1] Ratunku! [door_drag_atakuje] To nie haslo. To desperacja.
	[#] [znam_haslo = 1] Otwierac. [door] Wrota otwieraja sie. [otworzylem_wrota := 1]
	[#] [znam_napis_z_barykady = 1] á@ä&| Ód@^&v $~äˆ [bad_password]

[##][bad_password] To nie to haslo.
	[->][drag2_w_furii = 1][door_drag_atakuje]
	[->][door]

[##][door_drag_goni]
	Stad nie ma wyjscia. Chyba, ze podasz szybko haslo.
	[?] OPCJE:
	[#] Podac haslo. [password]
	[#] Bronic sie. [drag_attack]
	[#] Blagac o litosc. [door_blagam_smoka]

[##][door_drag_atakuje]
	Smok ciska w ciebie kula ognia. Stajesz w plomieniach. W koncu padasz zweglony na ziemie.
	[+]

[##][door_blagam_smoka]
	-Oszczedz! / -Co? / -Oszczedz jestem tylko marnym knypkiem. Szkoda na mnie twoich nerwow. /
	-A zartowac to sie chcialo!
	Teraz cie naucze.
	[?] CO POWIESZ:
	[#] [mam_miecz = 1] "Daj mi chociaz dobyc miecza." [drag_sword_attack] -Daj mi chociaz dobyc miecza. /
		-A dobywaj. /
	[#] [mam_miecz = 0] "Bede sie bronil." [drag_melee] -Bede sie bronil. /
	[#] "Zanim mnie nauczysz, daj mi powiedziec cos waznego." [door_cos_waznego]

[##][door_cos_waznego]
	-Zanim mnie nauczysz, daj mi powiedziec cos waznego. / -Co?
	[?] OPCJE:
	[#] "Gowno." [door_drag_atakuje] -Gowno. /
	[#] "Czarownik ma te trzy srebrne." [door_drag_on_wiz][drag2_w_furii := 0, drag_killed_wiz := 1, wiz_dead := 1]

[##][door_drag_on_wiz]
	-Czarownik ma te trzy srebrne. / Kolor oczu smoka zmienia sie z czerwonego w srebrny. /
	-Lepiej zeby je mial gnoju. Zaraz to sprawdze. / Smok zrywa sie i wylatuje z komnaty.
	[->][door]


[//]-------------------- PALADYN ---------------------------------

[##][palad]
	Drogi skrzyzowania rozchodza sie na polnoc, poludnie i zachod.
	[->][czar_idzie_do_tronu = 1][palad_czar_idzie]
	[->][palad_martwy_u_siebie = 1][palad_martwy_tu_redir]
	[->][palad_martwy_na_schodach = 1][palad_3way]
	[->][palad_met = 0][palad_is_new]
	[->][palad_ma_3_srebrne = 1][palad_puszcza]
	[->][palad_is_old]

[##][palad_czar_idzie]
	Czarownik szybko kieruje sie na wschod.
	[->][palad_martwy_u_siebie = 1][palad_martwy_tu_redir]
	[->][palad_martwy_na_schodach = 1][palad_3way]
	[->][FAIL]

[##][palad_puszcza]
	Kolo zachodniego wyjscia stoi paladyn.
	[->][palad_stands]

[##][palad_martwy_tu_redir]
	[->][drag2_w_furii = 1][palad_drag_goni]
	[->][mam_miecz = 1][palad_robbed]
	[->][palad_martwy_u_siebie]

[##][palad_drag_goni]
	Potykasz sie o zwloki Paladyna. Wstajesz. Smok wlatuje na skrzyzowanie zatoba.
	[?] OPCJE (MARNE):
	[#] Wiac na poludnie [^S.TV][door] Biegniesz na poludnie, az docierasz do wielkiej komnaty.
	[#] Wiac na polnoc [^N.TX][kosz] Uciekasz dalej korytarzem na polnoc, czujac za soba sapanie smoka.
		Dobiegasz do skrzyzowania.
	[#] Walczyc ze wscieklym smokiem. [drag_attack]

[##][palad_martwy_u_siebie]
	Na ziemi lezy cialo martwego Paladyna. Obok niego lezy jego miecz.
	[->][palad_3way]

[##][palad_robbed]
	Na ziemi lezy cialo martwego Paladyna.
	[->][palad_3way]

[##][palad_3way]
	[?] OPCJE:
	[#] [czar_idzie_do_tronu = 1] Isc za czarownikiem na zachod. [^W.TH ^W.TTD][metapalad]
		Idziecie na zachod, az dochodzicie do skrzyzowania w ksztalcie litery T.
	[#] [czar_idzie_do_tronu = 1] Isc na polnoc. [^N.TX][kosz]
		Idziesz na polnoc, az dochodzisz do skrzyzowania.
		[czar_idzie_do_tronu := 0, czar_u_tronu := 1]
	[#] [czar_idzie_do_tronu = 1] Isc na poludnie. [^S.TV][door]
		Idziesz na polodnie, az dochodzisz do wielkiej komnaty.
		[czar_idzie_do_tronu := 0, czar_u_tronu := 1]

	[#] [czar_idzie_do_tronu = 0] Isc na polnoc. [^N.TX][kosz]
		Idziesz na polnoc, az dochodzisz do skrzyzowania.
	[#] [czar_idzie_do_tronu = 0] Isc na poludnie. [^S.TV][door]
		Idziesz na polodnie, az dochodzisz do wielkiej komnaty.
	[#] [czar_idzie_do_tronu = 0] Isc na zachod. [^W.TH ^W.TTD][metapalad]
		Idziesz na zachod, az dochodzisz do skrzyzowania w ksztalcie litery T.

	[#] [mam_miecz = 0, palad_martwy_u_siebie = 1] Zabrac miecz Paldyna.
	    [palad_3way] Podnosisz z ziemi zloty miecz Paldyna i zabierasz go ze soba.
	    [mam_miecz := 1]

[##][palad_is_new]
	Niestety w korytarzu prowadzacym na zachod stoi Paladyn, ktory blokuje przejscie.
	Piekna zlota, wypolerowana zbroja; czerwona pelerynka. W reku trzyma wielki zloty miecz.
	[->][palad_stands][palad_met := 1]

[##][palad_is_old]
	Paladyn blokuje korytarz prowadzacy na zachod.
	[->][palad_stands]

[##][palad_stands]
	[?] OPCJE:
	[#] Isc na polnoc. [^N.TX][kosz] Idziesz na polnoc, az dochodzisz do skrzyzowania.
	[#] Isc na poludnie. [^S.TV][door] Idziesz na polodnie, az dochodzisz do wielkiej komnaty.
	[#] [palad_ma_3_srebrne = 1] Isc na zachod. [^W.TH ^W.TTD]
		[metapalad] Idziesz na zachod, az dochodzisz do skrzyzowania w ksztalcie litery T.
	[#] Zaatakowac Paladyna. [palad_melee_attack]
	[#] Zagadac do Paladyna. [paladyn_talk1]

[##][palad_melee_attack]
	Rzucasz sie na Paldyna z piesciami. Paladyn podnosi swoj miecz, zamachuje sie i zadaje cios, obcinajac ci glowe.
	Padasz trupem! Twoja wedrowka dobiegla konca.
	[+]

[##][paladyn_talk1]
	Co chcesz powiedziec Paladynowi?
	[?] OPCJE:
	[#] "Czesc Paladyn, co jest?" [paladyn_talk1_co_jest]
	[#] "Paladyn daj mi przejsc!" [paladyn_talk1_daj_przejsc]
	[#] [palad_chce_3_srebrne = 1, mam_3_srebrne = 1] "Mam dla ciebie kase." [palad_zaplata]
		-Mam dla ciebie kase. / -Bardzo dobrze. /

[##][paladyn_talk1_daj_przejsc]
	-Paladyn, daj mi przejsc! / -Bo co?
	[?] CO POWIESZ:
	[#] "Bo cie zabije." [paladyn_angry] -Bo cie zabije. / -No to sprobuj.
	[#] "Bo powiem moim ludziom, zeby cie zabili." [paladyn_talk1_bo_powiem_moim]

[##][paladyn_talk1_bo_powiem_moim]
	-Bo powiem moim ludziom, zeby cie zabili. / -A ilu ich jest?
	[?] CO ODPOWIESZ:
	[#] "Pieciu." [paladyn_talk1_ilu_5]
	[#] "Dziesieciu." [paladyn_talk1_ilu_10]
	[#] "Wogole ich nie ma." [paladyn_talk1_ilu_wogole]

[##][paladyn_talk1_ilu_wogole]
	-Wogole ich nie ma. / -Ha, ha. No to spieprzaj kmiocie!
	[->][paladyn_nie_pogada]

[##][paladyn_talk1_ilu_5]
	-Pieciu. / -A mnie jest dziesieciu. / Paladyn nie chce juz z toba rozmawiac.
	[->][paladyn_nie_pogada]

[##][paladyn_talk1_ilu_10]
	-Dziesieciu. / -Klamiesz oszuscie. / Paladyn rusza na ciebie.
	[->][paladyn_angry]

[##][paladyn_talk1_co_jest]
	-Czesc Paladyn, co jest? / -W pozadalu.
	[?] CO POWIESZ:
	[#] "Fajny masz miecz." [paladyn_talk1_fajny_miecz]
	[#] "Co tu robisz?" [paladyn_talk1_co_tu_robisz]

[##][paladyn_talk1_fajny_miecz]
	-Fajny masz miecz. / -No i co?
	[?] CO POWIESZ:
	[#] "Nic." [paladyn_talk1_fajny_miecz_co_nic]
	[#] "Daj mi go. " [paladyn_talk1_fajny_miecz_co_daj_go]

[##][paladyn_talk1_fajny_miecz_co_nic]
	-Nic. / -No to spieprzaj.
	[->][paladyn_nie_pogada]

[##][paladyn_talk1_fajny_miecz_co_daj_go]
	-Daj mi go. / -Jezli chcesz miec moj miecz, musisz najpierw mnie pokonac.
	[->][paladyn_angry]

[##][paladyn_angry]
	[?] OPCJE:
	[#] Zaatakowac Paladyna. [palad_melee_attack]
	[#] Uciec. [kosz] Blyskawicznie zrywasz sie i uciekasz, kierujac sie na polnoc, az dobiegasz do skrzyzowania.

[##][paladyn_nie_pogada]
	[?] OPCJE:
	[#] Isc na polnoc. [^N.TX][kosz] Idziesz na polnoc szerokim korytarzem.
	[#] Isc na poludnie. [^S.TV][door] Idziesz na polodnie, az dochodzisz do wielkiej komnaty.
	[#] [palad_ma_3_srebrne = 1] Isc na zachod. [^W.TH ^W.TTD]
		[metapalad] Idziesz na zachod, az dochodzisz do skrzyzowania w ksztalcie litery T.
	[#] Zaatakowac Paladyna. [palad_melee_attack]

[##][paladyn_talk1_co_tu_robisz]
	-Co tu robisz? / -"Stoje tu i zabijam kazdego, ktory sie do mnie zblizy. A ty?"
	[?] CO POWIESZ:
	[#] "Nic. Juz nic." [paladyn_nie_pogada] -"Nic. Juz nic." Odsuwasz sie od Paladyna.
	[#] "Chce z toba pogadac." [paladyn_talk1_pogadajmy] -Chce z toba pogadac. / -Pogadajmy.
	[#] "Chce wziac twoj miecz." [paladyn_talk1_chce_wziac_miecz]
	[#] "Mam zamiar cie zabic." [paladyn_talk1_chce_cie_zabic]

[##][paladyn_talk1_pogadajmy]
	[?] CO POWIESZ:
	[#][palad_nie_pusci_za_darmo = 0] "Puscisz mnie?" [paladyn_talk1_puscisz]
	[#][palad_o_wladcy = 0] "Znasz wladce podziemi?" [palad_talk1_znasz_wladce]
	   [palad_o_wladcy := 1]
	[#][pal_endgada = 1] "Juz sie nagadalem." [paladyn_talk1_endgada]
	   [pal_endgada := 0]

[##][palad_talk1_znasz_wladce]
	-Znasz wladce podziemi? / -Jasne, ze znam: to przeciez Czarnoksieznik. /
	-A jak sie nazywa? / -Czarnoksieznik. / -Acha, no to dzieki. /
	Odsuwasz sie od Paladyna.
	[->][paladyn_nie_pogada]

[##][paladyn_talk1_endgada]
	-Juz sie nagadalem. / -Glupiemu malo trzeba.
	[->][paladyn_nie_pogada]

[##][paladyn_talk1_puscisz]
	-Puscisz mnie? / -Za ile?
	[?] CO POWIESZ:
	[#][palad_nie_pusci_za_darmo = 0] "Za darmo. " [paladyn_talk1_pogadajmy]
	   -Nie! [palad_nie_pusci_za_darmo := 1, pal_endgada := 1]
	[#] "za 3 srebrne." [palad_tk1_puscisz_za_3] -Za 3 srebrne. / -Dobra.
	   [pal_endgada := 1, palad_chce_3_srebrne := 1]

[##][palad_tk1_puscisz_za_3]
	[?] OPCJE:
	[#] [mam_3_srebrne = 0, palad_brak_3_srebrnych = 0] Zaplacic. [palad_tk1_puscisz_za_3]
	    Nie masz pieniedzy. [palad_brak_3_srebrnych := 1]
	[#] [mam_3_srebrne = 1] Zaplacic. [palad_zaplata]
	[#] [palad_nie_chce_zlota = 0] Zaproponowac 3 zlote. [palad_czy_chce_zloto]

	[#][palad_o_wladcy = 0] Zapytac o wladce podziemi. [palad_talk1_znasz_wladce]
	   [palad_o_wladcy := 1]
	[#] Zakonczyc rozmowe [paladyn_nie_pogada] Odsuwasz sie od Pladyna.

[##][palad_zaplata]
	Dajesz paladynowi trzy srebrne. Paladyn chowa je do swojej sakiewki. / -Prosze, przechodz.
	[->][palad_3way][mam_3_srebrne := 0, palad_ma_3_srebrne := 1]

[##][palad_czy_chce_zloto]
	-A moga byc 3 zlote? / -Nie potrzebuje zlota. Mam juz zlota przyubice, zlota zbroje,
	zlote nagolenniki, zlote... / -Dobra oszczedz mi tego.
	[->][palad_tk1_puscisz_za_3][palad_nie_chce_zlota := 1]

[##][paladyn_talk1_chce_wziac_miecz]
	-Chce wziasc twoj miecz. / -Najpierw musisz mnie pokonac.
	[->][paladyn_angry]

[##][paladyn_talk1_chce_cie_zabic]
	-Mam zamiar cie zabic. / -No to sprobuj.
	[->][paladyn_angry]


[//]----------------------- BASKET ROOM -----------------------------------------

[##][kosz]
	[->][czar_idzie_do_tronu = 1][kosz_czar_idzie]
	[->][drag_czycha = 1][kosz_drag_czycha][drag2_w_furii := 1, drag_czycha := 0]
	[->][drag2_w_furii = 1][kosz_drag_goni]
	[->][kosz_short = 1][kosz_walk_ops]
	[->][kosz_put_down = 1][kosz_off][kosz_short := 1]
	[->][restor_is_chasing = 1][kosz_run][restor_is_chasing := 0, kosz_put_down := 1]
	[->][kosz_burn]

[##][kosz_drag_czycha]
	Po srodku skrzyzowania, obok przewroconego kosza stoi wsciekly smok. Zauwaza cie i rusza do ataku.
	[?] OPCJE:
	[#] Uciekac. [^E.TH ^E.TTD][T1] Pedzisz na wschod. Smok za toba. Docierasz do
		skrzyzowania w ksztalcie litery T.
	[#] Walczyc. [drag_attack]

[##][kosz_off]
	Na srodku skrzyzowania stoi kosz z weglem. Kosz juz nie plonie.
	[->][kosz_walk_ops]

[##][kosz_czar_idzie]
	Na srodku skrzyzowania stoi kosz z weglem. Kosz juz nie plonie. Czarownik idzie dalej na poludnie.
	[?] OPCJE:
	[#] Isc za czarownikiem na polodnie. [^S.TTL][palad] Idziesz na poludnie za czarownikiem,
		az dochodzicie do skrzyzowania w ksztalcie litery T.
	[#] Isc na polnoc. [^N.#][drag] Idziesz na polnoc, az dochodzisz do groty.
		[czar_idzie_do_tronu := 0, czar_u_tronu := 1]
	[#] Isc na wschod. [^E.TH ^E.TTD][T1] Opuszczasz to miejsce kierujac sie na wschod.
	    Po chwili dochodzisz do skrzyzowania w ksztalcie litery T.
		[czar_idzie_do_tronu := 0, czar_u_tronu := 1]
	[#] Isc na zachod. [^W.TH ^W.TLL ^N.TCV][restor] Idziesz na zachod tunelem, ktory wkrotce skreca
	    na polnoc. Idac nim dalej, dochodzisz do niewielkiej jaskini.
		[czar_idzie_do_tronu := 0, czar_u_tronu := 1]

[##][kosz_run]
	Na srodku komnaty stoi kosz, w ktorym pali sie ogien. Mozesz stad biec dalej na
	polnoc, poludnie i wschod.
	[?] OPCJE:
	[#] Pobiec na polnoc. [^N.#][drag] Biegniesz na polnoc, az docierasz do groty.
	    Chyba udalo ci sie uciec Restorowi.
		[restor_is_chasing := 0, restor_left_room :=1]
	[#] Pobiec na poludnie. [^S.TTL][palad]
		Biegniesz na poludnie, az docierasz do skrzyzowania w ksztalcie litery T. Chyba zgubiles Restora.
		[restor_is_chasing := 0, restor_left_room :=1]
	[#] Pobiec na wschod. [^E.TH ^E.TTD][T1]
		Biegniesz na wschod, az docierasz do skrzyzowania w ksztalcie litery T. Chyba zgubiles Restora.
		[restor_is_chasing := 0, restor_left_room :=1]
	[#] Wrocic do Restora. [^W.TH][restor_revange]

[##][kosz_burn]
	Na srodku stoi kosz z weglem. W koszu pali sie ogien, rozjasniajac skrzyzowanie.
	[->][kosz_walk_ops]

[##][kosz_walk_ops]
	Stad mozesz sie udac we wszystkie cztery strony.
	[?] OPCJE:
	[#] Isc na polnoc. [^N.#][drag] Idziesz na polnoc, az dochodzisz do groty.
	[#] Isc na polodnie. [^S.TTL][palad] Idziesz na poludnie, az dochodzisz do skrzyzowania
	    w ksztalcie litery T.
	[#] Isc na wschod. [^E.TH ^E.TTD][T1] Opuszczasz to miejsce kierujac sie na wschod.
	    Po chwili dochodzisz do skrzyzowania w ksztalcie litery T.
	[#] Isc na zachod. [^W.TH ^W.TLL ^N.TCV][restor] Idziesz na zachod tunelem, ktory wkrotce skreca
	    na polnoc. Idac nim dalej, dochodzisz do niewielkiej jaskini.

[##][kosz_drag_goni]
	Potykasz sie o przewrocony kosz. Smok wpadana skrzyzowanie.
	[?] OPCJE:
	[#] Wiac polnoc. [^N.#][drag] Biegniesz dalej. Na polnoc. Do groty.
	[#] Wiac wschod. [^E.TH ^E.TTD][T1] Pedzisz na wschod. Smok za toba. Docierasz do
		skrzyzowania w ksztalcie litery T.
	[#] Wiac zachod. [^W.TH ^W.TLL ^N.TCV][restor] Pedzisz na zachod tunelem, ktory wkrotce skreca
	    na polnoc. wpadasz do niewielkiej jaskini.
	[#] Zaatakowac smoka. [drag_attack]


[//]----------------------------- RESTOR ------------------------------------------

[##][restor]
	[->][czar_idzie_do_tronu = 1][restor_left_room]
	[->][czar_u_tronu = 1][restor_left_room]
	[->][czar_jest_u_restora = 1][restor_czar][znam_czarownika := 1]
	[->][drag_dead = 1, wiem_o_zabitym_smoku = 1][restor_czar]
		[znam_czarownika := 1, czar_jest_u_restora := 1]
	[->][drag2_w_furii = 1][restor_drag_czycha]
	[->][restor_left_room = 1][restor_left_room]
	[->][restor_init][znam_restora := 1]

[##][restor_czar]
	Po srodku jaskinii stoi czarownik. W reku trzyma rozdzke,
	[->][wiz_oszukal = 1][restor_czar_i_zlote]
	[->][restor_czar_bez_zlotych]

[##][restor_czar_bez_zlotych]
	a kolo niego leza trzy srebrne.
	[->][restor_czar_opcje]

[##][restor_czar_i_zlote]
	a kolo niego leza trzy srebrne i trzy zlote.
	[->][restor_czar_opcje]

[##][restor_czar_tk]
	[->][palad_martwy_u_siebie = 0, palad_chce_3_srebrne = 1, wiem_o_zabitym_smoku = 1, byla_gadka = 1]
		[restor_czar_tk_sekwencja]
	[->][restor_czar_tk1_intro][byla_gadka := 1]

[##][restor_czar_tk_sekwencja]
	[->][restor_czar_tkpalad_gadalem = 0][restor_czar_tkpalad]
	[->][restor_czar_tkdziura_gadalem = 0, znam_tunel = 0, mam_siekiere = 0]
		[restor_czar_tkdziura]
		[restor_czar_tkdziura_gadalem := 1]
	[->][znam_zlote_wrota = 1, restor_czar_tk2_gadalem = 0][restor_czar_tk2]
		[restor_czar_tk2_gadalem := 1]
	[->][mam_zloty_klucz = 1, restor_czar_tk3_gadalem = 0][restor_czar_tk3]
		[restor_czar_tk3_gadalem := 1]
	[->][gold_key_nie_dziala = 1, restor_czer_tk4_gadalem = 0][restor_czar_tk4]
		[restor_czer_tk4_gadalem := 1]
	[->][gold_key_nie_dziala = 1, restor_czer_tk5_gadalem = 0][restor_czar_tk5]
		[restor_czer_tk5_gadalem := 1]
	[->][gold_key_nie_dziala = 1, restor_czer_tk5_gadalem = 1, has_silver_key = 0]
		[restor_czar_tk6]
	[->][restor_czer_tk7_gadalem = 0, has_silver_key = 1][restor_czar_tk7]
		[restor_czer_tk7_gadalem := 1]
	[->][restor_czar_tk8_gadalem = 0, mam_zwabic_czara = 1][restor_czar_tk8]
		[restor_czar_tk8_gadalem := 1]
	[->][restor_czar_tk_spadaj]

[##][restor_czar_tkpalad]
	[->][restor_czar_tkpalad_init = 0][restor_czar_tkpalad_init][restor_czar_tkpalad_init := 1]
	[->][zalatwic_paladyna = 1, czar_zadowolony = 0][restor_czar_tkpalad_czy_zalatwiles]
	[->][zalatwic_paladyna = 1, czar_zadowolony = 0][restor_czar_tkpalad_czy_zalatwiles]
	[->][restor_czar_tkpalad_namysliles]

[##][restor_czar_tkdziura]
	-Czarowniku, jak wlasciwie sie tu znalazles? / -A wyszedlem z tej dziury. /
	Czarownik pokazuje w glab komnaty. Faktycznie widac jakas dziure.
	[->][restor_czar_opcje_niepogada][znam_tunel := 1]

[##][restor_czar_tkpalad_czy_zalatwiles]
	-Czesc czarowniku. / -I co zalatwiles go?
	[?] CO POWIESZ:
	[#] "Tak." [restor_czar_tkpalad_czy_zalatwiles_tak]
	[#] "Jeszcze nie. [restor_czar_tkpalad_nie_zawracaj_glowy] -Jeszcze nie. /

[##][restor_czar_tkpalad_nie_zawracaj_glowy]
	-To nie zawracaj mi glowy. / Czarownik zaczyna grzebac przy guzikach od plaszcza.
	[->][restor_czar_opcje_niepogada]

[##][restor_czar_tkpalad_czy_zalatwiles_tak]
	-Tak. / -Tak? / -Tak. / -A moze nie zalatwiles. / -O co ci chodzi? / -Chce jego pierscien na dowod.
	[?] CO POWIESZ:
	[#] [mam_pierscien_paladyna = 1] "Prosze." [restor_czar_tkpalad_daje_pierscien]
	[#] "Nie mam pierscienia." [restor_czar_tkpalad_nie_zawracaj_glowy] / -Nie mam pierscienia. /

[##][restor_czar_tkpalad_namysliles]
	-Hej czarowniku. / -To jak? Robimy interes?
	[->][proponuje_zalatwic_paladyna = 1][restor_czar_tkpalad_zalatwic]
	[->][restor_czar_tkpalad_opcje]

[##][restor_czar_tkpalad_daje_pierscien]
	-Prosze. / Dajesz pierscien czarownikowi. Usmiecha sie szeroko. / -Dobra robota. Wpadnij tu pozniej.
	[->][restor_czar_opcje_niepogada]
		[mam_pierscien_paladyna := 0, czar_zadowolony := 1, restor_czar_tkpalad_gadalem := 1]

[##][restor_czar_tkpalad_init]
	-Czarowniku, potrzebuje twojej pomocy. / -A to czemu? / -Bo chyba utkanlem tu w podziemiach. /
	-Jak to? / -Paladyn chce ode mnie trzy srebrne, a jak mu je dam, jak nie mam? /
	-Moge ci zamienic trzy zlote na trzy srebrne.
	[->][restor_czar_tkpalad_opcje]

[##][restor_czar_tkpalad_opcje]
	[?] CO TY NA TO:
	[#] "Zgoda." [restor_czar_tkpalad_zgoda1]
	[#] "Nie ma mowy." [restor_czar_tkpalad_nie_ma_mowy]

[##][restor_czar_tkpalad_zgoda1]
	-Zgoda / -Ale.. / -Ale? / -Musiz mi wyswiadczyc pewna przysluge. / -A jaka. /
	-Masz sie pozbyc tego durnia. Zalatwic go.
	[->][restor_czar_tkpalad_zalatwic][proponuje_zalatwic_paladyna := 1]

[##][restor_czar_tkpalad_zalatwic]
	[?] CO TY NA TO:
	[#] "Zgoda." [restor_czar_tkpalad_zgoda2] -Zgoda. /
	[#] "Nie ma mowy." [restor_czar_tkpalad_nie_ma_mowy]

[##][restor_czar_tkpalad_zgoda2]
	[->][mam_3_zlote = 1, mam_3_srebrne = 0][restor_czar_tkpalad_wymiana]
	[->][mam_3_zlote = 0, mam_3_srebrne = 0][restor_czar_tkpalad_czekam]
	[->][FAIL]

[##][restor_czar_tkpalad_czekam]
	-No to czekam na trzy zlote. / Czarownik wraca do swoich zajec.
	[->][restor_czar_opcje_niepogada][zalatwic_paladyna_zgoda := 1]

[##][restor_czar_tkpalad_wymiana]
	-No to prosze. / Czarownik daje ci trzy srebrne, a ty mu trzy zlote. /
	-Tylko pamietaj cos obiecal.
	[->][restor_czar_opcje_niepogada]
		[zalatwic_paladyna := 1, mam_3_srebrne := 1, mam_3_zlote := 0]

[##][restor_czar_tkpalad_nie_ma_mowy]
	-Nie ma mowy. / -Do zobaczenia niebawem. / Czarownik wraca do swoich zajec.
	[->][restor_czar_opcje_niepogada]

[##][restor_czar_tk7]
	-Czarowniku, mam sprawe. / -Jak chcesz zebym cie wysluchal musisz mi nazbierac
	czrciego ziela. / -A gdzie ono rosnie. / -Na polu, pod lasem. / -No ale to
	przeciez poza podziemiami. / -No jakby bylo w podziemiac, to sam bym se nazrywal.
	/ Czarownik zdenerwowany zaczyna czyscic swoja rozdzke.
	[->][restor_czar_opcje_niepogada]

[##][restor_czar_tk8]
	-Czarowniku! / -Masz czarcie ziele?
	[?] CO POWIESZ:
	[#] "Nie." [restor_czar_opcje_niepogada] -Nie. / -No to wynocha!
		[restor_czar_tk8_gadalem := 0]
	[#] "Nie, ale wiem, gdzie jest." [restor_czar_tk8_gdzie]

[##][restor_czar_tk8_gdzie]
	-Nie, ale wiem, gdzie jest. / -Co? Tu w podziemiach?
	[?] CO POWIESZ:
	[#] [restor_czar_tk8_bylo_w_dupie = 0] "Nie. W dupie." [restor_czar_atakuje]
		-Nie. W dupie. / -Ty gnoju! Zabije cie. / Czarownik wyciaga swa rozdzke.
		[restor_czar_tk8_gadalem := 0, restor_czar_tk8_bylo_w_dupie := 1]
	[#] "Tak. W palacyku Restora." [restor_czar_tk8_idziemy]

[##][restor_czar_tk8_idziemy]
	-Tak. W palacyku Restora. / -No to idziemy!
	/ Czarownik, nie zwazajac na ciebie wychodzi z komnaty.
	Nie majac nic lepszego do roboty idziesz za nim; na poludnie, potem na wschod. Docieracie do skrzyzowania.
	[->][^S.TLL ^E.TH ^E.TX][kosz][czar_idzie_do_tronu := 1]

[##][restor_czar_tk6]
	-Czarowniku, wrocilem. / -To co robimy interes?
	[?] CO POWIESZ:
	[#] [czarownik_dal_znizke = 0] "Zgoda." [restor_czar_tk5_zgoda1]
	[#] [czarownik_dal_znizke = 1] "Zgoda." [restor_czar_tk5_zgoda2]
	[#] [czarownik_dal_znizke = 0] "Chcesz za wiele." [restor_czar_tk5_targi]
		-Chcesz za wiele. / -Dobra, zloty klucz za srebrny.
		[czarownik_dal_znizke := 1]
	[#] "Nic z tego." [restor_czar_opcje_niepogada] -Nic z tego. / -Jeszcze wrocisz po ten klucz.

[##][restor_czar_tk5]
	-Czarowniku, zloty klucz nie dziala. / -Moze chcesz srebrny? Znalazlem go  przy smoku. /
	-Dasz mi go? / -Nie. / -A chcesz sie wymienic na zloty? / -Tak, ale musisz mi doplacic
	trzy srebrne.
	[?] CO POWIESZ:
	[#] "Zgoda." [restor_czar_tk5_zgoda1]
	[#] "Nic z tego." [restor_czar_tk5_targi]
		-Nic z tego. / -Dobra, zloty klucz za srebrny.
		[czarownik_dal_znizke := 1]

[##][restor_czar_tk5_targi]
	[?] CO POWIESZ:
	[#] "Zgoda." [restor_czar_tk5_zgoda2]
	[#] "Nic z tego." [restor_czar_opcje_niepogada] -Nic z tego. / -Jeszcze wrocisz po ten klucz.

[##][restor_czar_tk5_zgoda2]
	-Zgoda. / -To dawaj klucz. / -Ty dawaj najpierw srebrny. / Czarownik usmiecha sie chytrze
	i podaje ci srebrny klucz. Ty mu dajesz zloty. Czarownik zamysla sie, ogladajac swoj nowy
	klucz.
	[->][restor_czar_opcje_niepogada][mam_zloty_klucz := 0, has_silver_key := 1]

[##][restor_czar_tk5_zgoda1]
	-Zgoda. /
	[->][mam_zloty_klucz = 1, mam_3_srebrne = 1][restor_czar_tk5_zakup]
	[->][restor_czar_tk5_poszukaj_kasy]

[##][restor_czar_tk5_poszukaj_kasy]
	-No to czekam na pieniadze.
	[->][restor_czar_opcje_niepogada]

[##][restor_czar_tk5_zakup]
	Dajesz czarownikowi zloty klucz. / -A trzy srebrne? / -Najpierw srebrny klucz. /
	Czrownik usmiecha sie. Podaje ci srebrny klucz. Ty dajesz mu trzy srebrne. /
	-No to spadaj - mowi czarownik i zaczyna uwaznie ogladac klucz.
	[->][restor_czar_opcje_niepogada]
		[mam_zloty_klucz := 0, has_silver_key := 1, mam_3_srebrne := 0, czar_ma_3_srebrne := 1]

[##][restor_czar_tk4]
	-Czarowniku? / -Co? / -Chodzi o taki napis w pewnej komnacie. / -O haslo? / -Tak, znasz haslo? /
	-A po co ci haslo? / -Chce wyjsc z podziemi. / -To wyjdz. / -Ale nie moge. / -To nie wychodz. /
	-Ale potrzebuje hasla. / -No to albo chcesz wyjsc, albo chcesz haslo! / -Chce haslo. / -Nie znam. /
	Czarownik zaczyna grzebac przy swoim sznurku od plaszcza.
	[->][restor_czar_opcje_niepogada]

[##][restor_czar_tk3]
	-Czarowniku, widzialem sie ta twoja kochanke. / -A niech Piorun wezmie te parszywa zmore! /
	Czarownik zaczyna cos dlubac przy swojej rozdzce.
	[->][restor_czar_opcje_niepogada]

[##][restor_czar_tk2]
	-Czarowniku? / -Co? / -Mam maly problem. / -Maly problem to nie problem. /
	-A jaki problem to problem? / -Sredni, duzy i bardzo duzy. / -No to ja mam sredni. /
	-A jaki?
	[?] CO POWIESZ:
	[#] "Sredni." [restor_czar_opcje_niepogada]
		-Sredni. / -Ty, zartow ci sie zachcialo? Wynocha.
		[restor_czar_tk2_gadalem := 0]
	[#] "Chodzi o zlote wrota." [restor_czar_tk2_o_wrota]

[##][restor_czar_tk2_o_wrota]
	-Chodzi o zlote wrota. / -Znalazles zlote wrota? / -A co? Ty moze zgubiles? /
	-Ja je zamknalem.
	[->][restor_czar_tk2_o_wrota_opcje]

[##][restor_czar_tk2_o_wrota_opcje]
	[?] CO POWIESZ:
	[#] [restor_czar_tk2_o_masz_kluczu = 0] "Skoro zamknales, to pewnie masz klucz?"
		[restor_czar_tk2_o_wrota_opcje]
		-Skoro zamknales, to pewnie masz klucz? / -No, niezupelnie, zamykaja sie na zatrzask.
		[restor_czar_tk2_o_masz_kluczu := 1]
	[#] [restor_czar_tk2_o_poco_zamykal = 0] "A po co je zamykales?"
		[restor_czar_tk2_o_wrota_opcje]
		-A po co je zamykales? / -Ktos mi kazal. / -A kto? / -Nie wiem. Polecenia przekazywal goblin. /
		-A ile ci zaplacil? / -Trzy srebrne.
		[restor_czar_tk2_o_poco_zamykal := 1]
	[#] "A wiesz jak je otworzyc?" [restor_czar_tk2_jak_otworzyc]

[##][restor_czar_tk2_jak_otworzyc]
	/ -A wiesz jak je otworzyc? / -Moze da sie wywazyc? / -Wygladaja zbyt solidnie. / -No to kluczem. /
	-A wiesz kto go ma? / -Ishara?
	[?] CO POWIESZ:
	[#] "A kto to jest ta Ishara?" [restor_czar_tk2_kto_ishara]
	[#] "A wiesz gdzie ja mozna znalezc?" [restor_czar_tk2_gdzie_ishara]

[##][restor_czar_tk2_kto_ishara]
	/ -A kto to jest ta Ishara? / -A taka jedna. Chodzila ze smokiem, ale go zdradzla. /
	-A skad wiesz? / -Bo zdradzala go ze mna. Leciala na kase i magiczne sztuczki. No i ja zalatwilem.
	[->][restor_czar_tk2_gdzie_ishara]

[##][restor_czar_tk2_gdzie_ishara]
	/ -A wiesz gdzie ja mozna znalezc? / -W podziemiach. / -Dzieki. Bardzo mi pomogles. /
	-Spoko.
	[->][restor_czar_opcje_niepogada][knows_ishara := 1]

[##][restor_czar_tk1_intro]
	-Czarowniku. / -Co?
	[->][restor_czar_tk1]

[##][restor_czar_tk1]
	[?] CO POWIESZ:
	[#] [czar_bylo_co_robisz = 0] "Co tu robisz?" [restor_czar_tk1]
		-Co tu robisz? / -Stoje. / -Aha.
	    [czar_bylo_co_robisz := 1]
	[#] [szedlem_za_czarem = 0, czar_bylo_co_robisz = 1, czar_bylo_skad = 0, znam_tunel = 0]
		"A jak sie tu znalazles?" [restor_czar_tk1]
		-A jak sie tu znalazles? / -A ta dziura w scianie. U mnie zrobilo sie duszno. /
		Faktycznie, tam gdzie pokazuje czarownik dostrzegasz dziure w scianie.
		[czar_bylo_skad := 1, znam_tunel := 1]
	[#] [czar_tk_bylo_o_konfiturze = 0] "Czym ty sie odzywiasz?" [restor_czar_tk1]
		-Czym ty sie odzywiasz? / -Kafitura.
		[czar_tk_bylo_o_konfiturze := 1]
	[#] "Nie chce mi sie z toba gadac." [restor_czar_niepogada]
		/ -Nie chce mi sie z toba gadac. / -To spadaj stad.

[##][restor_czar_tk_spadaj]
	-Czarowniku? / -Nie zawracaj mi teraz glowy. Musze sie skupic.
	[->][restor_czar_opcje_niepogada]

[##][restor_czar_opcje_niepogada]
	[?] OPCJE:
	[#] Zaatakowac czarownika. [wiz_attack]
	[#] Opuscic komnate. [^S.TLL ^E.TH ^E.TX][restor_opuscic_komnate]
	[#] [znam_tunel = 1, mam_siekiere = 0] Wlezc do dziury. [restor_tunelem]
	[#] [znam_tunel = 1, mam_siekiere = 1, nie_warto_do_tunelu = 0] Wlezc do dziury.
		[restor_czar_opcje_niepogada]
		>> To zbyt niebezpieczne, a isc nie ma po co. << [nie_warto_do_tunelu := 1]

[##][restor_czar_opcje]
	[?] OPCJE:
	[#] Zagadac do czarownika. [restor_czar_tk]
	[#] Zaatakowac czarownika. [wiz_attack]
	[#] Opuscic komnate. [^S.TLL ^E.TH ^E.TX][restor_opuscic_komnate]
	[#] [znam_tunel = 1, mam_siekiere = 0] Wlezc do dziury. [restor_tunelem]
	[#] [znam_tunel = 1, mam_siekiere = 1, nie_warto_do_tunelu = 0] Wlezc do dziury.
		[restor_czar_opcje]
		>> To zbyt niebezpieczne, a isc nie ma po co. << [nie_warto_do_tunelu := 1]

[##][restor_czar_niepogada]
	[?] OPCJE:
	[#] Zaatakowac czarownika. [wiz_attack]
	[#] Opuscic komnate. [^S.TLL ^E.TH ^E.TX][restor_opuscic_komnate]
	[#] [znam_tunel = 1, mam_siekiere = 0] Wlezc do dziury. [restor_tunelem]
	[#] [znam_tunel = 1, mam_siekiere = 1, nie_warto_do_tunelu = 0] Wlezc do dziury. [restor_tunelem]
		>> To zbyt niebezpieczne, a isc nie ma po co. << [nie_warto_do_tunelu := 1]

[##][restor_czar_atakuje]
	[?] OPCJE:
	[#] Bronic sie. [wiz_attack]
	[#] Uciekac. [^S.TLL ^E.TH ^E.TX][kosz]
		Rzucasz sie do ucieczki korytarzem na poludnie, skrecasz na wschod.
		Wkrotce docierasz do skrzyzowania.

[##][restor_drag_czycha]
	Jaskinia jest pusta. Smoka na razie nie widac.
	[->][restor_drag_czycha_opcje][drag_czycha := 1, drag2_w_furii := 0]

[##][restor_drag_czycha_opcje]
	[?] OPCJE:
	[#] Isc na poludnie [^S.TLL][restor_ide_w_lapy_smoka]
	[#] [restor_czekalem = 0] Czekac. [restor_drag_czycha_opcje]
		Czekasz... Nic sie niedzieje. [restor_czekalem := 1]
	[#] [znam_tunel = 0] Poszukac innego wyjscia. [restor_szukac_wyjscia]
	[#] [znam_tunel = 1] Wejsc do dziury. [restor_tunelem]

[##][restor_szukac_wyjscia]
	W przerazeniu masasz sciany jaskinii, szukajac jakiejkolwiek drogi ucieczki. Jest, wymacales jakas
	dziure w scianie, ledwie sie doniej zmiescisz, ale moze dokads prowadzi.
	[->][restor_drag_czycha_opcje][znam_tunel := 1]

[##][restor_tunelem]
	Wciskasz sie do dziury. To jest potworne, ledwie sie tam miescisz. Z trudem pelzniesz tunelem,
	nie mogac sie nawet odwrocic. W gore, w lewo, w prawo, w lewo, w dol, w gore... Juz nie wiesz gdzie jestes.
	Ale wilgotna dziura ciagnie sie dalej. Idziesz w klaustrofobicznym leku... /
	W koncu dziura poszerza sie, mozesz wyjsc, stanac. Jestes w jakiejs komnacie.
	[->][^E ^E ^E ^E ^E ^E ^E ^E ^S.TCV][wiz]

[##][restor_ide_w_lapy_smoka]
	Ruszasz korytarzem na poludnie. Korytarz wkrotce zakreca na wschod. Wychylasz si zza zakretu. Nagle
	zostajesz podpalony przez smoka. Padasz zweglony na ziemie po krotkiej szamotaninie.
	[+]

[##][restor_init]
	Po srodku jaskini stoi Restor. W reku trzyma wlocznie. Obok Restora lezy zelazny klucz.
	Jedyne wyjscie z jaskini to te, ktorym tu przyszedles.
	[?] OPCJE:
	[#] Zagadac do Restora. [restor_talk1]
	[#] Zaatakowac Restora. [restor_melee]
	[#] Siegnac po klucz. [restor_niepogada] Podchodzisz do przodu i siegasz po klucz. Restor, widzac to,
		uderza cie wlocznia po lapach. Cofasz sie pod sciane.
	[#] Opuscic komnate. [^S.TLL ^E.TH ^E.TX][restor_opuscic_komnate]

[##][restor_opuscic_komnate]
	Wychodzisz z jaskini korytarzem, ktory biegnie na poludnie,
	a nastepnie skreca na wschod. Wkrotce dochodzisz do skrzyzowania.
	[->][kosz]

[##][restor_chase]
	Blyskawicznie robisz krok do przodu i chwytasz klucz. /
	-Ty zlodzieju! - krzyczy Restor i rusza na ciebie. Lecz ty szybko wybiegasz
	z komnaty. Restor rusza za toba. Dobiegasz do zakretu i skrecasz na wschod,
	az dobiegasz do skrzyzowania. Ogladasz sie za siebie. Restora nie widac, ale
	slyszysz jego kroki.
	[->][^S.TLL ^E.TH ^E.TX][kosz]

[##][restor_niepogada]
	[?] OPCJE:
	[#] Zaatakowac Restora. [restor_melee]
	[#] Szybko chwycic klucz i uciec. [restor_chase][restor_is_chasing := 1, has_restor_key := 1]
	[#] Uciec z jaskini. [^S.TLL ^E.TH ^E.TX][kosz] Szybko wybiegasz korytarzem na poludnie, ktory wkrotce zakreca na wschod.
		Dobiegasz doskrzyzowania.

[##][restor_left_room]
	Jaskinia jest pusta. Jedyne wyjscie to te, ktorym tu przyszedles. Wychodzisz z jaskini i wracasz do skrzyzowania.
	[->][^S.TLL ^E.TH ^E.TX][kosz]

[##][restor_talk1]
	[?] O CZYM:
	[#] O kluczu. [restor_talk1_key]
	[#] O Restorze. [restor_talk1_key] -Czesc Restor, co tu robisz? / -Pilnuje klucza. /
	[#] O wloczni Restora. [restor_talk1_key] -Restor, daj mi swoja wlocznie. / -Jak ci ja dam, nie bede mial czym bronic klucza. /
	[#] O Wladcy Podziemi. [restor_kto_wladca]
	[#] Nie rozmawiac. [restor]

[##][restor_talk1_key]
	-Co to za klucz? / -Ten klucz otwiera zamek przy pewnej kracie. /
	-Daj mi go. / -Jestem klucznikiem i nie daje kluczy byle komu. /
	-Klucze po podziemiach juz dlugo i ten twoj klucz moze miec kluczowe znaczenie dla mojej misji. Daj mi go. /
	-To wykluczone!
	[->][restor_niepogada]

[##][restor_kto_wladca]
	-Restor, czy znasz Wladce Podziemi? / -Jasne, ze znam. Przeciez to Paldyn.
	[?] OPCJE:
	[#] Zapytac o klucz. [restor_talk1_key]
	[#] Siegnac po klucz. [restor_niepogada] Podchodzisz do przodu i siegasz po klucz. Restor, widzac to,
		uderza cie wlocznia po lapach. Cofasz sie pod sciane.
	[#] Zaatakowac Restora. [restor_melee]
	[#] Opuscic komnate. [^S.TLL ^E.TH ^E.TX][restor_opuscic_komnate]

[##][restor_revange]
	Idziesz powoli na zachod, az nagle zza zakretu wyskakuje Restor. Restor ciska w ciebie wlocznia.
	Padasz martwy na ziemie. Twoja wedrowka dobiegla konca.
	[+]

[##][restor_melee]
	Rzucasz sie na Restora z piesciami. Restor chwyta wlocznie i ciska nia  w ciebie.
	Padasz na ziemie przeszyty wlucznia. Twoja wedrowka dobieglakonca.
	[+]


[//]-------------------------  SMOK  -----------------------------------------------------

[##][drag]
	[->][drag2_w_furii = 1, drag_gold_taken = 1][drag_drag_w_furii_zabralem_zloto]
	[->][drag2_w_furii = 1, drag_gold_taken = 0][drag_drag_w_furii_jest_zloto]
	[->][drag_gold_taken = 1][drag_no_gold]
	[->][drag_left = 1][drag_left]
	[->][drag_opened = 1][drag_cave]
	[->][drag_closed]

[##][drag_drag_w_furii_zabralem_zloto]
	W komnacie sa tylko porozrzucane kosci i czaszki. Smok wpada za toba i czegos jakby szuka.
	/ -I na dodatek zabrales mi zloto zlodzieju! / -Smok atakuje. Musisz sie bronic.
	[->][drag_attack]

[##][drag_drag_w_furii_jest_zloto]
	W komnacie sa tylko porozrzucane kosci i czaszki. Smok wpada za toba i czegos jakby szuka.
	/ -O, moje zloto. Zapomnialem o nim. / Po chwili smok przypomina sobie po co tu przylecial.
	/ -A ciebie gnoju zaraz...
	[?] OPCJE:
	[#] Zaatakowac smoka. [drag_attack]
	[#] Uspokoic smoka. [drag_w_furii_uspokoic][drag2_w_furii := 0]

[##][drag_w_furii_uspokoic]
	-Smoku, spokojnie, chyba wiem cos, co cie zaciekawi. / -Co?
	[?] CO POWIESZ:
	[#] "Gowno, baranie!" [door_drag_atakuje] -Gowno, baranie!
	[#] "To czarownik ma te srebrne." [drag] -To czarownik ma te srebrne. /
		-Oby mial. Zaraz sam sprawdze, ale jak nie... / Smok opuszcza komnate.
		[drag_killed_wiz := 1]

[##][drag_closed][^.#]
	Wejscia do niej broni wielka spizowa krata, zamknieta na klucz.
	[?] OPCJE:
	[#] [has_restor_key = 1] Otworzyc zamek kluczem. [drag_door_opened][drag_opened := 1]
	[#] Wrocic do skrzyzowania. [^S.TX][kosz] Wracasz do skrzyzowania.

[##][drag_door_opened]
	Wkladasz klucz do zamka i przekrecasz go. Zamek ustepuje, a krata otwiera sie.
	[?] OPCJE:
	[#] Wejsc do srodka. [drag_cave] Wchodzisz do wnetrza.
	[#] Wrocic do skrzyzowania. [^S.TX][kosz] Wracasz do skrzyzowania.

[##][drag_cave][^.TCV]
	Po srodku groty siedzi wielki czerwony smok. Chroni swoj skarb - trzy zlote.
	Smok jest bardzo zamyslony. Dookola leza porozrzucane kosci i czaszki.
	Jedyne wyjscie z groty to te, ktorym tu przyszedles. /
	Po chwili smok spostrzega, ze tu jestes. Kieruje na ciebie swoj przeszywajacy wzrok. /
	-Czego tu chcesz?
	[?] CO POWIESZ:
	[#] "Nic, tak tylko przyszedlem." [drag_opts]
	[#] "Chce pogadac." [drag_talk1] -Chce pogadac. / -Wiec pogadajmy.
	[#] "Przyszedlem po zloto." [drag_daj_zloto] -Przyszedlem po zloto. / -No i co? /
	[#] "Chce cie zabic." [drag_chce_cie_zabic] -Chce cie zabic. / -To sprobuj! /
	[#] "Chce ci powiedziec o kims cos waznego." [drag_powiedziec_o_kims]

[##][drag_talk1]
	[?] CO POWIESZ:
	[#] [drag_q_inne_wyjscie = 0] "Czy jest z tad jakies inne wyjscie?" [drag_talk1]
	    -Czy jest z tad jakies inne wyjscie? / -A widzisz jakies? / -Nie / -No wlasnie.
	    [drag_q_inne_wyjscie := 1]
	[#] [drag_q_wladca = 0] "Znasz Wladce Podziemi?" [drag_talk1]
		-Znasz Wladce Podziemi? / -Jasne. To Restor nim jest.
		[drag_q_wladca := 1]
	[#] [drag_q_inne_wyjscie = 1] "Chce ci powiedziec o kims cos waznego." [drag_powiedziec_o_kims]
	[#] "Daj mi swoje zloto!" [drag_daj_zloto]

[##][drag_daj_zloto]
	-Dajwaj mi zloto! / -Najpierw mnie pokonaj. /
	Smok podnosi sie i obraca w twoja strone. Podnosi skrzydla i wciaga powietrze.
	[->][drag_atakuje]

[##][drag_opts]
	-Nic, tak tylko przyszedlem. / -A, to w porzadku. /
	Smok opuszcza z ciebie swoj wzrok i zaczyna dlubac sobie w zebach.
	[?] OPCJE:
	[#] Zabrac trzy zlote. [drag_zabrac_zlote]
	[#] Porozmawiac ze smokiem. [drag_talk1_start]
	[#] Zaatakowac smoka. [drag_attack]
	[#] Opuscic komnate. [^S.TX][kosz] Opuszczasz grote, kierujac sie na poludnie.
		Wkrotce dochodzisz do skrzyzowania.

[##][drag_zabrac_zlote]
	Siegasz reka po monety. Smok, nie ogladajac sie nawet na ciebie, uderza cie lapa.
	Przewracasz sie na ziemie. Podnosisz sie i patrzysz na smoka. Smok dlubie sobie w zebach.
	[?] OPCJE:
	[#] Porozmawiac ze smokiem. [drag_talk1_start]
	[#] Zaatakowac smoka. [drag_attack]
	[#] Opuscic komnate. [^S.TX][kosz] Opuszczasz grote, kierujac sie na poludnie.
		Wkrotce dochodzisz do skrzyzowania.

[##][drag_powiedziec_o_kims]
	-Chce ci powiedziec o kims cos waznego. / -O kim?
	[?] CO POWIESZ:
	[#] "O nikim." [drag_talk1_o_nikim]
	[#] "O Paladynie." [drag_talk1_o_paladynie]
	[#] [znam_czarownika = 1] "O Czarowniku." [drag_talk1_o_czarowniku]

[##][drag_talk1_o_nikim]
	-O nikim. / -To spieprzaj. / Smok przestaje zwracac na ciebie uwage.
	[->][drag_niepogada]

[##][drag_talk1_o_paladynie]
	-O Paladynie. / -Co jest z Paladynem?
	[?] CO POWIESZ:
	[#] "Nic." [drag_niepogada] -Nic. / -No to spieprzaj. / Smok odwraca sie od ciebie.
	[#] "Ma pieniadze." [drag_talk1_ma_pieniadze][palad_martwy_u_siebie := 1]

[##][drag_talk1_o_czarowniku]
	-O Czarowniku. / -Co jest z Czarownikiem?
	[?] CO POWIESZ:
	[#] "Nic." [drag_niepogada] -Nic. / -No to spieprzaj. / Smok odwraca sie od ciebie.
	[#] "Ma pieniadze." [drag_talk1_ma_pieniadze][drag_dead := 1]

[##][drag_talk1_ma_pieniadze]
	-Ma pieniadze. / -Skad wiesz? / -Bylem u niego. / -Ile ma tych pieniedzy? /
	-Trzy srebrne. I powiedzial, ze zabije kazdego, kto sprobuje mu je zabrac. /
	-To sie okaze. Dzieki za informacje. /
	Smok zrywa sie i opuszcza grote.
	[->][drag][drag_left := 1]

[##][drag_niepogada]
	[?] OPCJE:
	[#] Zaatakowac smoka. [drag_attack]
	[#] Opuscic komnate. [^S.TX][kosz] Opuszczasz grote, kierujac sie na poludnie.
		Wkrotce dochodzisz do skrzyzowania.

[##][drag_talk1_start]
	-Hej, smok. / -Co?
	[->][drag_talk1]

[##][drag_left][^.TCV]
	W grocie nikogo nie ma. Dookola porozrzucane sa kosci i czaszki. Na ziemi leza
	trzy zlote monety. Jedyne wyjscie z groty to te, ktorym tu przyszedles.
	[?] OPCJE:
	[#] Zabrac trzy zlote. [drag_money_taken][drag_gold_taken := 1, mam_3_zlote := 1]

	[#] Opuscic grote. [^S.TX][kosz] Opuszczasz grote, kierujac sie na poludnie.
		Wkrotce dochodzisz do skrzyzowania.

[##][drag_money_taken]
	Podnosisz z ziemi trzy zlote monety i wkladasz je do kieszeni. W oddali slyszysz cichy krzyk.
	Wracasz do skrzyzowania.
	[->][^S.TX][kosz]

[##][drag_no_gold]
	Grota jest pusta. Na ziemi leza jedynie czaszki i kosci. Jedyne wyjscie stad to to,
	ktorym tu przyszedles. Wracasz do skrzyzowania.
	[->][^S.TX][kosz]

[##][drag_chce_cie_zabic]
	Smok zrywa sie i ustawia przodem do ciebie. Rozposciera skrzydla i wciaga powietrze.
	[->][drag_atakuje]

[##][drag_atakuje]
	[?] OPCJE:
	[#] Zaatakowac smoka. [drag_attack]
	[#] Uciec z komnaty. [^S.TX][drag_flee]

[##][drag_flee]
	Blyskawicznie zrywasz sie i rzucasz sie w strone drzwi. Nie ogladajac sie nawet na smoka,
	wybiegasz z groty i biegniesz tunelem na poludnie, az docierasz do skrzyzowania.
	[->][kosz]

[##][drag_attack]
	[?] CZYM:
	[#] Piescia. [drag_melee]
	[#] [mam_miecz = 1] Mieczem. [drag_sword_attack]
	[#] [mam_siekiere = 1] Siekiera. [drag_axe_attack]

[##][drag_melee]
	Zamierzasz sie na smoka piescia i zadajesz cios. Smok podnosi glowe i zieje w ciebie
	chmura ognia. Zaczynasz plonac, krzyczac przerazliwie. W koncu padasz zweglony na ziemie.
	[+]

[##][drag_sword_attack]
	Zamachujesz sie mieczem i uderzasz smoka, miazdzac mu luski na szyi. Smok wycofuje sie na drugi
	koniec komnaty. Idziesz za nim i znow zamachujesz sie mieczem. Smok wydaje glosny okrzyk i ciska
	w ciebie ognista kula. Stajesz w plomieniach, krzyczac przerazliwie. Po chwili padasz zweglony
	na ziemie.
	[+]

[##][drag_axe_attack]
	Zamach siekierka, i laduje w szyii smoka. Ale smocze luski sa twarde. Smok robi krok do tylu.
	Ty za nim. Zamach siekierka, ale smok cie ubiega. Szybko ciska kula ognia. Stajesz w plomieniach,
	krzyczac przerazliwie. Po chwili padasz zweglony na ziemie.
	[+]

[//]---------------------------  T-korytarze  ---------------------------------------------------

[##][T1]
	[->][drag2_w_furii = 1][T1_drag_goni]
	[->][T1_default]

[##][T1_drag_goni]
	Drogi skrzyzowania rozchodza sie na wschod, zachod i poludnie. Smok wpada za toba zachodnim wejsciem.
	[?] OPCJE:
	[#] Biec na wschod. [^E.TH ^E.TTD][T2] Biegniesz dalej na wschod, do kolejnego skrzyzowania w ksztalcie litery T.
	[#] Biec na poludnie. [^S.TLL ^E.TH][spectre] Biegniesz waskim tunelem na poludnie. Wilgotny korytarz
		wkrotce skreca na wschod. Zgubiles smoka. Chyba nie moze przecisnac siewaskim korytarzem. Ale pewnie czeka na ciebie.
		[drag2_w_furii := 0, drag_czycha := 1]
	[#] Zaatakowac smoka [drag_attack]

[##][T1_default]
	Drogi skrzyzowania rozchodza sie na wschod, zachod i poludnie.
	[?] OPCJE:
	[#] Isc na wschod. [^E.TH ^E.TTD][T2] Ruszasz dalej waskim korytarzem na wschod, az dochodzisz do
		kolejnego skrzyzowania w ksztalcie litery T.
	[#] Isc na zachod. [^W.TH ^W.TX][kosz] Idziesz waskim tunelem na zachod, az dochodzisz do skrzyzowania.
	[#] Isc na poludnie. [^S.TLL ^E.TH][spectre] Ruszasz waskim tunelem na poludnie. Wilgotny korytarz
		wkrotce skreca na wschod.

[##][T2]
	[->][drag2_w_furii = 1][T2_drag_goni]
	[->][T2_default]

[##][T2_drag_goni]
	Drogi skrzyzowania rozchodza sie na wschod, zachod i poludnie. Smok wpada za toba zachodnim wejsciem.
	[?] OPCJE:
	[#] Biec na wschod. [^E.TH][do_czarownika] Biegniesz dalej na wschod. Wpadasz do komnaty.
	[#] Biec na poludnie. [^S.TLR ^W.TH][spectre] Biegniesz waskim tunelem na poludnie. Wilgotny korytarz
		wkrotce skreca na zachod. Zgubiles smoka. Chyba nie moze przecisnac siewaskim korytarzem. Ale pewnie czeka na ciebie.
		[drag2_w_furii := 0, drag_czycha := 1]
	[#] Zaatakowac smoka [drag_attack]

[##][T2_default]
	Drogi skrzyzowania rozchodza sie na wschod, zachod i poludnie.
	[?] OPCJE:
	[#] Isc na wschod. [^E.TH][do_czarownika] Podazasz dlugim korytarzem na wschod, az w koncu dochodzisz do komnaty.
	[#] Isc na zachod. [^W.TH ^W.TTD][T1] Idziesz korytarzem na zachod, az dochodzisz do drugiego skrzyzowania
		w ksztalcie litery T.
	[#] Isc na poludnie. [^S.TLR ^W.TH][spectre] Kierujesz sie na poludnie waskim i wilgotnym korytarzem, ktory wkrotce
		skreca na zachod.

[##][do_czarownika]
	[->][drag_dead = 1][do_czarownika_nie_mozna]
	[->][^E.TCV][wiz]

[##][do_czarownika_nie_mozna][^.#]
	Niestety nie mozesz do niej wejsc, gdyz w waskim korytarzu lezy wielki martwy smok, zagradzajac przejscie.
	Wracasz do skrzyzowania w ksztalcie litery T.
	[->][^W.TTD][T2][wiem_o_zabitym_smoku := 1]

[//]----------------------------------  SPECTRE  -----------------------------------------------------------

[##][spectre]
	[->][knows_ishara = 1, mam_zloty_klucz = 0][spectre_visible]
	[->][spectre_invisible]

[##][spectre_invisible]
	Idac dalej dochodzisz do miejsca, w ktorym korytarz rozszerza sie. Mozeszsz stad pojsc dalej, albo zawrocic.
	[->][spectre_leave]

[##][spectre_visible]
	Idac dalej dochodzisz do miejsca, w ktorym korytarz rozszerza sie. Mozeszsz stad pojsc dalej, albo zawrocic.
	[?] OPCJE:
	[#] Isc na wschod. [^E.TLR ^W.TH][spectre_appear]
	[#] Isc na zachod. [^W.TLL ^N.TTD][T1] Ruszasz korytarzem na zachod. Waski i wilgotny korytarz wkrotce skreca
		na polnoc. Dochodzisz do skrzyzowania w ksztalcie litery T.

[##][spectre_appear]
	Ruszasz korytarzem na wschod, gdy nagle za soba slyszysz dziwny glos. Odwracasz sie i widzisz na wpol przezroczysta
	zjawe, wpatrujaca sie w ciebie. Zjawa wyciaga reke w twoja strone w dloni trzyma zloty klucz.
	[?] OPCJE:
	[#] Siegnac po klucz. [spectre_siegnac]
	[#] Czekac. [spectre_czekac]
	[#] Uciec z tego miejsca. [^E.TLR ^N.TTD][T2] Szybko odwracasz sie i biegniesz korytarzem na wschod,
		ktory zaraz skreca na polnoc. Dobiegasz do skrzyzowania w ksztalcie litery T.

[##][spectre_siegnac]
	Powoli siegasz po klucz. Zjawa, spostrzegajac co chcesz zrobic, atakuje cie. Zapadasz w ciemnosc... /
	Budzisz sie w rozszerzeniu korytarza biegnacego ze wschodu ma zachod.
	[->][spectre_leave]

[##][spectre_czekac]
	Stoisz w bezruchu. Zjawa wciaz patrzy sie na ciebie, az w koncu znika. Zloty klucz, ktory trzymala spada
	na ziemie. Nie zastanawiajac sie, podnosisz go. Teraz mozesz odejsc z tego miejsca.
	[->][spectre_leave][mam_zloty_klucz := 1]

[##][spectre_leave]
	[?] OPCJE:
	[#] Isc na wschod. [^E.TLR ^N.TTD][T2] Ruszasz waskim i wilgotnym korytarzem na wschod.
		Korytarz szybko zakreca na polnoc. Idac nim dalej dochodzisz do skrzyzowania w ksztalcie litery T.
	[#] Isc na zachod. [^W.TLL ^N.TTD][T1] Ruszasz korytarzem na zachod. Waski i wilgotny korytarz wkrotce skreca
		na polnoc. Dochodzisz do skrzyzowania w ksztalcie litery T.


[//]--------------------------------  WIZARD  --------------------------------------------------------------

[##][wiz]
	[->][czar_jest_u_restora = 1, drag_killed_wiz = 0][czar_pusto]
	[->][czar_jest_u_restora = 0, drag_killed_wiz = 1][czar_smok]
	[->][czar_jest_u_restora = 0, drag_killed_wiz = 0][czar_czar]
	[->][FAIL]

[##][czar_smok]
	[->][mam_siekiere = 1, mam_rozdzke = 1, wiz_oszukal = 0][wiz_drag_bez_przedmiotow_bez_zlota]
	[->][mam_siekiere = 1, mam_rozdzke = 1, wiz_oszukal = 1][wiz_drag_bez_przedmiotow_i_3_zlote]
	[->][wiz_oszukal = 0][wiz_drag_przedmioty_bez_zlota]
	[->][wiz_oszukal = 1][wiz_drag_przedmioty_i_trzy_zlote]
	[->][FAIL]

[##][czar_czar]
	[->][drag2_w_furii = 1, wiz_dead = 0][wiz_vs_drag][znam_czarownika := 1]
	[->][drag2_w_furii = 1, wiz_dead = 1][FAIL]
	[->][wiz_oszukal = 1][wiz_oszukal]
	[->][wiz_new][znam_czarownika := 1]

[##][czar_pusto]
	W wielkiej komnacie nikogo nie ma.
	[->][mam_siekiere = 1][czar_pusto_opis]
	[->][czar_pusto_siekiera]

[##][czar_pusto_siekiera]
	Na ziemi lezy siekiera.
	[->][czar_pusto_opis]

[##][czar_pusto_opis]
	Jedyne wyjscie z tej komnaty, waski tunel prowadzacy na zachod, jest zagrodzone cialem wielkiego
	martwego smoka.
	[?] OPCJE:
	[#] Wlezc spowrotem do dziury. [wiz_wyjsc_tunelem] Wciskasz sie spowrotem do dziury.
	[#] [mam_siekiere = 0] Zabrac siekiere. [wiz_wyjsc_tunelem] Podnosisz z ziemi siekiere, po czym gramolisz
		sie spowrotem do dziury. [mam_siekiere := 1]

[##][wiz_drag_bez_przedmiotow_bez_zlota]
	W wielkiej komnacie na drugim jej koncu siedzi smok i probuje podrapac sie po zadzie. Wchodzisz dalej.
	Na ziemi widzisz lezacego martwego czarownika. Smok przestaje liczyc i patrzy na ciebie. /
	-To znowu ty.
	[->][wiz_dead_opcje]

[##][wiz_drag_przedmioty_bez_zlota]
	W wielkiej komnacie, na drugim jej koncu siedzi smok i ostrzy pasury o posadzke. Wchodzisz dalej.
	Na ziemi lezy martwy czarownik, a obok niego rozdzka i siekiera. Smok spostrzega, ze wszedles i zwraca na ciebie uwage.
	[->][smok_zaproponowal_przedmioty = 0][smok_proponuje_przedmioty][smok_zaproponowal_przedmioty := 1]
	[->][wiz_dead_opcje]

[##][wiz_drag_bez_przedmiotow_i_3_zlote]
	W wielkiej komnacie na drugim jej koncu siedzi smok i przelicza swoj skarb - trzy zlote i trzy srebrne
	monety. Wchodzisz dalej. Na ziemi widzisz lezacego martwego czarownika. Smok przestaje liczyc i patrzy
	na ciebie. / -To znowu ty.
	[->][wiz_dead_opcje]

[##][wiz_drag_przedmioty_i_trzy_zlote]
	W wielkiej komnacie, na drugim jej koncu siedzi smok i zaciera lapy z zadowolenia. Ma teraz trzy zlote i
	trzy srebrne. Wchodzisz dalej. Na ziemi lezy martwy czarownik, a obok niego rozdzka i siekiera. Smok
	spostrzega, ze wszedles i zwraca na ciebie uwage.
	[->][smok_zaproponowal_przedmioty = 0][smok_proponuje_przedmioty][smok_zaproponowal_przedmioty := 1]
	[->][wiz_dead_opcje]

[##][smok_proponuje_przedmioty]
	/ -Miales racje. Czarownik zabral te monety. Znalazlem przy nim jakies rzeczy. Jezeli chcesz, mozesz je zabrac.
	[->][wiz_dead_opcje]

[##][wiz_dead_opcje]
	[?] OPCJE:
	[#] [mam_siekiere = 0, mam_rozdzke = 0] Zabrac rozdzke i siekiere. [wiz_dead_opcje]
		Podnosisz z ziemi rozdzke i siekiere i bierzesz je ze soba.
		[mam_siekiere := 1, mam_rozdzke := 1]
	[#] Zgadac do smoka. [wiz_drag_talk1]
	[#] Zaatakowac smoka. [drag_attack]
	[#] Opuscic komnate. [^W.TH ^W.TTD][wiz_leave]

[##][wiz_dead_opcje_bez_gadania]
	[?] OPCJE:
	[#] [mam_siekiere = 0, mam_rozdzke = 0] Zabrac rozdzke i siekiere. [wiz_dead_opcje]
		Podnosisz z ziemi rozdzke i siekiere i bierzesz je ze soba.
		[mam_siekiere := 1, mam_rozdzke := 1]
	[#] Zaatakowac smoka. [drag_attack]
	[#] Opuscic komnate. [^W.TH ^W.TTD][wiz_leave]

[##][wiz_drag_talk1]
	[->][wiz_drag_talk1_oblowiles = 0][wiz_drag_talk1_oblowiles][wiz_drag_talk1_oblowiles := 1]

	[->][wiz_drag_talk1_na_restora = 0, wiz_drag_talk1_oblowiles = 1]
		[wiz_drag_talk1_na_restora][wiz_drag_talk1_na_restora := 1]

	[->][wiz_drag_talk1_wrota = 0, znam_zlote_wrota = 1]
		[wiz_drag_talk1_wrota][wiz_drag_talk1_wrota := 1]

	[->][wiz_drag_talk1_ishara = 0, mam_zloty_klucz = 1]
		[wiz_drag_talk1_ishara][wiz_drag_talk1_ishara := 1]

	[->][wiz_drag_talk1_goldkey = 0, gold_key_nie_dziala = 1]
		[wiz_drag_talk1_goldkey]

	[->][wiz_drag_talk1_haslo = 0, gold_key_nie_dziala = 1]
		[wiz_drag_talk1_goldkey]

	[->][goldkey_namyslam_sie = 1][goldkey_namyslam_sie]

	[->][wiz_drag_talk1_owca = 0, has_silver_key = 1]
		[wiz_drag_talk1_owca][wiz_drag_talk1_owca := 1]

	[->][wiz_drag_talk1_spadaj]

[##][wiz_drag_talk1_spadaj]
	-Smoku? /
	-Spadaj.
	[->][wiz_dead_opcje_bez_gadania]

[##][wiz_drag_talk1_owca]
	-Smoku, mam do ciebie jeszcze jedna sprawe. /
	-Juz i tak za duzo ci pomoglem. Nie bede z toba rozmawiac, chyba ze... /
	-Chyba, ze co? /
	-Chyba, ze przyniesiesz mi owieczke. /
	Smok zaczyna czyscic paznokcie.
	[->][wiz_dead_opcje_bez_gadania]

[##][goldkey_namyslam_sie]
	-Smoku, namyslilem sie. / -Wiec robimy interes?
	[?] CO POWIESZ:
	[#] "Dobra." [wiz_drag_talk1_goldkey_zamien_dobra]
	[#] "Nic z tego." [wiz_drag_talk1_goldkey_rezygnuje]

[##][wiz_drag_talk1_goldkey]
	-Smoku, wrucilem. / -Czego tu znowu szukasz?
	[?] CO POWIESZ:
	[#] "Niczego." [wiz_dead_opcje_bez_gadania] -Niczego. / -To zabieraj sie stad. [wiz_drag_talk1_goldkey := 0]
	[#] "Musisz mi pomoc." [wiz_drag_talk1_pomoc]

[##][wiz_drag_talk1_pomoc]
	-Musisz mi pomoc. / -Dobra. O co chodzi?
	[->][wiz_drag_talk1_haslo = 0][wiz_drag_talk1_haslo][wiz_drag_talk1_haslo := 1]
	[->][wiz_drag_talk1_goldkey_zamien][wiz_drag_talk1_goldkey := 1]

[##][wiz_drag_talk1_goldkey_zamien]
	/ -O zloty klucz. / -Masz zloty klucz? / -Mam, i co? / -Sluchaj, moze chcesz sie wymienic?
	Ty dasz mi zloty klucz, a ja dam ci srebrny klucz?
	[?] CO POWIESZ:
	[#] "Dobra." [wiz_drag_talk1_goldkey_zamien_dobra]
	[#] "Nic z tego." [wiz_drag_talk1_goldkey_rezygnuje]

[##][wiz_drag_talk1_goldkey_zamien_dobra]
	-Dobra.
	[?] OPCJE:
	[#] Dac smokowi zloty klucz. [wiz_drag_talk1_goldkey_zamiana][goldkey_namyslam_sie := 0]
	[#] Zrezygnowac. [wiz_drag_talk1_goldkey_rezygnuje]

[##][wiz_drag_talk1_goldkey_zamiana]
	Wyjmujesz z kieszeni zloty klucz i dajesz go Smokowi. Smok bierze zloty klucz i daje ci srebrny,
	po czym chowa swoja zdobycz. Ty tez chowasz swoj klucz.
	[->][wiz_dead_opcje_bez_gadania][has_silver_key := 1, mam_zloty_klucz := 0]

[##][wiz_drag_talk1_goldkey_rezygnuje]
	-Nic z tego. / -Trudno. Wroc jak sie namyslisz.
	[->][wiz_dead_opcje_bez_gadania][goldkey_namyslam_sie := 1]

[##][wiz_drag_talk1_haslo]
	/ -O dziwny napis w pewnej komnacie. / -Chodzi ci o haslo. / -Haslo? /
	-Zli ludzie wymyslili haslo, zebysmy nigdy nie mogli opuscic podziemi. /
	-Rozumiem.
	[->][wiz_dead_opcje_bez_gadania]

[##][wiz_drag_talk1_ishara]
	-Hej Smoku, to znowu ja. / -Czego chcesz?
	[?] CO POWIESZ:
	[#] "Niczego." [wiz_dead_opcje_bez_gadania] -Niczego. / -To zabieraj sie stad.
		[wiz_drag_talk1_ishara := 0]
	[#] "Widzialem twoja dziewczyne." [wiz_drag_talk1_ishara_widzialem]

[##][wiz_drag_talk1_ishara_widzialem]
	-Widzialem twoja dziewczyne. / -Widziales te zmore? Nastepnym razem gdy ja spotkasz, potraktuj
	ja mieczem. / Smok wsciekly zaczyna kopac w ziemi.
	[->][wiz_dead_opcje_bez_gadania]

[##][wiz_drag_talk1_wrota]
	-Hej, Smoku, jak ci leci? /
	-Powolutku, a u ciebie?
	[?] CO POWIESZ:
	[#] "W pozadalu." [wiz_dead_opcje_bez_gadania]
		-W pozadalu. / -To dobrze. No to czesc. / -Czesc.
		[wiz_drag_talk1_wrota := 0]
	[#] "Mam maly problem." [wiz_drag_talk1_wrota_problem]

[##][wiz_drag_talk1_wrota_problem]
	-Mam maly problem. / -Kazdy z nas ma maly problem. / -No i co z tego? / -Nic. O co chodzi?
	[?] CO POWIESZ:
	[#] "O moja noge." [wiz_dead_opcje_bez_gadania]
		-O moja noge. / -A konkretnie? / -Boli mnie. / -Mnie tez. / Smok przestaje zwarcac na ciebie uwage.
		[wiz_drag_talk1_wrota := 0]
	[#] "O zlote wrota." [wiz_drag_talk1_wrota_wrota]

[##][wiz_drag_talk1_wrota_wrota]
	-O zlote wrota. / -Znalazles zlote wrota? / -No i co z tego? /
	-Ja ich nigdy nie moglem znalezc. / -A ja niestety nie moge zobaczyc co jest za nimi. /
	-Dlaczego? / -Bo sa zamkniete. / -To je otworz. / -Nie mam klucza. /
	-Taaak... zloty klucz. / -Wiesz gdzie moge go zanlezc? /
	-Ishara zbierala rozne cenne przedmioty.
	[?] CO POWIESZ:
	[#] "Kim jest Ishara?" [wiz_drag_talk1_kim_jest_ishara]
	[#] "Gdzie ona teraz jest?" [wiz_drag_talk1_gdzie_jest_ishara]

[##][wiz_drag_talk1_kim_jest_ishara]
	-Kim jest Ishara? / -Nie znasz Ishary? / -Nie. /
	-Coz, tak naprawde to nikt jej nie zna. Byla kiedys moja dziewczyna.
	[?] CO POWIESZ:
	[#] "I co sie z nia stalo?" [wiz_drag_talk1_co_sie_stalo_ishara]
	[#] "Gdzie teraz jest?" [wiz_drag_talk1_gdzie_jest_ishara]

[##][wiz_drag_talk1_gdzie_jest_ishara]
	-A Gdzie teraz jest? / -Nie wiem. Pewnie w podziemiach. / -Dzieki, bardzo mi pomogles. / -Spoko.
	[->][wiz_dead_opcje_bez_gadania][knows_ishara := 1]

[##][wiz_drag_talk1_co_sie_stalo_ishara]
	-I co sie z nia stalo? / -Rzucila mnie dla Czarownika. / -Dla tego Czarownika? /
	-Tak, dla tego smiecia. Zasluzyla sobie na to, co ja spotkalo. / -Co sie jej stalo? /
	Smok nie odpowiada ci.
	[->][wiz_dead_opcje_bez_gadania][knows_ishara := 1]


[##][wiz_drag_talk1_na_restora]
	-Smoku, gdzies w podziemiach znajduje sie Restor. On tez moze miec pieniadze. /
	-Nie interesuje mnie to. Mam ich wystarczajaco duzo. /
	-Tak mialbys wiecej. Moglbys wiecej kupic. /
	-Kupic? Jedynym handlarzem w podziemiach byl czarownik, ale teraz, kiedy nie zyje... /
	Smok zamysla sie.
	[->][wiz_dead_opcje_bez_gadania]

[##][wiz_drag_talk1_oblowiles]
	-Niezle sie oblowiles, Smoku. /
	-Owszem, tez sie ciesze. /
	-Ale jak zamierzasz przeniesc te gory skarbow do siebie? /
	-Nie zamierzam ich przenosic. Zostane tutaj. Spodobala mi sie ta komnata.
	[->][mam_siekiere = 0, mam_rozdzke = 0, zabiore_rozdzke_i_siekiere = 0][wiz_drag_talk1_zabiore]
		[zabiore_rozdzke_i_siekiere := 1]
	[->][wiz_dead_opcje_bez_gadania]

[##][wiz_drag_talk1_zabiore]
	/ -Zabiore te przedmioty, zeby ci nie przeszkadzaly.
	/ -Bardzo dobrze.
	[->][wiz_dead_opcje_bez_gadania]

[##][wiz_vs_drag]
	Za toba wlatuje smok. Czarownik zrywa sie na rowne nogi. /
	Czarownik: -Co jest?! /
	Smok: -Z drogi! Zalatwie tego gnoja. /
	Czarownik: -Co? Wynocha! Srac ci sie znowu zachcialo? /
	Smok: -Stul pysk bo i ciebie sfajcze! /
	Czarownik: -Doigrales sie. - Czarownik zamachuje rozdzka, cos krzyczy i ciska zielonym plomieniem w smoka.
	Smok pada na ziemi. Spod pazuchy wypada mu srebrny kluczyk. Czarownik bierze kluczyk i chowa do kieszeni.
	[->][wiz_opcje][drag_dead := 1, drag2_w_furii := 0]

[##][wiz_oszukal]
	Po srodku komnaty stoi czarownik w szarym plaszczu i kapeluszu. w reku trzyma magiczna rozdzke.
	Za czarownikiem leza trzy zlote i trzy srebrne, oraz siekiera. /
	-To znowu ty frajerze. He, he, ale cie zalatwilem.
	[?] OPCJE:
	[#] Zagadac do czarownika. [wiz_koniec] -Czarownik? / -Co? / -Oddaj mi pieniadze. / -Ani mysle.
	[#] Zaatakowac czarownika. [wiz_attack]
	[#] Siegnac po przedmioty. [wiz_reach]
	[#] [drag_dead = 1] Zapytac o wyjscie. [wiz_jak_wyjsc]
	[#] [drag_dead = 0] Opuscic komnate. [^W.TH ^W.TTD][wiz_leave]

[##][wiz_new]
	W grocie stoi Czarownik. Jego twarz ukryta jest pod wielkim szarym kapeluszem. Dluga, siwa broda opada mu
	na plaszcz. Czarownik trzyma w reku magiczna rozdzke. Za Czarownikiem  leza trzy srebrne i siekiera.
	Czarownik spoglada na ciebie.
	[->][wiz_opcje]

[##][wiz_opcje]
	[?] OPCJE:
	[#] Zagadac do Czarownika. [wiz_talk1] -Czarowniku. / -Co?
	[#] Zaatakowac Czarownika. [wiz_attack]
	[#] Siegnac po przedmioty. [wiz_reach]
	[#] [drag_dead = 0] Opuscic komnate. [^W.TH ^W.TTD][wiz_leave]

[##][wiz_reach]
	Robisz krok w kierunku pieniedzy i siekiery, lecz Czarownik staje ci na drodze. /
	-Zostaw te pieniadze, jesli chcesz zyc.
	[?] OPCJE:
	[#] Zaatakowac Czarownika. [wiz_attack]
	[#] [wiz_oszukal = 0] Zagadac do Czarownika. [wiz_talk1] -Czarowniku. / -Co?
	[#] [wiz_oszukal = 1] Zagadac do Czarownika. [wiz_koniec] -Czarownik? / -Co? / -Oddaj mi pieniadze. / -Ani mysle.
	[#] [drag_dead = 1, wiz_oszukal = 1] Zapytac o wyjscie. [wiz_jak_wyjsc]
	[#] [drag_dead = 0] Opuscic komnate. [^W.TH ^W.TTD][wiz_leave]

[##][wiz_leave]
	Opuszczasz komnate wyjsciem w zachodniej scianie. Idziesz waskim korytarzem,
	az dochodzisz do skrzyzowania w ksztalcie litery T.
	[->][T2]

[##][wiz_talk1]
	[?] CO POWIESZ:
	[#] [wiz_tk_gwiazdy = 0] "Czy widac stad gwiazdy?" [wiz_talk1]
		-Czy widac stad gwiazdy? / -Gwiazdy? Zdurniales? Przeciez to podziemia.
		[wiz_tk_gwiazdy := 1, wiz_tk_nic := 1]
	[#] [wiz_tk_daj_gold = 0] "Daj mi swoje zloto." [wiz_talk1] -Daj mi swoje zloto. / -Ani mysle smieciu.
		[wiz_tk_daj_gold := 1]
	[#] "Daj mi siekiere." [wiz_talk1_daj_siekiere]
	[#] "Zabieraj sie stad." [wiz_talk1_zabieraj_sie][wiz_angry := 1]
	[#] [wiz_tk_wladca = 0] "Znasz wladce podziemi?" [wiz_talk1]
		-Znasz Wladce Podziemi? / -Jasne. To Smok jest Wladca.
		[wiz_tk_wladca := 1, wiz_tk_nic := 1]
	[#] [wiz_tk_kupa = 0] "Co tu tak smierdzi?" [wiz_talk1_co_smierdzi][wiz_tk_kupa := 1, wiz_tk_nic := 1]
	[#] [wiz_tk_bylo_o_smoku = 0, drag_czycha = 1] "Smok nastaje na moje zycie." [wiz_talk1]
		-Smok nastaje na moje zycie. / -I co z tego. / -Troche sie boje. / -Przytulic cie? /
		-Moze moglbys smoka poglaskac swoja rozdzka. / -Smok to nie moj problem, dopoki nie nastaje na moje zycie.
		[wiz_tk_bylo_o_smoku := 1]
	[#] [drag_dead = 1] "I jak my teraz stad wyjdziemy?" [wiz_jak_wyjsc]
	[#] [wiz_tk_nic = 0] "Nic. Juz nic." [wiz_niepogada] -Nic. Juz nic. / -To mnie nie wolaj smieciu.
		[wiz_tk_nic := 0]

[##][wiz_talk1_co_smierdzi]
	-Co tu tak smierdzi? / -Kupa. / -Twoja? /
	-Wszystkich. Wszyscy tu przychodza z podziemi i robia kupe w mojej grocie. Nie wiem, kto tu nasral pierwszy, ale jak
	inni zobaczyli, ze tu sie sra, to teraz sie tu zlaza. Teraz i ja tu robie kupe, bo to juz bez znaczenia.
	[->][wiz_talk1]

[##][wiz_talk1_daj_siekiere]
	-Daj mi siekiere./ -Nie. Moge ci ja najwyzej sprzedac. / -Za ile? / -Za trzy zlote. / -Dobra.
	[->][wiz_interes]

[##][wiz_jak_wyjsc]
	-I jak my teraz stad wyjdziemy? / -Trzeba poszukac innego wyjscia. /
	Czarownik rozglada sie po jaskinii. /
	-O prosze jest wyjscie. - Czarownik bierze swoje pieniadze i laduje sie do malej dziury,
	ktora znalazl w scianie. /
	-Bierz siekiere i chodz za mna. - mowi i znika w dziurze.
	[?] OPCJE:
	[#] Wziac siekiere. [wiz_wyjsc_tunelem] Nie namyslajac sie dlugo zabierasz siekiere
		i wciskasz sie do dziury za czarownikiem.
		[mam_siekiere := 1]
	[#] Pojsc za czarownikiem [wiz_wyjsc_tunelem] Gramolisz sie do dziury za czarownikiem.

[##][wiz_isc_ze_czarownikiem]
	[->][wiz_wyjsc_tunelem]
		[czar_jest_u_restora := 1, wiem_o_zabitym_smoku := 1, znam_tunel := 1, szedlem_za_czarem := 1]

[##][wiz_wyjsc_tunelem]
	Jest strasznie ciasno. Pelzniesz waskim tunelem do przodu, w lewo, w prawo, jakies skrety, nic nie widac.
	W koncu tunel sie konczy i mozesz wyjsc do jakiegos pomieszczenia. Zaraz, chyba juz tu byles.
	[->][^W ^W ^W ^W ^W ^W ^W ^W ^N.TCV][restor]

[##][wiz_interes]
	[->][mam_3_zlote = 1][wiz_has_3_gold]
	[->][wiz_has_no_gold]

[##][wiz_has_no_gold]
	[?] OPCJE:
	[#] [drag_dead = 0] Isc poszukac pieniedzy. [^W.TH ^W.TTD][wiz_leave]
	[#] [drag_dead = 1] Zapytac o wyjscie. [wiz_jak_wyjsc]
	[#] Zaatakowac czarownika. [wiz_attack]

[##][wiz_has_3_gold]
	[?] OPCJE:
	[#] Zaplacic czarownikowi. [wiz_kupuje] [mam_3_zlote := 0, wiz_oszukal := 1]
	[#] Zrezygnowac. [wiz_koniec] -Albo nie, nie kupuje jej. / -Nie, to nie.

[##][wiz_kupuje]
	Dajesz Czarownikowi trzy zlote. Czarownik bierze je i... Nie daje ci nic w zamian. Rzuca swoja zdobycz obok
	pozostalych monet i siekiery i chichocze z zadowolenia. /
	-Ale cie wrobilem, prostaku.
	[?] CO POWIESZ:
	[#] "No, swietny numer." [wiz_koniec] -No, swietny numer. / -Dzieki.
	[#] "Ty zlodzieju, oddawaj pienindze." [wiz_koniec] -Ty zlodzieju, oddawaj pieniadze! /
		-Wynocha stad, ty nedzny paralusie!! / -Oddawaj forse!! / -WON !!!
	[#] "Jeszcze sie okaze, kto kogo wrobil." [wiz_koniec] -Jeszcze sie okaze, kto kogo wrobil. / -Ale nie teraz. Sio!

[##][wiz_koniec]
	[?] OPCJE:
	[#] Zaatakowac czarownika [wiz_attack]
	[#] [drag_dead = 0] Opuscic komnate. [^W.TH ^W.TTD][wiz_leave]
	[#] [drag_dead = 1] Zapytac o wyjscie. [wiz_jak_wyjsc]

[##][wiz_talk1_zabieraj_sie]
	-Zabieraj sie stad. / -Sam sie stad zabieraj! /
	Czarownik zdenerwowany podnosi rozdzke i zaczyna wypowiadac jakies zaklecie.
	[->][wiz_attacks]

[##][wiz_attacks]
	[?] OPCJE:
	[#] Zaatakowac Czarownika. [wiz_attack]
	[#] Uciec z komnaty. [^W.TH ^W.TTD][T2] Szybko zrywasz sie i uciekasz z komnaty.
		Biegnac waskim korytarzem docierasz do skrzyzownaia w ksztalcie litery T.

[##][wiz_niepogada]
	[?] OPCJE:
	[#] Zaatakowac Czarownika. [wiz_attack]
	[#] Siegnac po przedmioty. [wiz_reach]
	[#] Opuscic komnate. [^W.TH ^W.TTD][wiz_leave]

[##][wiz_attack]
	[?] CZYM:
	[#] Piescia. [wiz_kills]
	[#] [mam_miecz = 1] Mieczem. [wiz_kills]
	[#] [mam_siekiere = 1] Siekiera. [wiz_kills]

[##][wiz_kills]
	Zamierzasz sie na czarownika, lecz on uprzedza cie. Podnosi swa rozdzke, ktora blyska zielonym plomieniem.
	Jest to ostatnia rzecz, jaka widzisz... / Rozplywasz sie w nicosc.
	[+]


[//]------------------------------------  META-PALAD  ---------------------------------------------------

[##][metapalad]
	[->][czar_idzie_do_tronu = 1][metapalad_czar_idzie]
	[->][drag2_w_furii = 1][metapalad_smok_goni]
	[->][metapalad_default]

[##][metapalad_smok_goni]
	Smok za toba wbiega po schodach. Jest wsciekly.
	[?] OPCJE:
	[#] Uciekac dalej na wschod. [^E.TH ^E.TTL][metapalad_drag_flee]
	[#] Uciekac na poludnie. [^S.THU][barykada] Skrecasz na poludnie i biegniesz, az do malej komnaty.
	[#] Podjac walke ze smokiem. [drag_attack]

[##][metapalad_drag_flee]
	Lecisz dalej na wschod. Smok zieje ogniem. Jestes szybszy ale czujesz piekacy ogien naplecach.
	Dobiegasz do skrzyzowania w ksztalcie litery T.
	[->][palad]

[##][metapalad_czar_idzie]
	Czarownik rusza dalej na poludnie.
	[?] OPCJE:
	[#] Isc na poludnie, za czarownikiem. [^S.THU][metapalad_go_south]
	[#] Isc na wschod. [^E.TH][metapalad_na_wschod]
		[czar_idzie_do_tronu := 0, czar_u_tronu := 1]
	[#] Isc na zachod [^W.TH ^W.TCV][drag2] Idziesz na zachod. Korytarz biegnie schodami w dol. Schodzac nimi
		dochodzisz do niewielkiej jaskini.
		[czar_idzie_do_tronu := 0, czar_u_tronu := 1]


[##][metapalad_default]
	Drogi skrzyzowania rozchodza sie na wschod, zachod i poludnie.
	[?] OPCJE:
	[#] Isc na wschod. [^E.TH][metapalad_na_wschod]
	[#] Isc na zachod [^W.TH ^W.TCV][drag2] Idziesz na zachod. Korytarz biegnie schodami w dol. Schodzac nimi
		dochodzisz do niewielkiej jaskini.
	[#] Isc na poludnie. [^S.THU][metapalad_go_south]

[##][metapalad_na_wschod]
	Ruszasz korytarzem na wschod. Wkrotce docierasz do skrzyzowania w ksztalcie litery T.
	[->][palad_martwy_u_siebie = 0, palad_martwy_na_schodach = 0][metapalad_palad_blokuje]
	[->][metapalad_na_wschod_bez_przeszkod]

[##][metapalad_na_wschod_bez_przeszkod]
	[->][^E.TTL][palad]

[##][metapalad_palad_blokuje]
	Niestety wejscia na skrzyzowanie blokuje paladyn.
	[?] OPCJE:
	[#] Zagadac do paladyna. [metapalad_tk2]
	[#] Zaatakowac paladyna. [palad_melee_attack]
	[#] Wrocic do skrzyzowania. [^W.TTD][metapalad] Wracasz do skrzyzowanaia w ksztalcie litery T.

[##][metapalad_tk2]
	[?] CO POWIESZ:
	[#] [palad_wyjasnil_sztuczke = 0] "Paladyn, daj mi przejsc." [metapalad_tk2_pusc]
	[#] [palad_wyjasnil_sztuczke = 1] "Jastes zlodziejem!" [metapalad_tk2_zlodziejem]
	[#] [palad_bylo_o_zbroii = 0] "Paladyn, skad masz te zbroje?" [metapalad_tk2_zbroja]
		[palad_bylo_o_zbroii := 1]
	[#] "Na razie." [metapalad_wrocic] -Na razie. / Paladyn wzrusza ramionami.

[##][metapalad_tk2_pusc]
	-Paladyn, daj mi przejsc. / -Nie ma mowy. / -Przeciez ci zaplacilem. /
	-Zaplaciles za przejscie w te strone. Za przejscie spowrotem trzeba rozliczyc sie osobno.
	[->][metapalad_tk2][palad_wyjasnil_sztuczke := 1]

[##][metapalad_tk2_zlodziejem]
	-Jastes zlodziejem! / -Co? Ty gnoju. Zaplacisz za to klamstwo. / Paladyn rusza na ciebie wyciagajac miecz.
	[?] OPCJE:
	[#] Bronic sie. [palad_melee_attack]
	[#] Uciekac. [^W.TTD][metapalad_palad_goni] Rzucasz sie do ucieczki. Paladyn rusza za toba kustykajac w
		swojej zlotej zbroi. Dobiegasz do skrzyzowania w ksztalcie litery T. Paladyn sie zbliza.
		[palad_goni := 1]

[##][metapalad_palad_goni]
	[?] OPCJE:
	[#] Uciekac na zachod. [^W.TH ^W.TCV][metapalad_uciekac_po_schodach]
	[#] Uciekac na poludnie. [^S.THU][barykada] Biegniesz na poludnie, az docierasz do malej komnaty.
	[#] Bronic sie. [palad_melee_attack]

[##][metapalad_uciekac_po_schodach]
	Biegniesz na poludnie. Schodami na dol. Paladyn za toba. Ale w zbroi po schodach ciezko.
	Paladyn przewraca sie, koziolkuje i laduje na dole, kolo twoich stop. Nie rusza sie, i jakos tak krzywo lezy.
	Chyba sie zabil.
	[->][drag2_martwy_palad_opcje][palad_goni := 0, palad_martwy_na_schodach := 1]

[##][metapalad_wrocic]
	Wracasz do skrzyzowanaia w ksztalcie litery T.
	[->][^W.TTD][metapalad]

[##][metapalad_tk2_zbroja]
	-Paladyn, skad masz te zbroje? / -Nie sluchaj czarownika. To kalmca! /
	-Czarownik nic mi nie mowil o zbroii. / -Nie? Niewazne. Zapomnij o zbroii.
	[->][metapalad_tk2]

[##][metapalad_go_south]
	[->][czar_idzie_do_tronu = 1][metapalad_gobl_dead_czar_idzie]
	[->][has_silver_key = 1, goblin_dead = 0][^N.TTD][metapalad_goblin]
	[->][goblin_dead = 1][metapalad_gobl_dead]
	[->][metapalad_go_nic]

[##][metapalad_gobl_dead_czar_idzie]
	Ruszasz za czarownikiem korytarzem na poludnie. Po drodze mijacie zwloki goblina.
	W koncu dochodzicie do malej komnaty.
	[->][barykada]

[##][metapalad_gobl_dead]
	Ruszasz korytarzem na poludnie. Po drodze mijasz zwloki goblina.
	W koncu dochodzisz do malej komnaty.
	[->][barykada]

[##][metapalad_go_nic]
	Idziesz korytarzem na poludnie, az docierasz do malej komnaty.
	[->][barykada]

[##][metapalad_goblin]
	Idziesz korytarzem na poludnie, gdy nagle na twej drodze staje goblin z nozem. Goblin atakuje cie.
	[?] OPCJE:
	[#] Bronic sie. [metapalad_goblin_bronic]
	[#] Uciekac. [metapalad] Blyskawicznie rzucasz sie do ucieczki. Biegnac na polnoc docierasz do skrzyzowania
		w ksztalcie litery T.

[##][metapalad_goblin_bronic]
	[?] CZYM:
	[#] [mam_miecz = 1] Mieczem. [metapalad_goblin_sword_attack][goblin_dead := 1]
	[#] Rekoma. [metapalad_goblin_melee]

[##][metapalad_goblin_sword_attack]
	Goblin zamachuje sie nozem, lecz ty jednym machnieciem miecza kruszysz mu sztylet. Goblin bez broni rzuca
	sie na ciebie. Ty robisz zamch i zadajesz mu smiertelny cios. Goblin pada martwy na ziemie.
	[?] OPCJE:
	[#] Isc dalej na poludnie. [^S.THU][metapalad_go_nic]
	[#] Wrocic do skrzyzowania. [^N ^S.TTD][barykada_na_polnoc]

[##][metapalad_goblin_melee]
	Goblin zamachuje sie nozem. Zaslaniasz sie rekoma, lecz goblin zadaje drugi cios, przeszywajac ci brzuch.
	Konasz powoli.
	[+]


[//]------------------------------  DRAGON 2  ----------------------------------------------------------

[##][drag2]
	[->][palad_martwy_na_schodach = 1][drag2_martwy_palad]
	[->][drag_dead = 1][drag2_empty]
	[->][drag_killed_wiz = 1][drag2_empty]
	[->][drag2_wsciekly = 1][drag2_wsciekly]
	[->][drag2_talk1]

[##][drag2_martwy_palad]
	Na ziemi lezy cialo martwego paladyna.
	[->][drag2_martwy_palad_opcje]

[##][drag2_martwy_palad_opcje]
	[?] OPCJE:
	[#] [palad_ma_3_srebrne = 1] Ograbic paladyna. [drag2_martwy_palad_ograbic]
	[#] Wrocic do skrzyzowania. [^E.TH ^E.TTD][metapalad] Wracasz do skrzyzowania.

[##][drag2_martwy_palad_ograbic]
	Zabierasz paladynowi wszystko co sie da. Bierzesz miecz, jego zloty pierscien i trzy srebrne,
	po czym wracasz do skrzyzowania.
	[->][^E.TH ^E.TTD][metapalad]
		[mam_pierscien_paladyna := 1, mam_3_srebrne := 1, palad_ma_3_srebrne := 0, mam_miecz := 1]

[##][drag2_wsciekly]
	Po srodku komnaty siedzi smok i drapie sie po rzuchu. Jak tylko cie spostrzega oczy naplywaja mu krwia. /
	-Nawet mi sie niepokazuj na oczy ty gadzie.
	[?] CO POWIESZ:
	[#] "Sam jestes gadem." [drag2_wkurzam_dalej] -Sam jestes gadem. /
	[#] [znam_czarownika = 1] "Spokojnie, wiem cos, co cie zaciekawi." [drag2_talk1_wiz_zabral]
		-Spokojnie, wiem cos, co cie zaciekawi. /
		-Niby co? / -To czarownik zabral zloto paladyna.
	[#] "No, juz ci sie pokazalem. I co?" [drag2_wkurzam_dalej] -No, juz ci sie pokazalem. I co? /

[##][drag2_wkurzam_dalej]
	-No nie! Przeciez ja cie... ty... / Smok kipi z wscieklosci. Zrywa sie z miejsca i wciaga nosem powietrze.
	[->][drag2_atakuje][drag2_w_furii := 1]

[##][drag2_talk1]
	Po srodku komnaty siedzi Smok i trze sobie oczy. Po chwili spostrzega twoja obecnosc. /
	-Paladyn nie mial tych pieniedzy.
	[?] CO POWIESZ:
	[#] "Wiem, ale cie nabralem." [drag2_talk1_nabralem]
	[#] [znam_czarownika = 1] "Wiem, to Czarownik je zabral." [drag2_talk1_wiz_zabral]
		-Wiem, to Czarownik je zabral. /
	[#] [znam_czarownika = 0] "To dziwne. Ktos musial je zabrac." [drag2_tk1_nie_wiem_kto_zabral]

[##][drag2_tk1_nie_wiem_kto_zabral]
	-To dziwne. Ktos musial je zabrac. / -Ktos musial je zabrac? / -Tak, zabrac. /
	-A moze to ty? / -Nie, chyba bym pamietal. /
	-Zaraz sie przekonamy! /
	Smok rusza na ciebie.
	[->][drag2_zdenerwowany]

[##][drag2_talk1_wiz_zabral]
	-Pewnie masz racje. Pojde to sprawdzic. /
	Smok wychodzi z jaskini. / -Aaa, i jeszcze jedno - mowi smok na odchodnym. / -Co? /
	-Restor cie szukal. / Smok znika.
	[->][drag2][drag_killed_wiz := 1, wiz_dead := 1]

[##][drag2_talk1_nabralem]
	-Wiem, ale cie nabralem. / -Grrry! Ty chamie! Zabije cie! /
	Smok rusza na cibie, toczac piane z pyska i zamierzjac sie na ciebie swoja wielka lapa.
	[->][drag2_zdenerwowany]

[##][drag2_zdenerwowany]
	[?] OPCJE:
	[#] Zaatakowac smoka. [drag_attack]
	[#] Uciekac. [^E.TH ^E.TTD][drag2_flee][drag2_wsciekly := 1]
	[#] Zagadac do smoka. [drag2_atakuje]
		-Zaczekaj. Mozemy przciez porozmawiac. / -NIE! / Smok zbliza sie. [drag2_wsciekly := 1]

[##][drag2_atakuje]
	[?] OPCJE:
	[#] Zaatakowac smoka. [drag_attack]
	[#] Uciekac. [^E.TH ^E.TTD][drag2_flee]

[##][drag2_flee]
	Blyskawicznie rzucasz sie do ucieczki. Wybiegasz z komnaty, pedzisz po schodach na gore.
	Potykasz sie. Wstajesz. W koncu dobiegasz do skrzyzowania w ksztalcie litery T.
	[->][metapalad]

[##][drag2_empty]
	Jaskinia jest pusta. Nikogo w niej nie ma. Wracasz do skrzyzowania.
	[->][^E.TH ^E.TTD][metapalad]


[//]-------------------------------------- BARYKADA ---------------------------------------------------

[##][barykada]
	[->][czar_idzie_do_tronu = 1][barykada_czar_idzie]
	[->][palad_goni = 1][barykada_palad_goni]
	[->][drag2_w_furii = 1, mam_siekiere = 0][barykada_drag_goni]
	[->][znam_zaslone = 1][barykada_widzi_zaslone]
	[->][bez_zaslony = 1][barykada_bez_zaslony]
	[->][drag2_w_furii = 0][barykada_main]
	[->][FAIL]

[##][barykada_bez_zaslony]
	W komnacie jest bardzo ciemno. Po drugiej stronie widzisz kamienna tablice z napisem. W zachodniej
	scianie jest teraz drugie wyjscie z komnaty.
	[->][barykada_opcje]

[##][barykada_czar_idzie]
	W komnacie jest bardzo ciemno. Po drugiej stronie widzisz kamienna tablice z napisem. W zachodniej
	scianie jest teraz drugie wyjscie z komnaty. Czarownik kieruje sie w tamta strone.
	[?] OPCJE:
	[#] Odczytac napis z tablicy. [barykada_napis][znam_napis_z_barykady := 1]
	[#] Isc za czarownikiem na zachod. [^W.TH ^W ^W.TH ^W.TCV][tron]
		Przeciskacie sie z czarownikiem przez pozostalosc po barykadzie i idziecie waskim korytarzem.
		Mijacie zlote wrota. W koncu dochodzicie do wielkiej komnaty.
	[#] Opuscic komnate wyjsciem na polnoc. [^N.TTD][barykada_na_polnoc]
		[czar_idzie_do_tronu := 0, czar_u_tronu := 1]

[##][barykada_widzi_zaslone]
	W komnacie jest bardzo ciemno. Po drugiej stronie widzisz kamienna tablice z napisem.
	W zachodniej scianie jest ustawiona zaslona z desek, jakby chronila cos co jest za nia.
	[->][barykada_opcje]

[##][barykada_main]
	W komnacie jest bardzo bardzo ciemno. Po drugiej stronie widzisz kamienna tablice z jakims napisem.
	[->][barykada_opcje]

[##][barykada_opcje]
	[?] OPCJE:
	[#] Odczytac napis z tablicy. [barykada_napis][znam_napis_z_barykady := 1]
	[#] [znam_zaslone = 0] Rozejzec sie po komnacie. [barykada_opcje] Uwaznie rozgladasz sie po komnacie.
		W zachodniej scianie zauwazasz zaslone z desek. Cos moze za nia byc.
		[znam_zaslone := 1]
	[#] [znam_zaslone = 1, bez_zaslony = 0] Rozwalic barykade. [brykada_rozwalic]
	[#] [bez_zaslony = 0] Opuscic komnate. [^N.TTD][barykada_na_polnoc]
	[#] [bez_zaslony = 1] Opuscic komnate wyjsciem na polnoc. [^N.TTD][barykada_na_polnoc]
	[#] [bez_zaslony = 1] Opuscic komnate wyjsciem na zachod. [^W.TH ^W.#][barykada_na_zachod]

[##][barykada_napis]
	Podchodzisz do tablicy i odczytujesz napis: "á@ä&| Ód@^&v $~äˆ". Nic nie rozumiesz.
	[->][barykada]

[##][barykada_na_zachod]
	Przeciskasz sie przez pozostalosc po barykadzie i idziesz waskim korytarzem.
	[->][golddoor]

[##][brykada_rozwalic]
	[?] CZYM:
	[#] Rekama. [brykada_rozwalic_reka]
	[#] [mam_siekiere = 1] Siekiera. [brykada_rozwalic_siekiera][bez_zaslony := 1]
	[#] [nie_moze_halabarda = 0] Halabarda. [barykada] >> Ciekawe skad masz halabarde? <<
		[nie_moze_halabarda := 1]

[##][brykada_rozwalic_reka]
	Bijesz barykade piesciami, pchasz ja, kopiesz, lecz ona wciaz stoi; nienaruszona. /
	>> Myslisz, ze ktos postawilby tu barykade, gdyby taki prosty czlowiek moglby ja kopnac i przewrocic? <<
	[->][barykada_opcje]

[##][brykada_rozwalic_siekiera]
	Zamachujesz sie siekiera i uderzasz w barykade. Jedna z desek odlamuje sie.
	Uderzasz drugi raz i trzeci. Odpada druga deska. Zaczynasz wylamywac kolejne deski,
	az wkrotce barykady nie ma, a w zachodniej scianie jest waski korytarz.
	[?] OPCJE:
	[#] Pojsc na zachod. [^W.TH ^W.#][barykada_na_zachod]
	[#] Isc na polnoc. [^N.TTD][barykada_na_polnoc]
	[#] Odczytac napis z tablicy. [barykada_napis]

[##][barykada_palad_goni]
	Paladyn wparowuje za toba. Stad nie ma ucieczki. Musisz sie bronic.
	[->][palad_melee_attack]

[##][barykada_na_polnoc]
	Ruszasz korytarzem na polnoc, az docierasz do skrzyzowania w ksztalcie litery T.
	[->][goblin_dead = 1][barykada_mijam_goblina]
	[->][metapalad]

[##][barykada_mijam_goblina]
	Podrodze mijasz zwloki golina.
	[->][metapalad]

[##][barykada_drag_goni]
	Wpadasz do niewielkiej komnaty. Nie ma gdzie uciekac. Odwracasz sie. Smok wpada za toba.
	Musisz sie bronic.
	[->][drag_attack]


[//]--------------------------------------  GOLD DOOR ------------------------------------------------------

[##][golddoor]
	[->][golddoor_open = 1][golddoor_open]
	[->][golddoor_default][znam_zlote_wrota := 1]

[##][golddoor_default]
	Niestety dalsza droge blokuja zlote wrota. Nie mozesz dalej isc.
	[?] OPCJE:
	[#] Otworzyc wrota. [golddoor_otworzyc]
	[#] Wrocic. [^E.TH ^E.THU][golddoor_wrocic]

[##][golddoor_otworzyc]
	[->][has_silver_key = 1][golddoor_silverkey][golddoor_open := 1]
	[->][mam_zloty_klucz = 1][golddoor_goldkey]
	[->][golddoor_nokey]

[##][golddoor_silverkey][^.TH]
	Wkladasz srebrny klucz do zamka i przekrecasz go. Zamek ustepuje, a drzwi sie otwieraja. Teraz mozesz
	isc dalej.
	[?] OPCJE:
	[#] Isc dalej na zachod. [^W.TH ^W.TCV][tron] Idziesz dalej waskim tunelem, az docierasz do wielkiej komnaty.
	[#] Wrocic na wschod. [^E.TH ^E.THU][golddoor_wrocic]

[##][golddoor_goldkey]
	Wkladasz zloty klucz do zamka i probujesz go przekrecic, lecz nie dajesz rady. To nie ten klucz.
	Chowasz go spowrotem do kieszeni.
	[->][^E.TH ^E.THU][golddoor_wrocic][gold_key_nie_dziala := 1]

[##][golddoor_nokey]
	>> Czym? To sa potezne zlote wrota i nie otworzysz ich kijkiem, czy siekierka. Potrzebujesz klucza. << /
	[->][^E.TH ^E.THU][golddoor_wrocic]

[##][golddoor_open][^.TH]
	Po drodze mijasz zlote wrota. Idziesz dalej, az dochodisz do wielkiej komnaty.
	[->][^W.TH ^W.TCV][tron]

[##][golddoor_wrocic]
	Wracasz waskim korytarzem na wschod, az docierasz do niewielkiej komnaty.
	[->][barykada]


[//]-----------------------------------  TRON  -------------------------------------------

[##][tron]
	[->][czar_zamiast_restora = 1, czar_u_restora_wsciekly = 0][tron_czar]
	[->][czar_zamiast_restora = 1, czar_u_restora_wsciekly = 1][tron_czar_wsciekly]
	[->][restor_ma_rozdzke = 1, czar_martwy_u_tronu = 1][tron_restor_ma_rozdzke_czar_martwy]
	[->][czar_idzie_do_tronu = 1][tron_czar_przychodzi]
	[->][czar_u_tronu = 1][tron_czar_juz_jest]
	[->][mam_zwabic_czara = 1][tron_restor_czeka_na_czara]
	[->][retsor_dead = 1][tron_restor_martwy]
	[->][restor_ma_rozdzke = 1, mam_rozdzke = 0, retsor_dead = 0][tron_restor_ma_rozdzke]
	[->][znam_restora = 1, restor_ma_rozdzke = 0][tron_init]
	[->][FAIL]

[##][tron_restor_czeka_na_czara]
	Sciany tej sali ozdobione sa zlotymi ornamentami. W przeciwleglej scianie dostrzegasz dwoje malych
	drzwiczek. Po srodku komnaty stoi wielki zloty tron, a na nim siedzi Restor ze swoja wlocznia.
	Restor spoglada na ciebie. / -No i co, gdzie on jest? / -Jeszcze nad tym pracuje.
	[->][tron_niepogada]

[##][tron_czar]
	Sciany tej sali ozdobione sa zlotymi ornamentami. W przeciwleglej scianie dostrzegasz dwoje malych
	drzwiczek. Po srodku komnaty stoi wielki zloty tron, nieopodal stoi czarownik, a w kacie lezy martwy
	Restor.
	[?] OPCJE:
	[#] Zagadac do czarownika. [tron_czar_niepogada]
		-Hej, czarowniku! / -Nie teraz. / Czarownik nie chce z toba rozmawiac.
	[#] Zaatakowac czarownika. [wiz_attack]
	[#] Opuscic komnate. [^E.TH ^E.TH ^E.TH ^E.THU][tron_wychodze]

[##][tron_czar_wsciekly]
	Sciany tej sali ozdobione sa zlotymi ornamentami. W przeciwleglej scianie dostrzegasz dwoje malych
	drzwiczek. Po srodku komnaty stoi wielki zloty tron, nieopodal stoi czarownik, a w kacie lezy martwy
	Restor. Czarownik po chwili dostrzega cie. / -Wynocha gnoju!
	[->][tron_czar_niepogada]

[##][tron_restor_ma_rozdzke_czar_martwy]
	Sciany tej sali ozdobione sa zlotymi ornamentami. W przeciwleglej scianie dostrzegasz dwoje
	malych drzwiczek. Po srodku komnaty stoi wielki zloty tron, a na nim siedzi Restor.
	W reku trzyma rozdzke. Opodal lezy martwy czarownik, ktoremu zostala ona zabrana.
	[->][tron_restor_ma_rozdzke_opcje]

[##][tron_czar_przychodzi]
	Czarownik pierwszy wchodzi do zlotej sali. / -Gdzie jest czarcie ziele?
	/ Restor podnosi sie z tronu zadowolony. / Restor: -Jestes.
	/ Czarownik: -Ty gnoju. Znowu cos kombinujesz.
	/ Restor: -Dawaj rozdzke!
	/ Czarownik nie namyslajac sie dlugo wyciaga rozdzke, ale bynajmnie nie po to by sie nia podzielic.
	Restor wytraca mu ja przy pomocy wloczni. Czarownik rzuca sie na rozdzke. Restor za nim. Lapia ja obaj.
	Siluja sie. Restor wola do ciebie:
	/ -Zalatw go! / Czarownik: -Co? Tego gnoja zalatw!
	[->][tron_czar_vs_restor_opcje][czar_u_tronu := 0, czar_idzie_do_tronu := 0]

[##][tron_czar_juz_jest]
	W zlotej sali zastajesz restora i czarownika na ziemi. Walcza.
	Obaj sie siloja probojac wyrwac sobie z rak rozdzke. Czarownik wola do ciebie:
	/ -Pomoz mi!
	/ Restor: - Nie! Zalatw go!
	[->][tron_czar_vs_restor_opcje][czar_u_tronu := 0, czar_idzie_do_tronu := 0]

[##][tron_czar_vs_restor_opcje]
	[?] CZAS WYBIERAC:
	[#] Zalatwic czarownika. [tron_zalatwiam_czarownika]
	[#] Zalatwic restora. [tron_zalatwiam_restora]
	[#] Opuscic komnate. [^E.TH ^E.TH ^E.TH ^E.THU][tron_wychodze]
		[restor_ma_rozdzke := 1, czar_martwy_u_tronu := 1]

[##][tron_zalatwiam_restora]
	Chwytasz lezaca nieopodal wlocznie Restora i okladasz go nia w glowe.
	Restor ogluszony wypuszcza rozdzke z reki, czarownik nie namyslajac sie dlugo wymachujerozczka i ciska w
	Restora jakims zielonym swiatlem. Ten padana ziemie. Czarownik wstaje, otrzepujac swoj plaszcz.
	/ -Rozumiem, ze czarciego ziela jednak tu nie dostane.
	[->][tron_zalatwilem_restora_opcje][retsor_dead := 1, czar_zamiast_restora := 1]

[##][tron_zalatwilem_restora_opcje]
	[?] CO POWIESZ:
	[#] "Przepraszam. Bez tego Restor nie zdradzilby mi hasla." [tron_zalatwilem_restora_przepraszam]
	[#] "Genialne. Sam do tego doszedles?" [tron_czar_atakuje]
		-Genialne. Sam do tego doszedles? / -No, teraz przegiales! Czarownik wyciaga rozdzke.
		[czar_u_restora_wsciekly := 1]

[##][tron_zalatwilem_restora_przepraszam]
	-Przepraszam. Bez tego Restor nie zdradzilby mi hasla. / -No tak. Tyle ze chyba dokonales zlego wyboru.
	/ Czarownik zamysla sie.
	[->][tron_czar_niepogada]

[##][tron_czar_atakuje]
	[?] OPCJE:
	[#] bronic sie. [wiz_attack]
	[#] Uciekac. [^E.TH ^E.TH ^E.TH ^E.THU][tron_uciekam]

[##][tron_zalatwiam_czarownika]
	Chwytasz lezaca nieopodal wlocznie Restora i okladasz nia czarownika w glowe. Czarownik oszolomiony
	wypuszcza rozdzke z reki. Restor tylko na to czekal. Wyrywa rozdzke wypowiada jakies inkantacje, blysk, ...
	Czarownik juz nie wstanie. Restor otrzepuje sie i siada na tronie.
	/ -Dzieki za pomoc. / -Zalatwilem ci rozdzke, Restor. Teraz twoja kolej. /
	Restor spoglada sie na ciebie. / -Haslo brzmi "Otwierac".
	[->][tron_niepogada][czar_martwy_u_tronu := 1, restor_ma_rozdzke := 1, znam_haslo := 1]

[##][tron_init]
	Sciany tej sali ozdobione sa zlotymi ornamentami. W przeciwleglej scianie dostrzegasz dwoje malych
	drzwiczek. Po srodku komnaty stoi wielki zloty tron, a na nim siedzi Restor ze swoja wlocznia.
	Restor spoglada na ciebie. /
	-Czego tu chcesz?
	[?] CO ODPOWIESZ:
	[#] "Niczego." [tron_talk1_niczego]
	[#] "Chce ciebie zabic." [tron_talk1_cie_zabic]
	[#] [restor_to_wladca = 0] "Szukam Wladcy Podziemi." [tron_talk1]
		-Szukam Wladcy Podziemi. / -To ja jestem Wladca Podziemi.
		[restor_to_wladca := 1]

[##][tron_restor_ma_rozdzke]
	Sciany tej sali ozdobione sa zlotymi ornamentami. W przeciwleglej scianie dostrzegasz dwoje
	malych drzwiczek. Po srodku komnaty stoi wielki zloty tron, a na nim siedzi Restor.
	W reku trzyma rozdzke.
	[->][tron_restor_ma_rozdzke_opcje]

[##][tron_restor_ma_rozdzke_opcje]
	[?] OPCJE:
	[#] [znam_haslo = 1] Zagadac do Restora. [tron_talk2]
	[#] [znam_haslo = 0] Zagadac do Restora. [tron_prosze_o_haslo]
	[#] Zaatakowac Restora. [tron_atakuje_z_kura]
	[#] Opuscic komnate. [^E.TH ^E.TH ^E.TH ^E.THU][tron_wychodze]

[##][tron_prosze_o_haslo]
	-Restor, dotrzymalem swojej czesci umowy. / -Owszem. Haslo brzmi "Otwierac".
	[->][tron_niepogada][znam_haslo := 1]

[##][tron_restor_martwy]
	Sciany tej sali ozdobione sa zlotymi ornamentami. W przeciwleglej scianie dostrzegasz dwoje
	malych drzwiczek. Po srodku komnaty stoi wielki zloty tron. Na ziemi lezy martwy Restor.
	[?] OPCJE:
	[#] Zajzec do pierwszych drzwiczek. [tron_nicze]
	[#] Zajzec do drugich drzwiczek. [tron_drugie_drzwiczki]
	[#] Opuscic komnate. [^E.TH ^E.TH ^E.TH ^E.THU][tron_wychodze]

[##][tron_drugie_drzwiczki]
	Otwierasz drugie drzwiczki. W srodku w trzech rzedach stoja sloiki z kafitura.
	[?] OPCJE:
	[#] Zabrac sloik z kafitura. [tron] >> Po co ci to? << / Zamykasz drzwiczki.
	[#] Zamknac drzwiczki. [tron] Zamykasz drzwiczki.

[##][tron_nicze]
	[->][nicze_nie_zna_hasla = 0][tron_nicze_gada]
	[->][tron_nicze_nie_gada]

[##][tron_nicze_gada]
	Zagladasz do pierwszych drzwiczek. Za nimi siedzi Nietsche i wcina kafiture.
	[?] OPCJE:
	[#] Zapytac o haslo. [tron]
		-Znasz haslo? / -Gdybym znal haslo, to juz by mnie tu nie bylo. / Nietsche zamyka drzwiczki.
		[nicze_nie_zna_hasla := 1]
	[#] Zamknac drzwiczki. [tron] Zamykasz drzwiczki.

[##][tron_nicze_nie_gada]
	Drzwiczki sa zamkniete.
	[->][tron]

[##][tron_talk2]
	-Restor, mam do ciebie sprawe. / -A odkad to k... jestesmy na ty?! /
	-No, myslalem, ze laczy nas cos wiecej niz... /
	-To zle myslales ty drabiniarzu! Lepiej skoncz z tym nalogiem. /
	-Jak ty mnie nazwales? / -Drabiniarzem. - Mowi Restor i podnosi swoja rozdzke,
	usmiechajac sie przy tym szeroko.
	[?] OPCJE:
	[#] Zaatakowac Restora. [tron_atakuje_z_kura]
	[#] Zwiac. [tron_uciekam]

[##][tron_atakuje_z_kura]
	[?] CZYM:
	[#] [mam_miecz = 1] Mieczem. [tron_nieudany_atak_mieczem]
	[#] [mam_siekiere = 1] Siekiera. [tron_nieudany_atak_mieczem]
	[#] Piescia. [tron_nieudany_atak_wrecz]
	[#] [atak_kura = 0] Kura. [tron_atakuje_z_kura]
		>> Zglupiales? Kura sie nie walczy. Moze za to sluzyc jako but. <<
		[atak_kura := 1]

[##][tron_nieudany_atak_mieczem]
	Zamachujesz sie mieczem na Restora, lecz on podnosi rozdzke ciskajac w ciebie zielonym plomieniem. /
	Padasz zweglony na ziemie.
	[+]

[##][tron_nieudany_atak_wrecz]
	Zamachujesz sie na Restora piesciami, lecz on podnosi rozdzke ciskajac w ciebie zielonym plomieniem. /
	Padasz zweglony na ziemie.
	[+]

[##][tron_talk1_niczego]
	-Niczego. / -Nitsche juz tu nie mieszka, a co od niego chciales? / -Chcialem o cos zapytac. /
	-Zapytaj mnie.
	[->][tron_talk1]

[##][tron_talk1_cie_zabic]
	-Chce ciebie zabic. / -Zabic mnie? Restora? Wiec sprobuj. /
	Restor zrywa sie z tronu i ustawia wlucznie do ataku.
	[?] OPCJE:
	[#] Zaatakowac Restora. [tron_attack]
	[#] Uciec. [^E.TH ^E.TH ^E.TH ^E.THU][tron_uciekam]
	[#] Uspokoic Restora. [tron_uspokajam]

[##][tron_attack]
	[?] CZYM:
	[#] Piesciami. [restor_melee]
	[#] [mam_miecz = 1] Mieczem. [tron_attack_sword]
	[#] [mam_siekiere = 1] Siekiera. [tron_atak_siekiera]

[##][tron_uspokajam]
	-Spokojnie Restor, mozemy najpierw pogadac. /
	-Nie bede z toba rozmawial, szczurze! / Restor atakuje cie.
	[?] OPCJE:
	[#] Bronic sie piesciami. [restor_melee]
	[#] Bronic sie mieczem. [tron_bronie_sie_mieczem]
	[#] Uciekac. [^E.TH ^E.TH ^E.TH ^E.THU][tron_uciekam]

[##][tron_bronie_sie_mieczem]
	Restor zadaje cios wlocznia, lecz ty oslaniasz sie mieczem. Drugim uderzeniem powalasz Restora
	na ziemie. Zamachujesz sie by go dobic... /
	-Nie! Nie zabijaj mnie. Mozemy sie dogadac. Odloz swoj miecz. /
	Restor mowiac to siega reka do buta.
	[?] OPCJE:
	[#] Odlozyc miecz. [tron_nie_dobijam_mieczem]
	[#] Zalatwic Restora. [tron_dobijam_mieczem]

[##][tron_nie_dobijam_mieczem]
	Odkladasz miecz. / -Co masz mi do powiedzenia? / -Wiem czego ci potrzeba. / -A czego? /
	-Chcesz znac haslo do wielkich wrot. / -A ty mozesz mi je podac? /
	-Mozemy sie wymienic. Ja podam ci haslo a ty dasz mi rozdzke. /
	-Nic z tego Restor. Nie pozwole bys przy jej pomocy nekal niewinnych ludzi z wioski. /
	-Niewinnych? To oni sa winni. Zamkneli nas tu jak szczury w klatce i nie pozwalaja nam nawet wyjsc
	na spacer. Nic dziwnego, ze zaczelismy im przeszkadzac. No to jak, robimy interes?
	[->][tron_dam_nie_dam_rozdzki]

[##][tron_dam_nie_dam_rozdzki]
	[?] CO POWIESZ:
	[#] [mam_rozdzke = 1] "Dobra." [tron_dam_rozdzke]
	[#] [mam_rozdzke = 0] "Nie mam rozdzki." [tron_tk_nie_mam_rozdzki]
	[#] "Nic z tego." [tron_nie_dam_rozdzki]
	[#] [tron_restor_sie_wyzalil = 0] "Nie wierze ci." [tron_nie_wierze][tron_restor_sie_wyzalil := 1]

[##][tron_tk_nie_mam_rozdzki]
	-Nie mam rozdzki. / -No to ja zalatw. Jakos. / -Jak zalatw? To jest rozdzka czarownika,
	i przeciez mi jej nie da, a ja mu na sile nie zabiore, bo mnie zbije. /
	-No to zwab go tutaj.
	[->][tron_niepogada][mam_zwabic_czara := 1]

[##][tron_nie_wierze]
	-Nie wierze ci? / -Nie wierzysz? Nie wierzysz, ze jest ciezko w podziemiach? Ze jest ciezko zapewnic
	kafiture do jedzenia wszystkim ich mieszkancom? Ze jest ciezko zorganizowac spanie, sranie, zeby sie
	na wzajem nie pozabijali? / -Dobra, nie rozczulaj sie. / -Prosze tylko o rozdzke.
	[->][tron_dam_nie_dam_rozdzki]

[##][tron_nie_dam_rozdzki]
	-Nic z tego. / -Jezeli nie oddasz rozdzki po dobroci to zabiore ci ja sila. /
	Restor atakuje cie.
	[?] OPCJE:
	[#] Bronic sie. [tron_attack]
	[#] Uciekac. [^E.TH ^E.TH ^E.TH ^E.THU][tron_uciekam]

[##][tron_dam_rozdzke]
	-Dobra. / -Daj mi rozdzke.
	[?] OPCJE:
	[#] Dac rozdzke. [tron_daje_rozdzke][znam_haslo := 1, restor_ma_rozdzke := 1, mam_rozdzke := 0]
	[#] Nie dac rozdzki. [tron_nie_daje_rozdzki]

[##][tron_nie_daje_rozdzki]
	Nie dajesz rozdzki Restorowi. Restor wscieka sie. /
	-Jezeli nie chcesz mi dac rozdzki to wynos sie stad. Wroc tu gdy sie namyslisz.
	[->][tron_niepogada]

[##][tron_czar_niepogada]
	[?] OPCJE:
	[#] Opuscic komnate. [^E.TH ^E.TH ^E.TH ^E.THU][tron_wychodze]
	[#] Zaatakowac czarownika. [wiz_attack]

[##][tron_niepogada]
	[?] OPCJE:
	[#] Opuscic komnate. [^E.TH ^E.TH ^E.TH ^E.THU][tron_wychodze]
	[#] Zaatakowac Restora. [tron_attack]

[##][tron_daje_rozdzke]
	Dajesz rozdzke Restorowi. Restor bierze ja ostroznie. Jest zadowolony. /
	-Dalem ci rozdzke, Restor. Teraz twoja kolej. /
	Restor spoglada sie na ciebie. / -Haslo brzmi "Otwierac".
	[->][tron_niepogada]

[##][tron_dobijam_mieczem]
	Restor wyciaga z buta sztylet, lecz ty szybko zadajesz cios, kruszac zarowno sztylet,
	jak i czaszke Restora. Wladca Podziemi nie zyje. /
	Twoje zadanie zostalo wykonane.
	[->][tron][retsor_dead := 1]

[##][tron_attack_sword]
	Wycicgasz miecz i zamachujesz sie nim na Restora. Restor oslania sie wlocznia. Zadajesz drugi cios.
	Restor wywraca sie i szybko ustawia wlocznie do rzutu. Uprzedzasz go i zadajesz smiertelny cios.
	Restor nie zyje. Twoje zadanie zostalo wykonane.
	[->][tron][retsor_dead := 1]

[##][tron_atak_siekiera]
	Zamachujesz sie siekiera na Restora. Restor oslania sie wlocznia. Zadajesz drugi cios.
	Restor wywraca sie i szybko ustawia wlocznie do rzutu. Uprzedzasz go i zadajesz smiertelny cios.
	Restor nie zyje. Twoje zadanie zostalo wykonane.
	[->][tron][retsor_dead := 1]

[##][tron_talk1]
	[?] CO POWIESZ:
	[#] [tron_bylo_o_smoku = 0] "Znasz Smoka?" [tron_talk1]
		-Znasz Smoka? / -Jasne, ze znam. Mieszka na drugim koncu podziemi.
		[tron_bylo_o_smoku := 1]
	[#] [tron_bylo_o_czarowniku = 0] "Znasz Czarownika?" [tron_talk1]
		-Znasz Czarownika? / -Jasne, ze znam tego starego kapcia. / -Widze, ze nie darzysz go zbyt
		wielkim szacunkiem. / -Naprawde? Jak do tego doszedles? / -Metoda dedukcji. / -Czego? /
		-I tak bys nie zrozumial. / -Nie obrazaj mnie zdechlaku. Jak masz jeszcze jakas sprawe to gadaj,
		albo spadaj.
		[tron_bylo_o_czarowniku := 1]
	[#] [tron_bylo_o_rozdzce = 0, mam_rozdzke = 1] "Do czego sluzy moja rozdzka?" [tron_talk1]
		-Do czego sluzy moja rozdzka? / -Tobie do niczego, ale mnie sie moze przydac. Daj mi ja. /
		-Nic z tego satry.
		[tron_bylo_o_rozdzce := 1]
	[#] [tron_bylo_o_drzwiach = 0]"Co jest za tymi drzwiami z tylu?" [tron_talk1]
		-Co jest za tymi drzwiami z tylu? / -Niczego tam nie ma. / -Nie szukam Nitschego. /
		-I niczego nie znajdziesz.
		[tron_bylo_o_drzwiach := 1]
	[#] [tron_bylo_o_komnacie = 0] "Co robiles w tamtej komnacie?" [tron_talk1]
		-Co robiles w tamtej komnacie? / -Pilnowalem klucza. / -To niedokladnie go pilnowales. /
		-Moze chcialem zebys go ukradl. / -Lubisz jak cie okradaja? / -A lubisz jak ci w morde daja? /
		-A ty? / -Tak. / -Czyzbys byl masochista? / -A chcesz dostac od masochisty w morde?
		[tron_bylo_o_komnacie := 1]
	[#] [tron_bylo_o_restorze = 0] "Dlaczego nazywaja cie Restor?" [tron_talk1]
		-Dlaczego nazywaja cie Restor? / -Rodzice dali mi tak na imie? / -Musieli cie nienawidziec. /
		-Wcale nie, mialem bardzo udane dziecinstwo, rodzice mnie kochali. Zawsze chchodzili ze mna
		na spacery, a pozniej zsotawiali mnie samego po srodku ciemnego lasu. Az w koncu znalazl mnie
		wujek Borsuk i przyprowadzil do tych podziemi. Dlaczego to spotkalo mnie?! DLACZEGO!!!
		[tron_bylo_o_restorze := 1]
	[#] "Mam dosc tej rozmowy." [tron_niepogada]
		/ -Mam dosc tej rozmowy. / -To zabieraj sie stad.

[##][tron_uciekam]
	Wybiegasz z komnaty i biegniesz korytarzem na wschod. Po drodze mijasz zlote drzwi. Biegniesz dalej,
	az docierasz do niewielkiej komnaty.
	[->][barykada]

[##][tron_wychodze]
	Opuszczasz komnate i idziesz waskim korytarzem na wschod. Po drodze mijasz zlote drzwi.
	Idziesz dalej, az docierasz do niewielkiej komnaty.
	[->][barykada]

[//]---------------------------------------------------------------------------------------

[##][TODO]
	/ >> Niestety tu jeszcze scenariusz nie zostal dopisany. <<
	[+]

[##][FAIL]
	/ >> Niestety autor opowiadania nie przewidzial takiej sytuacji. <<
	[+]
