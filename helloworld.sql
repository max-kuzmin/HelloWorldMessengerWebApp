-- Adminer 4.2.2 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `dialog`;
CREATE TABLE `dialog` (
  `dialog_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`dialog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `dialog` (`dialog_id`, `name`, `time`) VALUES
(1,	'1-2',	1444081699),
(3,	'9-1',	1444084860),
(4,	'ololo',	1444676486),
(5,	'aaaaa',	1446738420),
(6,	'1-123',	1445420151),
(7,	'dialog2',	1444646237),
(8,	'1-1',	1444646213),
(9,	'works',	1444808800),
(10,	'1-2',	1444808842),
(11,	'gj',	1445091818),
(12,	'1-111',	1444943359),
(13,	'1-1',	1446737937),
(14,	'1-2',	1446735248),
(15,	'44-1',	1446735351),
(16,	'55-123',	1446735386),
(17,	'77-1',	1446736203);

DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login1` varchar(50) NOT NULL,
  `login2` varchar(50) NOT NULL,
  `confirm1` bit(1) NOT NULL,
  `confirm2` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `img` mediumblob NOT NULL,
  `login` varchar(50) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `image` (`img_id`, `img`, `login`, `message_id`) VALUES
(3,	'ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0\n\n\n\r\rÿÛ\0C		\r\rÿÀ\0\0d\0d\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RðbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ø÷âß†õ/Ž¾%·ñm¿·t‹{D°–çÌ[m³«Èì›f(Çå•@ÇÍ× Ö‡Ào\0ø‡áo¤¼ñ6štë}BÒKVÅ7™>å—f#v#ä†FÉÀùqœSû#ÿ\0É5Ôì//þ‰‚»¿ˆ?òðý…ßÿ\0HnëVTpÕjÃxÅµòLàÇÖ–	Z´7Œd×ªM–|bßðøG\\Ò­ˆK‹ëícyx@Ï(-ŒœdŽ€×ÌðÌ,ÿ\0 Žÿ\0eÿ\0ãuôåùúË˜w_qøçúÝš4~ážÔíüà]6\rNP‹¤é‘Gu<jY\0Š €1)=3í^ñoÃz—Ç_ÛøƒÀ¶ßÛºE½¢XKsæ-¶ÙÕävM³còÊ‡ cæëkÖþ ÿ\0È…â_û\\ÿ\0è¦®wöGÿ\0’k¨ÿ\0Ø^_ý}¦A˜WÌ)Tv®ŸCôÍ19¥\Z“Ä´ÜZJÊÝ#á‡µ>\"º×¼wmý…¤ÝZ5„Wb\\î&ØK°ÊÄç$cŽ¼Œú7‰þ5x/Æ^\ZÕü?£k_lÕõkI¬,­þÇ<~lò£$i¹*å˜±\0g’fþ×?òNt¿ûÇÿ\0¢\'¯œ~ÿ\0ÉJð—ý…í?ôr×Ôdt_ðÎ_¿è\\ÿ\0Éû_þ;_@xkão‚¼!áÍ+@Ö5¯±êÚU¤6–ÿ\0džO*xG\"nD*Øe#*H8àšõºüÿ\0ø“ÿ\0%ÅŸö¼ÿ\0Ñï@·ñoÃz—Ç_ÛøƒÀ¶ßÛºE½¢XKsæ-¶ÙÕävM³còÊ‡ cæëiß¼=¨ü	ñÖ½ã»oì-&êÑ¬\"¸óçtìèá6Â]†V\'9#uäg·ý‘ÿ\0äšê?ö—ÿ\0DÁLý®äœéöÿ\0DO@/ü4ÃŸúþ\0]ñª+âj(éñ§ü2È>6ð”ý³þ&¿li~É³î¼½€>qägv‹ã¿|c\Z<GggýŽ4oìmú®ñrgó¾F·òñµvÿ\0ÇÎíÜýÌcœ>ý­ÿ\0ä¥iÿ\0ö‹ÿ\0GOP~Ë?ò;ë?öý(‚¼ìËýÊ¿øeù3ÊÍ¿ä]ˆÿ\0¿&})EWágóyK[Ñ¿á\"Ñu\r\'Îû7Ûíäµó¶îò÷©]ØÈÎ3œdW’§?á–Að‰³ÿ\0„§íŸñ5ûcKöM›ÿ\0uåìó#;³üXÇûe§ü}Cþúÿ\0:ù·ö·ÿ\0’•§ÿ\0Ø\"/ý=~—ÂÀ«ê¿#õÞÿ\0w­þ%ù;xÃþ\Z \n1áo°ÿ\0Ä×í‚_µïÙû¯/a	ŒùÙÎOÝÆ9È`ýšOÃø«¿á%:öüM~ÇöŸä~÷Ëßæ»¶cv3œ\Zçÿ\0dOù(º¯ý‚$ÿ\0Ñð×Ñßÿ\0äšø·þÁú%ëîÒÿ\0†Éô\'/þÏÿ\0\Z¦Ù”üB\'ÅcÄÇNþÞÿ\0‰¯ØÅ€—Èóÿ\0{åïóí»ñœã8+æúý\0økÿ\0$çÂŸö³ÿ\0Ñ	@ ž4ÿ\0†YÂ&ÏþŸ¶Ä×í/Ù6oý×—°Î<ŒîÏñcr­ãøj€|(,Ç…¾Ãÿ\0_¶	~×¿gî¼½„&3çg9?wç#˜ý­ÿ\0ä¥iÿ\0ö‹ÿ\0GOR~ÈŸòQu_ûIÿ\0£á ƒþÔÿ\0Ðäßø,üvŠúRŠ\0ð¯ÙÛK³øà{ÝKÅ6x—P‹Q’Ý.õx–êTˆE $(.ÇÆXžæº/ˆVþøcÿ\0þ±…‡íŸQ6÷wb6’&¶¸!Ë\\²ù‹c‘•SØÎþÎº¥—€<{§x¢î\rêj2\\%¦¯*ÚÊÑ¢Pá$ •%gÊ‘ØÓ?h½JÓÇþ°Óü-u‰/âÔRâK]\"Au*D\"•K”Œ’3(ÏL°Åc^”kÒ•m$×ß¡Ïˆ¡MÐžÒM;oª±±¥üfðv³©ÚiözÇww2Ae™w;0U(\0É#“^ý•uÿ\0<¿ñáþ5ñï€üâ=ÆþÔuêš~Ÿg¨Û\\\\ÝÝYIPD’«;»²€ª I8\0këßøYžÿ\0¡¯Dÿ\0ÁŒ?üU|Ÿú«‚þyýëÿ\0‘>\'ýKËÿ\0ž|ùÌ|sñ‹Ãz~™â.\rjK}r®-‘b†exî2€.8`qß4ßÙÛK³øà{ÝKÅ6x—P‹Q’Ý.õx–êTˆE $(.ÇÆXžæ¼?ÆÞñ.³ãOê\Z‡µ[ë½FæâÚêÚÊY\"š\'•™T†VR à‚¯pýuK/\0x÷NñEÜÔ$Ôd¸KM^Uµ•¢1D¡ÂHA*J0Î1•#±¯s.Ë(å°”(¶Ó×[~‰G•e2ˆJ	6¤ï­¿D†~ÑZeŸÃïØj>´ƒÃZ„ºŠ[Éw£Æ-%xŒR±Bñà•%Tã8ÊƒØW‹xÇ^%ÖüoáÝ7Rñ«¨i÷šµ½Í¥Õì²E<O*«££1¬	Aƒ^ÓûEêVž?ð]†Ÿák¨<I¢—Zé©R!ª\\¤d¡™Fze€î+Å|àèž7ðî£¨øTÓôû=FÚâæîêÊHâ‚$•YÝÝ”U\0’IÀ\0“^±íŸ^ÿ\0Â±ðwý\nzþaÿ\0âkäxïÄº/ŒüC§iÞ\"Õl4ûMFæÞÚÒÖöXâ†$••XU\0\0\0À\0__ÿ\0ÂÌðý\rz\'þaÿ\0â«ãÿ\0xÄºÏ<C¨iþÕo¬.õ›‹k«k)dŠhžVdtuRYH ƒ‚\"€=ÃövÒìþ x÷RñM¤%Ô\"Ôd·K½^%º•\"DÁÈ	\n±Æq–\'¹¦~ÑZeŸÃïØj>´ƒÃZ„ºŠ[Éw£Æ-%xŒR±Bñà•%Tã8ÊƒØSÿ\0g]RËÀ½Ó¼Qw†õ	5.ÓW•mehŒQ(p’J’Œ3ŒeHìiŸ´^¥iãÿ\0ØiþºƒÄ—ñj)q%®‘ º•\"J¥ÊFI\n”g¦Xâ€>yÿ\0…ãú5ÏüMÿ\0ÅQIÿ\0\nÏÆô*kø.›ÿ\0‰¢€=ö·ÿ\0’•§ÿ\0Ø\"/ý=Iû\"ÉEÕì\'þ†º$ð_ü5.|\\o?áû\'üJ¾Æbû^ýŸ½ó7å1Ÿ?qü9Ï<)ðü2À>+Ÿð”ý»þ%_cò¾É³ï|Íù“8òq·ïg<`€{_Äÿ\0ù&¾-ÿ\0°Eßþ‰zø\n¾´©øÿ\0ü#gNþßÿ\0‰WÛ>Ýæùî¼ÍžXÝ·~vägÈ§ÿ\0Ãúþ?ûm\0{oÃ_ù\'>ÿ\0°EŸþˆJù«ö·ÿ\0’•§ÿ\0Ø\"/ý=t§ö™?Ið ðÑÔFƒÿ\0¯¶}¿ÊóüÝy›<³·vÌíÉÆq“Ö•<ÿ\0\rKŸÏøEþÉÿ\0¯±˜¾×¿gï|ÍùLgÏÆÜsÏ\0ïì‰ÿ\0%Uÿ\0°DŸú>\Zú;âü“_ÿ\0Ø\"ïÿ\0D½x¡ðü2À>+Ÿð”ý»þ%_cò¾É³ï|Íù“8òq·ïg<`´~Ò§â?üR?ð;ûþ%_lûw›äyÿ\0ºó6ycvÝùÛ‘œc\"€>o¯Ð†¿òN|)ÿ\0`‹?ý•â_ðÆÃþ‡ÿ\0‚ÏþÛL?´ÉøzO…†Ž¢4ø•}³íþWŸä~ëÌÙå»¶gnN3Œž´Í~Öÿ\0òR´ÿ\0ûEÿ\0£§©?dOù(º¯ý‚$ÿ\0Ñð×Džÿ\0†¥Ï‹çü\"ÿ\0dÿ\0‰WØÌ_kß³÷¾fü¦3çãn?‡9ç…>ÿ\0†XÅbóþŸ·Ä«ì~WÙ6oýï™¿2gN6à}ìçŒ¤h¯›?á²Oý	Çÿ\0ýªŠ\0éÿ\0dù&ºý…åÿ\0Ñ0S?kŸù\':_ý…ãÿ\0Ñ×ñcÄº—ÀÁáÿ\0Üÿ\0bi‰-¹E¹Ý;<ˆÏº`ì2± À8ùzdœ¿á\'ˆõ!»Ð<up5½&ÚÑ¯â·­¶ÙÕÑî„#–G\'7N\0y\'Âÿ\0ù)^ÿ\0°½§þŽZûö¼‡Äÿ\0üàÏ\rjÞ Ñ´v³Õô›I¯ì®>Ù;ùSÄŒñ¾Ör­†PpÀƒŽAà¿ðÒè`_ü\0¶ÿ\0ãtËüIÿ\0’‹âÏûÞè÷¯¥?dù&ºý…åÿ\0Ñ0V‡‡>ø/ÆÒµý_F7z¶«i\rýåÀ»ž?6yP<µ*å˜œ(\0g€+Í¾,x—RøâX<?à[ŸìM\"âÑ/å·(·;§g‘÷L†V$/L“Ûö¹ÿ\0’s¥ÿ\0Ø^?ý=|ãð¿þJW„¿ì/iÿ\0£–½oá\'ˆõ!»Ð<up5½&ÚÑ¯â·­¶ÙÕÑî„#–G\'7Nz\'‰þ	ø3Áž\ZÕ¼A£híg«é6“_Ù\\}²wò§‰ã}¬å[ á‚(×«óÿ\0âOü”_Ø^óÿ\0G½uðÒè`_ü\0¶ÿ\0ãuïžø#à¿xwJ×õ}ÝêÚ­¤7÷—îxüÙå@ò>Ôp«–bp ž\0 ÿ\0ÙþI®£ÿ\0ayôLÏÚçþIÎ—ÿ\0axÿ\0ôDõÄüXñ.¥ð#Ä°xÀ·?ØšEÅ¢_ËnQnwNÏ\"3î˜;¬H0>^™\'/øIâ=GãÇˆnô\\\roI¶´kø­Äkm¶ut@û¡Çå‘Æ	ÇÍÓ@?Q_lÃ7|:ÿ\0¡}¿ð>çÿ\0ŽQ@9ûDiwž?ñ½ž£ákIüI§Ç§Gn÷zDmuJ%•ŠŒSŒçqNýœôËÏ‡þ4Ô5ÚÏá­>]9íã»Õã6±<¦X˜ y0¬qœáIìkÐ?dù&ºý…åÿ\0Ñ0S?kŸù\':_ý…ãÿ\0ÑÐ[ã¿xo[ð?ˆ´Ý;Ä:V¡¨^i×öÖ–·±É,ò¼L¨ˆŠÄ³1 \0$|‡ÿ\0\nËÆô*kŸø-›ÿ\0‰¥ø_ÿ\0%+Â_ö´ÿ\0ÑË_~ÐàøkEð_‡ôíCÄ:U†¡i§[[ÜÚ\\ÞÅ°Ê‘*º:3¬¤AkÄ?h.óÇþ7³Ô|-i?‰4øôèíÞïH®¢ID²±Bñ‚\0êqœáî+Ë~$ÿ\0ÉEñgý…ï?ô{×ÒŸ²?ü“]GþÂòÿ\0è˜(Ïÿ\0g=2óáÿ\05\rGÅ6³økO—N{xîõxÍ¬O)–&LÄ+g8R{\Zö¯øëÃzßüE¦éÞ!Òµ\rBóN¸·¶´µ½ŽIg•âeDDV%™‰\0\0	$€+’ý®äœéöÿ\0DO_8ü/ÿ\0’•á/ûÚèå ÿ\0…eãú5ÏüÍÿ\0Ä××þñß†´_øNÔ<C¥Xjšuµ½Í¥ÍìQË©«££0*ÊAA»úüÿ\0ø“ÿ\0%ÅŸö¼ÿ\0Ñï@¥ûDiwž?ñ½ž£ákIüI§Ç§Gn÷zDmuJ%•ŠŒSŒçqNýœôËÏ‡þ4Ô5ÚÏá­>]9íã»Õã6±<¦X˜ y0¬qœáIìkÐ?dù&ºý…åÿ\0Ñ0S?kŸù\':_ý…ãÿ\0ÑÐ¥ÂÎðwý\ršþ¡ÿ\0â¨¯€h ­ÿ\0dù&ºý…åÿ\0Ñ0S?kŸù\':_ý…ãÿ\0ÑÑE\0|ãð¿þJW„¿ì/iÿ\0£–¾ý¢Š\0üÿ\0ø“ÿ\0%ÅŸö¼ÿ\0Ñï_J~Èÿ\0òMuûËÿ\0¢`¢Š\0gísÿ\0$çKÿ\0°¼ú\"zùÇáü”¯	Ø^Óÿ\0G-Pßµùÿ\0ñ\'þJ/‹?ì/yÿ\0£ÞŠ(éOÙþI®£ÿ\0ayôLÏÚçþIÎ—ÿ\0axÿ\0ôDôQ@%ÑEÿÙ',	'1',	NULL),
(4,	'ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0\n\n\n\r\rÿÛ\0C		\r\rÿÀ\0\0d\0d\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RðbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0øÓöŒÔnüãk-?ÃsønÂM9\'{MV´‰ä2Ê¥ÊFT!TgÂØQû9j7~<ñµöŸâ{¹üIaœó¥¦±+]Ä’	bPá$,\0Ì3Œáˆîhý¢ôÛÏøÚËPðµ¤þ%ÓâÓ’	.ôxÔI –V(^<€À2œuÃÞÙËM¼ð¯µÚOá­>]9àŽïXˆÚÄòb`äÀ,B±Ç\\)=¨Ûüuà\rèÞñ¡§ø{I°¿´Ó®\'·»µ±Š)a‘cfGGUX ‚WÇ¿ð±ü]ÿ\0C^»ÿ\0ƒ9ÿ\0øºûÇ^8ðÞ³àŸéúwˆt­CP»Ó® ¶´µ½ŽIg‘£eDD–f$\0$+ãßøV¾0ÿ\0¡K]ÿ\0ÁlßüM\0}…àOxoYðG‡µ\rCÃÚMýýÞo=ÅÝÕŒRË4\Z³;»),ÌI$’I$“^!ûFj7~ñµ–Ÿá‹¹ü7a&œ“½¦+ZDòeRå#*ª3Œá@ì+Ûüã\rèÞ	ðöŸ¨ø‡J°Ô-4ëx.-.¯cŽX$XÕ]	YH ƒÈ ŠñÚ/M¼ñï¬µZOâ]>-9 ’ïGˆÝD’	eb…ãÈ)Ç\\0=è\0ýœµ¿xÚûOñ=Üþ$°‹NyÒÓX•®âI±(p’€fÆpÄw5íþ:ðG†ôox‡PÓü=¤Ø_Úi×ÛÝÚØÅ°È±³#£ª‚¬A+Ä?g-6óÀ^6¾Ô<Si?†´ùtç‚;½b#kÈe‰‚“\0±\nÇp¤ö¯oñ×Ž<7¬ø\'Ä:~â+PÔ.ôëˆ-­-oc’YähÙQ%™‰\0É$\n\0ø÷þ?‹¿èk×ðg?ÿ\0_axÁÖ|áíCPðö“w§[Ïqwuc²Í#F¬ÎîÊK3I$’I$×Ç¿ð­|aÿ\0B–»ÿ\0‚Ù¿øšûÀ¾8ðÞàŸiúˆt«\rBÓN·‚âÒêö8å‚EUÑÐU”‚<‚ ý£5¿øÚËOðÅÜþ°“NIÞÓG•­\"y²©r‘•ˆUÆp v~ÎZß<m}§øžîXE§<éi¬J×q$‚X”8I\0À3ã8b;š?h½6óÇ¾6²Ô<-i?‰tø´ä‚K½#uH%•Š 0§pÀ÷£örÓo<ãkíCÅ6“økO—Nx#»Ö\"6±<†X˜ y0¬q×\nOj\0ú/þ·„?èSÐ¿ðYÿ\0E\'ü,¿ÐÛ¡ÿ\0àÆþ*Š\0óoÙþIÆ§ÿ\0ai?ôL4~×òN4ßûGÿ\0¢f®hxËþoþ)?±ÿ\0ÂOöÏøš}¯Íû&Íÿ\0»Ù³gNsŸâÆ8ä2ÿ\0†¤ÿ\0ŠOìðŒ}þ&Ÿkó~×¿gîölÄxÏœçøqŽx\0ñ/†_òQü)ÿ\0akOýµ÷ý|Ûÿ\0Õÿ\0\nïþ*ÏøHÿ\0´?°¿âiöO°ù^“ûÍ›üÃ·vÜgÎ\rðØÿ\0õ(åOÿ\0µP‰|Lÿ\0’â¿û]ÿ\0èç¯¤¿doù\'\ZŸý…¤ÿ\0Ñ0×5ÿ\0Õÿ\0þ*ÏøHÿ\0³ÿ\0·âiöO°ù¾GûÍ›üÁ»nìg8ÎÆ_ðËñIýþ¶ÄÓí~oÙ6oýÞÍ˜“8òsœÿ\01Ç /íqÿ\0$ãMÿ\0°´ú&jù·á—ü”\nØZÓÿ\0G-{hñ—ü5\'üRcÿ\0„cìñ4û_›ö½û?w³f#Æ|ìç?ÃŒsÁÿ\0Õÿ\0\nïþ*ÏøHÿ\0´?°¿âiöO°ù^“ûÍ›üÃ·vÜgÎ\r\0}%_\0|Lÿ\0’â¿û]ÿ\0èç¯mÿ\0†Çÿ\0©Cÿ\0*ýªøf¯øXŸñVÂGýŸý»ÿ\0O²}‡Íò<ïÞlßæ\rÛwc8Æp(¥ý‘¿äœjö“ÿ\0DÃGíqÿ\0$ãMÿ\0°´ú&jæ‡Œ¿á–ÿ\0â“ûü$ÿ\0lÿ\0‰§Úüß²lßû½›1&qäç9þ,cŽAã/øjOø¤þÇÿ\0ÇØÿ\0âiö¿7í{ö~ïfÌGŒùÙÎ‡ç€›¨¯¤áŽ?êoÿ\0Êgÿ\0m¢€9¿ÚãþJ>›ÿ\0`˜ÿ\0ôtÔ~ÈßòQõ?ûÉÿ\0£¡®Ûá‡4ïŽ¾¹×üsoý·«[]µŒWÚßl*ˆávÄUOÍ#œ‘žzð(ø·áÍ;àW‡-µÿ\0[ÿ\0bj×7kc-Æö¸Ý#¹]²–QóF‡ gŽ¼œ€zßÄÏù\'+ÿ\0°Mßþ‰zø½oÃ?\Z¼gãéZ¯¬}¯IÕnâ±¼·û,)æÃ+„‘w*V# ‚3Á¯~ÿ\0†qøwÿ\0Bùÿ\0ÀÛþ9@/Ã/ù\'ÿ\0°M§þ‰Zù»ö¸ÿ\0’¦ÿ\0Ø&?ý5uúŠ|CÖ¹¥Ùë×6\Zv©O¦Y[C»íâ!c]Ï3¸$“Žy¦k\Z-‡ŠnVïÄ–Ëâ+äA]]»BË$„\Zàc’	ù8ÀM\\ÓFnœïuä}ö‚3|Ç\r]Ç’jêò±ÉþÈßòQõ?ûÉÿ\0£¡¯¤~&É8ñ_ý‚nÿ\0ôK×hÚ-‡…®^ïÃvËáÛçCÝZ;LÍ ”\"s\"à•SùG8È5|Cã_·ˆü3 ]ë³ßé:íØ±¿·žÞÝ|È]ãGPÉ\Z²å]†AÈìE:•EEN»ò2Ì¸36Ê°“ÆbcHÚö•÷i/ÅŸ8Wßß¿äœxSþÁ6Ÿú%kšÿ\0†qøwÿ\0Bùÿ\0ÀÛþ9^â_^3ðˆõ]HÖ>É¤éWrØÙÛý–ò¡‰Ù#]Ì…Ž@É$œrMz§Ã\Z_µÇü”}7þÁ1ÿ\0èé¨ý‘¿ä£êö	“ÿ\0GC]·Â?iß|9s¯øæßûoV¶»k®7µ¾ØUÂíˆªŸšG9#<õàQñoÃšwÀ¯[kþ·þÄÕ®nÖÆ[íqºGr»e,£æ@Ïy9\0úŠø—þ\Z7â\'ýÿ\0\0­ÿ\0øÝì³¦§gàßiÞ(»ƒÃwòêq®¯ µ•ã1Ä¡ÂHA*J°Î1•#±£öŠÔìü}à›-;Â÷px’þ-A.×H]J‘ˆåRå#$…”gËÜWŸþ×J$ø‘¦–öL\\žå´ô~ÈŠ#ø‘©•OöLœŽ?å´4ÉxÀÞ$Ñ|káýGQðþ©aai¨[Ü\\]\\ÙIPÆ²+;»²€ª\0$’p\05õÿ\0ü,Ïÿ\0Ð×¢àÆþ*ñ5Ù¾ø°$&ï‚é‹×çï”ŸÜ_Ê€>‘Ñ­¦‹WñMÃÄéo{­]]ÚÊÊB\\@ì\nKèÈÃÃ ö5­VÜÿ\0Å-àÁØx~Èo’ªWçY‡ûÕOSû„äE…ÿ\0êÍkúeåÇ¼¨Ek<–\Zv —·I1ZÄ%‰‹ÈÝ@V9búWK[v§þ-ÇÄØé3=s5k•¾Cçù3ƒŽÿ\0äÄÿ\0ÛŸú\\Nûþgƒÿ\0èkÑ?ðcÿ\0_ xçÀÞ$Ö¼kâ\rGNðþ©aw¨\\\\[Ý[YI$SFÒ3#£ªÊApAçÞRq*ýøbì¿\rü&“i€ý1Zý\0þI<¯ötÔìüà›í;Åpxnþ]Aî#µÕä²¼f8”8I%IVÆ2¤v4~ÑZŸ¼e§x^î_Å¨%ÃÚé©R1ª\\¤d ²Œã`;Šóÿ\0ÚéDŸ4ÒÀ1þÉ‹“Ïü¶žÙD52 )þÉ“‘Çü¶†€<ßþŸŒ?èTÖÿ\0ð]7ÿ\0E~€ùýæüè ˜¼]áßÚgRÅ’\r?O´ˆi’E¬³E1•Y¤$ÖA·/;È<t$ð‡„ofmJ_x¦H5\r>î#¦GŒÍ,ÂVa $H±¸…¹ÜNHã©wìÿ\0$ãSÿ\0°´Ÿú&\Z?kù\'\Zoý…£ÿ\0Ñ3P]Oö‹ð×ôÛ¿iÖ\Z¼:†·é–ÒÝCÂ’Ìh\\¬¬B‚Ã$qœÒ¼ÿ\0þÆ_ôÐð\"þ3^oðËþJ?…?ì-iÿ\0£–¾ÿ\0 Ÿ­uˆol­4¤IãÃÐ&‡tÌÇžµÚ3œ”\'¡!O¨úógâ1ð‡Œüaf4áwæk—’ï3ìÆd#Ú»ú×«|!´ÿ\0…§á»X¿ö_“vÖ¾HvpˆÛ³òÿ\0Çjø¼f]‰«ˆœá¦û¯ó?¤øwŒ2LS‡Ãb+òÎ1³\\³v~ª-é.<]g¥é·Þ–)ÛPñTM¦YHŠ¦åpcRX¹•yPÇ\0ñÐ?m?áVønÛVý©ç]­¯’G“Œ£¶ìüßÜÆ1Þ¼{JñÉñŸÄæÄYý›V·é7™»tÑÿ\0²1÷ZÓ/ÀbhbcR¤l•ú®ÏÌäâÎ,É³,š¾	_š¤¹l¹f¶œ[ÕÅ-“êtðÈÞ2ÿ\0 –ƒÿ\0ÿ\0ñšô\r/ö‹ð×€4ÛOj6\Z¼ú†‰i—2ÚÃBòÂ<·(ZU%IS‚@8Æ@é^ï_\0|Lÿ\0’â¿û]ÿ\0èç¯°?Ïdñw„oiJ?xZH4ý>Ò!¦I²ÍÆUf#YÜL¼î ñÐ“Â½ý™µ)|Qâ™ Ô4û¸Ž™Z34³	Y„€‘\"Æ6âçq9#Ž¤uß²7ü“OþÂÒè˜hý®?äœi¿öÿ\0DÍ@	ÿ\0\ruàïúkßøÿ\0¢¾J¢€=ÿ\0âçˆõ~$¶Ð<\rsý‡¤ÜÚ-ô¶ûãtÌî…÷L‡Ë\ZŽ:rr|\"ñ£ñÓÄ—ZŽn·4›kF¾ŠßbÛí™]>èB1ùdq‚qÏNf~×LâFš…?Ù1uÿ\0®ÓÑû\"0‰\Z˜Rÿ\0dÉÓþ»C@¹âo‚Þð†õmGÑ¾Ç«iV’ßYÜ}ªgò¦‰ã}¬åNAÁr\r|ÿ\0ÿ\0\rñþ†#ÿ\0€Vßün¾·øš¤|7ña €4›¿ýõùýæ\'÷—ó ²¼1ð[Áž0ðÞ“¯ë\Z7Û5mRÒëËµLžlÒ yj¸Q–bp\0<^mñsÄzÀ¿[h¹þÃÒnmú[}‹qºfwBû¦ÃåÇ99úáŠ“ðßÂ„AÒm?ôJ×ÍŸµÓø‘¦†!OöL]ë´ô§ð‹ÄzÇO]h9¹þÜÒm­\Zú+}‹o¶et@û¡Çå‘Æ	Ç=8é>&ø-àÏøoV×ô}ìz¶•i-õÇÚ¦*h‘ž7ÚÎTá”AÇ ×‘þÈŒâF¦†?Ù2tÿ\0®Ð×ÒT†þ,$“wÿ\0¢^€>Hÿ\0†Œø‰ÿ\0Cÿ\0À+oþ7_@xcà·ƒ<aá½\'_Ö4o¶jÚ¥¤7×—j™<Ù¥@ò>Õp£,Äà\0x¾5óûËù×èÃ\'á¿…ƒ¤Úè• Ÿþ.xQøâKmÀ×?ØzMÍ¢ßKo±n7LÎè_tÁØ|± À8ã§\'\'Â/ê?<Iu xæçûsI¶´kè­ö-¾Ù•Ñî„#–G\'ôàVgítÁ>$i¡ˆSý“_úí=²#ø‘©…!öL?ë´4íßðÎÿ\0è^ÿ\0ÉÛŸþ9EzVÆþéü¨ ý‘Ï†ú˜_”kIÓùc\rµÑßðßM\róíhºóÿ\0,g¢Š\0ù³áŠ(ø‘áB5kNqÿ\0M–¿@w·÷çEùýñ5üHña*	:µß8ÿ\0¦Ï_IþÈ‡gÃ}L/Ê?µ¤éÇü±†Š(\0ý®Žÿ\0†úho˜kE×Ÿùc=|ÙðÅ|Hð¡\n\Zµ§8ÿ\0¦ËEú½¿¼:üþøšŠ~$x°•ZïœÓg¢Š\0úOöD;>êa~Qý­\'N?åŒ4~×GÃ}47Ì?µ¢ëÏü±žŠ(ä-?º¿•Q@ÿÙ',	'77',	NULL),
(5,	'ÿØÿà\0JFIF\0\0`\0`\0\0ÿá\0fExif\0\0MM\0*\0\0\0\0\Z\0\0\0\0\0\0\0>\0\0\0\0\0\0\0F(\0\0\0\0\0\0\01\0\0\0\0\0\0\0N\0\0\0\0\0\0\0`\0\0\0\0\0\0`\0\0\0paint.net 4.0.5\0ÿÛ\0C\0\n	\n\r\r\r\r\ZÿÛ\0C\rÿÀ\0\02\02\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RðbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ñz(¢¿)?¿‚Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( ÿÙ',	'aaaaa',	NULL);

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `dialog_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `message` (`message_id`, `login`, `dialog_id`, `time`, `text`) VALUES
(1,	'1',	5,	1444168861,	'hellololo'),
(2,	'1',	5,	1444168879,	'hellololo'),
(3,	'1',	5,	1444168900,	'hellololo'),
(4,	'1',	5,	1444168906,	'hellololo'),
(5,	'1',	4,	1444645562,	'hello'),
(6,	'1',	4,	1444645593,	'hello'),
(7,	'1',	7,	1444645714,	'123'),
(8,	'1',	7,	1444645739,	'43634646346'),
(9,	'1',	8,	1444646213,	'oooooooo'),
(10,	'1',	7,	1444646237,	'kjjkjkk'),
(11,	'1',	4,	1444646298,	'fgfg'),
(12,	'1',	4,	1444674430,	'345'),
(13,	'1',	4,	1444674432,	'345'),
(14,	'1',	4,	1444674432,	'345'),
(15,	'1',	4,	1444674433,	'345'),
(16,	'1',	4,	1444674433,	'345'),
(17,	'1',	4,	1444674433,	'345'),
(18,	'1',	4,	1444674433,	'345'),
(19,	'1',	4,	1444674434,	'345'),
(20,	'1',	4,	1444674437,	'214323434345'),
(21,	'1',	4,	1444674439,	'214323434345'),
(22,	'1',	4,	1444675465,	'tttt'),
(23,	'1',	4,	1444675531,	'tttt'),
(24,	'1',	4,	1444675536,	'ttttfgh'),
(25,	'1',	4,	1444675544,	'ttttfgh'),
(26,	'1',	4,	1444675548,	'ttttfgh'),
(27,	'1',	4,	1444675550,	'ttttfghv'),
(28,	'1',	4,	1444675573,	'ttttfghv'),
(29,	'1',	4,	1444675619,	'ttttfghv'),
(30,	'1',	4,	1444676197,	'tyfghgjhj'),
(31,	'1',	4,	1444676477,	'56'),
(32,	'1',	4,	1444676480,	'655765'),
(33,	'1',	4,	1444676482,	'34634643634634'),
(34,	'1',	4,	1444676486,	'7686786'),
(35,	'1',	9,	1444808737,	'retertert'),
(36,	'1',	9,	1444808765,	'fgh'),
(37,	'1',	9,	1444808800,	'fg'),
(38,	'1',	10,	1444808842,	'456'),
(39,	'1',	12,	1444943359,	'12131'),
(40,	'1',	11,	1444943363,	'12313'),
(41,	'1',	11,	1445080439,	'dfh'),
(42,	'1',	11,	1445080442,	'fgjfgjf'),
(43,	'1',	11,	1445080624,	'dfsg'),
(44,	'1',	11,	1445080626,	'dfgdgfd'),
(45,	'1',	11,	1445091818,	'dfgdfg'),
(46,	'123',	6,	1445093013,	'hellololo123'),
(47,	'123',	6,	1445093016,	'hellololo123'),
(48,	'123',	6,	1445093050,	'hellololo123'),
(49,	'123',	6,	1445093069,	'hellololo123'),
(50,	'123',	6,	1445093563,	'hellololo123'),
(51,	'123',	6,	1445093566,	'hellololo123'),
(52,	'123',	6,	1445093621,	'hellololo123'),
(53,	'1',	6,	1445093641,	'dhdgh'),
(54,	'1',	5,	1445246507,	'hellololo'),
(55,	'1',	5,	1445420105,	'hellololo'),
(56,	'1',	6,	1445420109,	'hellololo'),
(57,	'1',	6,	1445420125,	'hellololo'),
(58,	'1',	6,	1445420136,	'hellololo'),
(59,	'1',	6,	1445420151,	'hellololo'),
(60,	'77',	17,	1446735476,	'sggds'),
(61,	'77',	17,	1446735483,	'hfsdhfhfhd'),
(62,	'1',	17,	1446736203,	'fdgdf'),
(63,	'1',	5,	1446736334,	'hellololo'),
(64,	'1',	5,	1446736341,	'??????????'),
(65,	'1',	5,	1446736417,	'hellololo'),
(66,	'1',	5,	1446736441,	'??????'),
(67,	'1',	5,	1446736640,	'??????'),
(68,	'1',	5,	1446736690,	''),
(69,	'1',	5,	1446736711,	'??????'),
(70,	'1',	5,	1446736838,	''),
(71,	'1',	5,	1446736887,	'??????'),
(72,	'1',	5,	1446737061,	'?????????Âµ?â€š'),
(73,	'1',	5,	1446737086,	'??????'),
(74,	'1',	5,	1446737152,	'??????'),
(75,	'1',	5,	1446737238,	'?????????Âµ?â€š'),
(76,	'1',	5,	1446737349,	'?????????Âµ?â€š'),
(77,	'1',	5,	1446737461,	'ÃÂ¿Ã‘â‚¬ÃÂ¸ÃÂ²ÃÂµÃ‘â€š'),
(78,	'1',	5,	1446737705,	'??????'),
(79,	'1',	5,	1446737714,	'????'),
(80,	'1',	5,	1446737787,	'????'),
(81,	'1',	5,	1446737905,	'http://www.google.com/m?hl=en'),
(82,	'1',	13,	1446737937,	'drhd'),
(83,	'1',	5,	1446738365,	'????????????????????????????????????'),
(84,	'1',	5,	1446738371,	'????????????????????????????????????'),
(85,	'1',	5,	1446738400,	''),
(86,	'1',	5,	1446738420,	'??????????????????????????????????');

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `login` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `gender` bit(1) NOT NULL,
  `country` int(11) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user` (`login`, `pass`, `name`, `email`, `token`, `gender`, `country`) VALUES
('1',	'c4ca4238a0b923820dcc509a6f75849b',	'Max K',	'Test user acc',	'',	CONV('0', 2, 10) + 0,	0),
('111',	'698d51a19d8a121ce581499d7b701668',	'1121',	'111',	'',	CONV('0', 2, 10) + 0,	0),
('123',	'202cb962ac59075b964b07152d234b70',	'123',	'123',	'',	CONV('0', 2, 10) + 0,	0),
('2',	'c4ca4238a0b923820dcc509a6f75849b',	'123',	'123',	'',	CONV('0', 2, 10) + 0,	0),
('44',	'f7177163c833dff4b38fc8d2872f1ec6',	'44',	'44',	'',	CONV('0', 2, 10) + 0,	0),
('55',	'b53b3a3d6ab90ce0268229151c9bde11',	'55',	'55',	'',	CONV('0', 2, 10) + 0,	0),
('77',	'28dd2c7955ce926456240b2ff0100bde',	'77',	'77',	'',	CONV('0', 2, 10) + 0,	0),
('9',	'45c48cce2e2d7fbdea1afc51c7c6ad26',	'9',	'9',	'',	CONV('0', 2, 10) + 0,	0),
('aaaaa',	'594f803b380a41396ed63dca39503542',	'aaaaa1',	'max@pochtamt.ru',	'',	CONV('1', 2, 10) + 0,	1);

DROP TABLE IF EXISTS `user_dialog`;
CREATE TABLE `user_dialog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dialog_id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `new` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user_dialog` (`id`, `dialog_id`, `login`, `new`) VALUES
(1,	4,	'1',	CONV('0', 2, 10) + 0),
(2,	4,	'2',	CONV('1', 2, 10) + 0),
(3,	5,	'1',	CONV('0', 2, 10) + 0),
(4,	5,	'9',	CONV('1', 2, 10) + 0),
(5,	6,	'1',	CONV('0', 2, 10) + 0),
(6,	6,	'123',	CONV('1', 2, 10) + 0),
(7,	7,	'1',	CONV('0', 2, 10) + 0),
(8,	7,	'2',	CONV('1', 2, 10) + 0),
(11,	9,	'1',	CONV('0', 2, 10) + 0),
(12,	9,	'123',	CONV('1', 2, 10) + 0),
(14,	10,	'2',	CONV('1', 2, 10) + 0),
(16,	11,	'1',	CONV('0', 2, 10) + 0),
(18,	12,	'111',	CONV('1', 2, 10) + 0),
(21,	14,	'1',	CONV('0', 2, 10) + 0),
(22,	14,	'2',	CONV('1', 2, 10) + 0),
(23,	15,	'44',	CONV('0', 2, 10) + 0),
(24,	15,	'1',	CONV('0', 2, 10) + 0),
(25,	16,	'55',	CONV('0', 2, 10) + 0),
(26,	16,	'123',	CONV('1', 2, 10) + 0),
(27,	17,	'77',	CONV('1', 2, 10) + 0),
(28,	17,	'1',	CONV('0', 2, 10) + 0);

-- 2016-02-17 19:47:47
