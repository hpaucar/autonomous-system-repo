(define (problem uberPoolProb)
	(:domain uberPool)
	(:objects
		pump1 - location
		micasa - location
		kings - location
		lse - location
		imperial - location
		ucl - location
		queenmarry - location
		xoyo - location
		minofsound - location
		tigertiger - location
		coco - location
		thevault - location
		nishant - driver
		petko - customer
		britton - customer
		sophia - customer
		johncena - customer
		kevinbacon - customer
		time1 - time
		bmw - uber
	)
	(:init
		(at nishant micasa)
		(at petko kcl)
		(at britton lse)
		(at sophia ucl)
		(at johncena imperial)
		(at kevinbacon queenmarry)
		(at uber micasa)
		(time-not-running time)

		(link micasa kcl)
		(link kcl micasa)
		(link micasa ucl)
		(link ucl micasa)
		(link micasa thevault)
		(link thevault micasa)
		(link micasa imperial)
		(link imperial micasa)
		(link imperial xoyo)
		(link xoyo imperial)
		(link imperial queenmarry)
		(link queenmarry imperial)
		(link imperial minofsound)
		(link minofsound imperial)
		(link queenmarry minofsound)
		(link minofsound queenmarry)
		(link queenmarry lse)
		(link lse queenmarry)
		(link lse thevault)
		(link thevault lse)
		(link lse pump1)
		(link pump1 lse)
		(link pump1 ucl)
		(link ucl pump1)
		(link ucl coco)
		(link coco ucl)
		(link kcl tigertiger)
		(link tigertiger kcl)
		(link tigertiger thevault)
		(link thevault tigertiger)
		(link xoyo coco)
		(link coco xoyo)

		(= (distance micasa kcl) 1)
		(= (distance kcl micasa) 1)
		(= (distance micasa ucl) 1)
		(= (distance ucl micasa) 1)
		(= (distance micasa thevault) 1)
		(= (distance thevault micasa) 1)
		(= (distance micasa imperial) 1)
		(= (distance imperial micasa) 1)
		(= (distance imperial xoyo) 1)
		(= (distance xoyo imperial) 1)
		(= (distance imperial queenmarry) 1)
		(= (distance queenmarry imperial) 1)
		(= (distance imperial minofsound) 1)
		(= (distance minofsound imperial) 1)
		(= (distance queenmarry minofsound) 1)
		(= (distance minofsound queenmarry) 1)
		(= (distance queenmarry lse) 1)
		(= (distance lse queenmarry) 1)
		(= (distance thevault lse) 1)
		(= (distance lse thevault) 1)
		(= (distance pump1 lse) 1)
		(= (distance lse pump1) 1)
		(= (distance pump1 ucl) 1)
		(= (distance ucl pump1) 1)
		(= (distance ucl coco) 1)
		(= (distance coco ucl) 1)
		(= (distance kcl tigertiger) 1)
		(= (distance tigertiger kcl) 1)
		(= (distance tigertiger thevault) 1)
		(= (distance thevault tigertiger) 1)
		(= (distance xoyo coco) 1)
		(= (distance coco xoyo) 1)
		(= (time) 0)
		(= (time-surge) 1)
		(= (fuel-level bmw) 100)
		(= (customer-count) 0)
		(= (velocity bmw) 0.5)
	)
)