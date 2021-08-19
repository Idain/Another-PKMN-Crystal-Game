PlaceWaitingText::
	hlcoord 3, 10
	lb bc, 1, 11

	ld a, [wBattleMode]
	and a
	jr z, .notinbattle

	call Textbox
	jr .proceed

.notinbattle
	predef LinkTextboxAtHL

.proceed
	hlcoord 4, 11
	ld de, .Waiting
	call PlaceString
	ld c, 30
	jp DelayFrames

.Waiting:
	db "Waiting...!@"
