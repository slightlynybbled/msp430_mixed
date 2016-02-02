	.cdecls C, list, "msp430.h"	; this allows us to use C headers
	
	.text						; locates code in 'text' section
	
	.global add					; declares 'add' as global
	
add:							; this is the function itself
	; if bit 15 is set, then jump to add_neg
	bit.w	#32768, r12
	jc		add_neg
	
add_pos:
	bit.w	#32768, r13
	jc		add_pos_neg
	
add_pos_pos:					; this label isn't declared global, so it is only available locally
	add.w	r13, r12
	jn		add_pos_pos_sat
	ret

add_neg:
	bit.w	#32768, r13
	jc		add_neg_neg
	
add_pos_neg:
	add.w	r13, r12
	ret
	
add_pos_pos_sat:
	mov		#32767, r12
	ret
	
add_neg_neg:
	add.w	r13, r12	
	
	; result should be negative
	bit.w	#32768, r12
	jnc		add_neg_neg_sat
	ret
	
add_neg_neg_sat:
	mov		#32768, r12
	ret
	
	
	
	
	
	.end
	