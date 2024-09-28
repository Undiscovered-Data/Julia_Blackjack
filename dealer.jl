#!/usr/bin/env julia

#Winstar
#=
if dealer has black jack play stops
if you tie you keep your bet
if you win with a blackjack you are payed 3 to 2
You can split pairs for up to 4 hands
You only get one card when you split an ace
Doublind down is doubling you bet. You get one additional card
You can buy insurance if the dealer has a top ace
Dealer must draw to 16 and stand on 17
Automatic win for 5 cards
=#


the_deck = [11, 11, 11, 11, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
	    9, 9, 9, 9, 8, 8, 8, 8, 7, 7, 7, 7, 6, 6, 6, 6, 5, 5, 5, 5, 4, 4, 4, 4,
	    3, 3, 3, 3, 2, 2, 2, 2]

function deck_number(decks, the_deck)
	return_deck = Vector()
	for _ in 1:decks
		return_deck = [return_deck; the_deck]
	end
	return_deck
end

final_deck = deck_number(8, the_deck)

cards_dealt = 0
for a in 1:20
    dealer_total = 0
    dealer_hand = Vector()
    for b in 1:2
        the_rand = rand(1:length(final_deck))
        the_card = final_deck[the_rand]
        deleteat!(final_deck, the_rand)
        push!(dealer_hand, the_card)
    end
    dealer_total = sum(dealer_hand)

    if dealer_total == 22
        pop!(dealer_hand)
        push!(dealer_hand, 1)
        dealer_total = sum(dealer_hand)
    end

    while  dealer_total < 17
        println("entered loop ", dealer_total)
        the_rand = rand(1:length(final_deck))
        the_card = final_deck[the_rand]
        deleteat!(final_deck, the_rand)
        push!(dealer_hand, the_card)
        dealer_total = sum(dealer_hand)

        if dealer_total > 21
            if 11 in dealer_hand
                println("removing ace************")
                println(dealer_total)
                the_pos = findfirst(x -> x == 11, dealer_hand)

                deleteat!(dealer_hand, the_pos)
                push!(dealer_hand, 1)
                dealer_total = sum(dealer_hand)
                println(dealer_total)
            else
                println("bust ", dealer_total)
            end
        end
    end
    println("outside ",  dealer_total)
end
