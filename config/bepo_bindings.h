/* BINDINGS FOR BÉPO */

#define A_		A
#define B_		Q
#define C_		H
#define D_		I
#define E_		F
#define F_		SLASH
#define G_		COMMA
#define H_		DOT
#define I_		D
#define J_		P
#define K_		B
#define L_		O
#define M_		APOSTROPHE
#define N_		SEMI
#define O_		R
#define P_		E
#define Q_		M
#define R_		L
#define S_		K
#define T_		J
#define U_		S
#define V_		U
#define W_		RBKT
#define X_		C
#define Y_		X
#define Z_		LBKT

#define N0_  LS(N0)
#define N1_  LS(N1)
#define N2_  LS(N2)
#define N3_  LS(N3)
#define N4_  LS(N4)
#define N5_  LS(N5)
#define N6_  LS(N6)
#define N7_  LS(N7)
#define N8_  LS(N8)
#define N9_  LS(N9)

#define AGRV_	Z
#define EACT_	W
#define EGRV_	T
#define CCED_	BACKSLASH

#define ACUT_	RA(EACT_)
#define GRAV_	RA(EGRV_)
#define CFLX_	Y
#define TILD_	RA(N_)
#define OE_		RA(O_)

#define COMM_	G
#define DOT_	V
#define SEMI_	LS(COMM_)
#define COLN_	LS(DOT_)

#define APST_	RA(COMM_)
#define APSC_	N // (unused) inverted comma ’
#define QUOT_	N1
#define QMRK_	LS(APSC_)
#define EXCL_	LS(CFLX_)
#define DLLR_	GRAVE
#define AMPR_	RA(P_)
#define MDSH_	RA(N8)
#define NDSH_	RA(N1)
#define AT_		N6
#define PIPE_	RA(B_)

#define AE_		RA(A_)
#define TRMA_	RA(I_)
#define EURO_	RA(E_)
#define BSLA_	RA(AGRV_)
#define ULIN_	RA(SPACE)

#define PLUS_	N7
#define MIN_	N8
#define STAR_	N0
#define FSLA_	N9
#define EQUL_	MINUS
#define PCNT_	EQUAL
#define HASH_	LS(DLLR_)

#define LT_		RA(LGLM_)
#define GT_		RA(RGLM_)
#define LPAR_	N4
#define RPAR_	N5
#define LBRK_	RA(LPAR_)
#define RBRK_	RA(RPAR_)
#define LCRL_	RA(Y_)
#define RCRL_	RA(X_)
#define LGLM_	N2
#define RGLM_	N3

#define NBSP_	LS(SPACE)
#define PSBRK	PAUSE_BREAK
