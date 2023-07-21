package com.skilldistillery.facebakawk.entities;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "event_currency")
public class EventCurrency {

	@EmbeddedId
	private EventCurrencyId id;
	
	private int amount;

	public EventCurrency() {
		
	}
	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public EventCurrencyId getId() {
		return id;
	}
	public void setId(EventCurrencyId id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "EventCurrency [id=" + id + ", amount=" + amount + "]";
	}
	
 
}
