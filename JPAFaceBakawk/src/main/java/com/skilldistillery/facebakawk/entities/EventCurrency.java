package com.skilldistillery.facebakawk.entities;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "event_currency")
public class EventCurrency {


	private int amount;

	public EventCurrency() {
		
	}
	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "EventCurrency [amount=" + amount + "]";
	}

}
