package com.bakery.service;

import com.bakery.model.Customer;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.List;

public class CustomerService {
    private static final String SEPARATOR = ",";
    private static final Path FILE_PATH = Paths.get(System.getProperty("user.dir"), "data", "customers.txt");

    public List<Customer> getAllCustomers() throws IOException {
        ensureFileExists();
        List<String> lines = Files.readAllLines(FILE_PATH, StandardCharsets.UTF_8);
        List<Customer> customers = new ArrayList<>();
        for (String line : lines) {
            if (line == null || line.isBlank()) {
                continue;
            }
            String[] parts = line.split(SEPARATOR, -1);
            if (parts.length >= 4) {
                customers.add(new Customer(parts[0], parts[1], parts[2], parts[3]));
            }
        }
        return customers;
    }

    public void addCustomer(Customer customer) throws IOException {
        ensureFileExists();
        String line = String.join(SEPARATOR,
                sanitize(customer.getId()),
                sanitize(customer.getName()),
                sanitize(customer.getPhone()),
                sanitize(customer.getEmail()));
        Files.writeString(
                FILE_PATH,
                line + System.lineSeparator(),
                StandardCharsets.UTF_8,
                StandardOpenOption.CREATE,
                StandardOpenOption.APPEND
        );
    }

    private static String sanitize(String value) {
        return value == null ? "" : value.replace(SEPARATOR, " ");
    }

    private static void ensureFileExists() throws IOException {
        Files.createDirectories(FILE_PATH.getParent());
        if (!Files.exists(FILE_PATH)) {
            Files.createFile(FILE_PATH);
        }
    }
}
