#define FLASH bootloader
#define MC_AT kp AT
#define MC_DQT kp DQT
#define MC_PPE kp PIPE
#define MC_TLD kp TILDE
#define MC_PND kp LA(N3)
#define MC_PWD kp LA(LEFT)
#define MC_NWD kp LA(RIGHT)
#define MC_ZIN kp LG(PLUS)
#define MC_ZOT kp LG(MINUS)
#define MC_PSC kp LS(LG(LC(N4)))
#define EMOJI kp GLOBE
#define MC_CUT kp LG(X)
#define MC_CPY hm_l LGUI LG(C)
#define MC_PST hm_l LSHIFT LG(V)
#define MC_UND kp LG(Z)
#define MC_HME kp LG(LEFT)
#define MC_END kp LG(RIGHT)

#define MC_A hm_l LCTRL A
#define MC_S hm_l LALT S
#define MC_D hm_l LGUI D
#define MC_F hm_l LSHIFT F
#define MC_J hm_r LSHIFT J
#define MC_K hm_r LGUI K
#define MC_L hm_r LALT L
#define MC_SEMI hm_r LCTRL SEMI

#define MEH(key) kp LS(LC(LA(key)))
#define HYP(key) kp LS(LC(LA(LG(key))))
