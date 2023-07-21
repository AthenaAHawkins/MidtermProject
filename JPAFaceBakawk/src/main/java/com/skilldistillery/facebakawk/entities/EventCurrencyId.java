package com.skilldistillery.facebakawk.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class EventCurrencyId implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Column(name="currency_id")
	private int currencyId;
	
	@Column(name="event_id")
	private int eventId;
	
	public EventCurrencyId() {}

	public EventCurrencyId(int currencyId, int eventId) {
		super();
		this.currencyId = currencyId;
		this.eventId = eventId;
	}

	public int getCurrencyId() {
		return currencyId;
	}

	public void setCurrencyId(int currencyId) {
		this.currencyId = currencyId;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(currencyId, eventId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		EventCurrencyId other = (EventCurrencyId) obj;
		return currencyId == other.currencyId && eventId == other.eventId;
	}

}
