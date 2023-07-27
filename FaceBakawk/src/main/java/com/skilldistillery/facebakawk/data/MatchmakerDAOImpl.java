package com.skilldistillery.facebakawk.data;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.facebakawk.entities.Chicken;

@Service
@Transactional
public class MatchmakerDAOImpl implements MatchmakerDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<List<Chicken>> findMatches(List<Chicken> usersChickens) {
		System.out.println("\n\n\n\n\n\nList of USER CHICKENS " + usersChickens);
		Chicken lookingForLoveOne = null;
		Chicken lookingForLoveTwo = null;
		List<Chicken> chickensWhoVibe = new ArrayList<>();
		List<List<Chicken>> inLoveTBD = new ArrayList<>();
		String jpql = "SELECT chicken FROM Chicken chicken";
		List<Chicken> allChickens = em.createQuery(jpql, Chicken.class).getResultList();
		System.out.println("\n\n\n\n\n\nList of ALLCHICKENS " + allChickens);

		for (Chicken userChicken : usersChickens) {

			for (Chicken oneOfMany : allChickens) {

				if (compatibilityLevel(oneOfMany, userChicken) > 3) {
					if (oneOfMany.getId() != userChicken.getId()) {

						lookingForLoveOne = oneOfMany;
						lookingForLoveTwo = userChicken;
						if (!chickensWhoVibe.contains(lookingForLoveOne)
								&& !chickensWhoVibe.contains(lookingForLoveTwo)) {
							chickensWhoVibe.add(lookingForLoveOne);
							chickensWhoVibe.add(lookingForLoveTwo);
							System.out.println(
									"\n\n\n\n\n\n\n\nChickens who vibe, before added to list list" + chickensWhoVibe);
							if (!inLoveTBD.contains(chickensWhoVibe)) {
								inLoveTBD.add(chickensWhoVibe);
								chickensWhoVibe = new ArrayList<>();
							}
						}
					}
				}
			}
		}
		System.out.println("\n\n\n\n\nList of list of chickens " + inLoveTBD);
		System.out.println("\n\n\n\n\nSize of list of chickens " + inLoveTBD.size());
		return inLoveTBD;
	}

	@Override
	public int compatibilityLevel(Chicken chickOne, Chicken chickTwo) {
		int compatibilityLevel = 0;
		String signOne = getSign(chickOne.getBirthday());
		String signTwo = getSign(chickTwo.getBirthday());

		if (sharedKeywords(chickOne.getMusicTaste(), chickTwo.getMusicTaste())) {
			compatibilityLevel++;
		}
		if (chickOne.getBreed().equals(chickTwo.getBreed())) {
			compatibilityLevel++;
		}
		if (chickOne.isWantsChicks() == chickTwo.isWantsChicks()) {
			compatibilityLevel = compatibilityLevel + 2;
		}
		compatibilityLevel = compatibilityLevel + signCompatibility(signOne, signTwo);

		return compatibilityLevel;
	}

	@Override
	public String getSign(LocalDateTime birthday) {
		int day = birthday.getDayOfMonth();
		int month = birthday.getMonthValue();

		if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
			return "Aries";
		} else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
			return "Taurus";
		} else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
			return "Gemini";
		} else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
			return "Cancer";
		} else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
			return "Leo";
		} else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
			return "Virgo";
		} else if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
			return "Libra";
		} else if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) {
			return "Scorpio";
		} else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
			return "Sagittarius";
		} else if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) {
			return "Capricorn";
		} else if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
			return "Aquarius";
		} else {
			return "Pisces";
		}
	}

	@Override
	public int signCompatibility(String sign, String otherSign) {
		int compatibilityLevel = 0;

		// Compare astrological signs and calculate compatibility
		if (sign.equalsIgnoreCase(otherSign)) {
			compatibilityLevel = 3; // Highest compatibility level
		} else if (areComplementary(sign, otherSign)) {
			compatibilityLevel = 2;
		} else {
			compatibilityLevel = 1; // Lowest compatibility level
		}

		return compatibilityLevel;
	}

	@Override
	public boolean areComplementary(String sign, String otherSign) {
		// Define complementary sign pairs
		String[] complementaryPairs = { "Aries-Libra", "Taurus-Scorpio", "Gemini-Sagittarius", "Cancer-Capricorn",
				"Leo-Aquarius", "Virgo-Pisces" };

		// Check if the pair is complementary
		String pair = sign + "-" + otherSign;
		for (String complementaryPair : complementaryPairs) {
			if (complementaryPair.equalsIgnoreCase(pair)) {
				return true;
			}
		}

		return false;
	}

	@Override
	public boolean sharedKeywords(String string1, String string2) {
		// Split the strings into individual words
		String[] words1 = string1.split("\\s+");
		String[] words2 = string2.split("\\s+");

		// Compare the words for any shared keywords
		for (String word1 : words1) {
			for (String word2 : words2) {
				if (word1.equalsIgnoreCase(word2)) {
					return true; // Found a shared keyword
				}
			}
		}

		return false; // No shared keywords found
	}

}
