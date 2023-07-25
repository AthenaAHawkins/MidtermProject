package com.skilldistillery.facebakawk.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.facebakawk.entities.Address;
@Service
@Transactional
public class AddressDAOImpl implements AddressDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Address> findAll() {
		String jpql = "SELECT address FROM Address address";
		return em.createQuery(jpql, Address.class).getResultList();
	}

	@Override
	public Address findAddressById(int addressId) {
		Address a = em.find(Address.class, addressId);
		return a;
	}

	@Override
	public Address create(Address address) {
		em.persist(address);
		em.flush();
		return address;

	}

	@Override
	public Address updateAddress(int addressId, Address address) {
		Address a = em.find(Address.class, addressId);
		a.setCity(address.getCity());
		a.setCountry(address.getCountry());
		a.setEvents(address.getEvents());
		a.setPhoneNumber(address.getPhoneNumber());
		a.setState(address.getState());
		a.setZipCode(address.getZipCode());
		a.setStreet(address.getStreet());
		em.merge(a);
		em.flush();
		return a;
	}
	@Override
	public boolean deleteById(int addressId) {

		boolean success = false;
		Address a = em.find(Address.class, addressId);

		if (a == null) {
			return false;
		}

		if (!em.contains(a)) {
			success = true;
		}

		em.remove(a); // performs the delete on the managed entity
		em.flush();

		return success;
	}

}
