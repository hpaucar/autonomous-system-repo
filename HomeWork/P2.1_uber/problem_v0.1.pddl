;;simple problem shown at the tutorial. 
;;Excercise 1: try to make a bigger problem
;;Excercise 2: extend the domain definition with costs

(define (problem p1)
	(:domain logistics_vv)
	(:objects
		t1 t2 - truck
		pl - plane
		p - package
		A B C - location
	)
	(:init
		(vehicle-at t1 A)
		(vehicle-at t2 B)
		(vehicle-at pl B)
		(package-at p A)
		(road A B)
		(road B A)
		(corridor B C)
		(corridor C B)

		(= (total-cost) 0)

		(= (travel-cost t1) 3) 
		(= (travel-cost t2) 1) 
		(= (travel-cost pl) 10) 
	)
	(:goal
		(package-at p C)
	)
	(:metric
		minimize (total-cost)
	)
)

;;Exercício 2: Uber autônomo
;;---------------------------
;;Você financiou um carro autônomo para não precisar mais dirigir. Para ajudar a pagar as
;;prestações, você utiliza o carro autônomo como Uber ao invés de deixá-lo na garagem.
;;Para isso, precisa modelar o domínio para tal atividade e testar em instâncias de problema
;;que permitam aferir a robustez do seu modelo. Considere as seguintes características no
;;problema de fazer seu carro autônomo operar como uber.
;;	● O carro sabe como traçar as trajetórias, evitar colisões e respeitar as leis de trânsito.
;;Você não precisa incluir isso no modelo.
;;	● O carro deve estar vazio para carregar um novo passageiro, onde o passageiro e o
;;carro estão num dos nós do grafo abaixo para que uma corrida seja efetuada.
;;	● Considere que seu carro autônomo move-se a uma velocidade média de 80 km/h.
;;	● Um único passageiro é transportado no carro e todos os passageiros requisitando
;;serviços devem ser atendidos.Cada viagem leva do ponto X para o ponto Y.
;;	● Você deve minimizar o seu custo de viagem estimado em R$5,00/Km.
;;	● Para todas as situações não mencionadas acima, assuma hipóteses razoáveis que
;;facilitem sua vida na hora de modelar o problema: carro elétrico com energia ilimitada,
;;não quebra, não é multado, etc.