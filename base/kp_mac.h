#define MC_PND kp HASH
#define MC_AT  kp AT
#define MC_DQT kp DQT
#define MC_HSH kp LA(N3)
#define MC_PPE kp PIPE
#define MC_TLD kp TILDE
#define MC_PWD kp LA(LEFT)
#define MC_NWD kp LA(RIGHT)
#define MC_ZIN kp LG(PLUS)
#define MC_ZOT kp LG(MINUS)
#define MC_PSC kp LS(LG(LC(N4)))
#define EMOJI  kp LG(LA(N5))
#define MC_CUT kp LG(X)
#define MC_CPY kp LG(C)
#define MC_PST hm LSHIFT LG(V)
#define MC_UND kp LG(Z)
#define MC_HME kp LG(LEFT)
#define MC_END kp LG(RIGHT)

#define MC_A hm LCTRL A
#define MC_S hm LALT S
#define MC_D hm LGUI D
#define MC_F hm LSHIFT F
#define MC_J hm LSHIFT J
#define MC_K hm LGUI K
#define MC_L hm LALT L
#define MC_SEMI hm LCTRL SEMI


#define MEH(key) kp LS(LC(LA(key)))
#define HYP(key) kp LS(LC(LA(LG(key))))

#define YB_MX HYP(X)
#define YB_MY HYP(Y)
#define YB_WP HYP(P)
#define YB_WN HYP(N)

#define YB_FP MEH(P)
#define YB_FN MEH(N)
#define YB_FL MEH(H)
#define YB_FD MEH(J)
#define YB_FU MEH(K)
#define YB_FR MEH(L)

#define YB_CC MEH(C)
#define YB_CF MEH(F)
#define YB_FS kp LA(F)

#define YB_RL MEH(LEFT)
#define YB_RD MEH(DOWN)
#define YB_RU MEH(UP)
#define YB_RR MEH(RIGHT)

