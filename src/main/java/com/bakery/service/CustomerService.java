package com.bakery.service;

import com.bakery.model.Customer;
import java.io.*;
import java.util.*;

public class CustomerService {
    private static final String FILE_PATH = "data/customers.txt";

    public void addCustomer(Customer customer) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(customer.toFileString());
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<Customer> getAllCustomers() {
        List<Customer> customers = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;

            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                if (data.length == 4) {
                    customers.add(new Customer(data[0], data[1], data[2], data[3]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return customers;
    }
}
