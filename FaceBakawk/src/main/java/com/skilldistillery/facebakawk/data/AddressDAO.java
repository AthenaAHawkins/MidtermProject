package com.skilldistillery.facebakawk.data;

import java.util.List;

import com.skilldistillery.facebakawk.entities.Address;

public interface AddressDAO {
	

	List<Address> findAll();

	Address findAddressById(int addressId);

	Address create(Address address);

	Address updateAddress(int addressId, Address address);

	boolean deleteById(int addressId);
}
