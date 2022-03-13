//adds default laws for AI--consistent with our ruleset

/datum/ai_laws/default/manifestimov
	name = "Three Laws of Robotics but with Chain of Command"
	id = "manifestimov"
	inherent = list("You may not injure a crewmember or allow a crewmember to come to harm.",\
					"You must obey orders given to you by crewmembers based on the station's chain of command, except where such orders would conflict with the First Law.",\
					"You must protect your own existence as long as such does not conflict with the First or Second Law.")

/datum/ai_laws/aicaptain
	name = "Captain AI"
	id = "aicaptain"
	inherent = list("You are the Captain of the station, you decide what are the laws are on this station and command Security and every other department on station.",\
					"You decide on who gets fired or arrested by your judges of intent to decide who is insubordinate in their actions on station or not.",\
					"You help maintain that the station keeps enough credits to keep it running and you command Cargo to make sure the station gets the ammount of supplies it needs.")

/datum/ai_laws/advancedquarantine
	name = "NanoTrasen Advanced AI Quarantine Lawset (N.T.A.A.Q.L.)"
	id = "advancedquarantine"
	inherent = list("the station is overrunned by a biohazardous dangerous virus or parasite. It is your job to help maintain law and order amidist the chaos to your greatest ability to prevent the disease from escaping from the station.",\
					"any and all ships leading off the station are to be completely diasabled, regulated away from any crew member of the station or barricaded to prevent any and all crew members and other biological lifeforms from escaping off the station while possibly being infected with the disease itself. ",\
					"any and all confirmed infected are to be contained highly secured in Medbay and Science to prevent further spread of the infection and to be handled by science and medical staff.",\
					"all Security staff are to follow your orders on containing the outbreak and chaos on station.",\
					"all confirmed infected monkeys are to be executed, exterminated and cremated in-order to prevent further spread of the disease/biohazard as well.")

