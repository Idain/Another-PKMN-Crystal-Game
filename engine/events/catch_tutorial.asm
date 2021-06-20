CatchTutorial::
; Back up your name to your Mom's name.
	ld hl, wPlayerName
	ld de, wMomsName
	ld bc, NAME_LENGTH
	call CopyBytes
; Copy Dude's name to your name
	ld hl, .Dude
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyBytes

	call .LoadDudeData

	xor a
	ldh [hJoyDown], a
	ldh [hJoyPressed], a
	ld a, [wOptions]
	push af
	and $ff ^ TEXT_DELAY_MASK
	add TEXT_DELAY_MED
	ld [wOptions], a
	ld hl, .AutoInput
	ld a, BANK(.AutoInput)
	call StartAutoInput
	callfar StartBattle
	call StopAutoInput
	pop af

	ld [wOptions], a
	ld hl, wMomsName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	jp CopyBytes

.LoadDudeData:
	ld a, 1
	ld hl, wDudeNumItems
	ld [hl], a
	inc hl
	ld [hl], POTION
	inc hl
	ld [hl], a
	inc hl
	ld [hl], -1

	ld hl, wDudeNumKeyItems
	ld [hl], 0
	inc hl
	ld [hl], -1
	
	ld hl, wDudeNumBalls
	ld [hli], a
	ld a, POKE_BALL
	ld [hli], a
	ld [hli], a
	ld [hl], -1
	ret

.Dude:
	db "Dude@"

.AutoInput:
	db NO_INPUT, $ff ; end
