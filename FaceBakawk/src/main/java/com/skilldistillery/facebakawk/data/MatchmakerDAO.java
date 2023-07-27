package com.skilldistillery.facebakawk.data;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import com.skilldistillery.facebakawk.entities.Chicken;

public interface MatchmakerDAO {

	List<List<Chicken>> findMatches(List<Chicken> usersChickens);

	int compatibilityLevel(Chicken chickOne, Chicken chickTwo);

	String getSign(LocalDateTime birthday);

	int signCompatibility(String sign, String otherSign);

	boolean areComplementary(String sign, String otherSign);

	boolean sharedKeywords(String string1, String string2);
}
