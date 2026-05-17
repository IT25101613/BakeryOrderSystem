package com.bakery.service;

import com.bakery.model.Payment;
import java.io.*;
import java.util.*;

public class PaymentService {

    private static final String FILE_PATH =  "C:/Users/akash/Documents/BakeryOrderSystem/data/payments.txt";


    public void addPayment(Payment payment) {

        try (BufferedWriter writer =
                     new BufferedWriter(new FileWriter(FILE_PATH, true))) {

            writer.write(payment.toFileString());
            writer.newLine();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<Payment> getAllPayments() {

        List<Payment> payments = new ArrayList<>();

        try (BufferedReader reader =
                     new BufferedReader(new FileReader(FILE_PATH))) {

            String line;

            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) {
                    continue;
                }

                String[] data = line.split(",");

                if (data.length == 5) {
                    try {
                        payments.add(new Payment(
                                data[0].trim(),
                                data[1].trim(),
                                Double.parseDouble(data[2].trim()),
                                data[3].trim(),
                                data[4].trim()
                        ));
                    } catch (NumberFormatException ignored) {
                        // Skip malformed numeric rows.
                    }
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return payments;
    }

    public Payment getPaymentById(String paymentId) {

        for (Payment payment : getAllPayments()) {

            if (payment.getPaymentId().equals(paymentId)) {
                return payment;
            }
        }

        return null;
    }

    public void updatePayment(Payment updatedPayment) {

        List<Payment> payments = getAllPayments();

        try (BufferedWriter writer =
                     new BufferedWriter(new FileWriter(FILE_PATH))) {

            for (Payment payment : payments) {

                if (payment.getPaymentId().equals(updatedPayment.getPaymentId())) {

                    writer.write(updatedPayment.toFileString());

                } else {

                    writer.write(payment.toFileString());
                }

                writer.newLine();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void deletePayment(String paymentId) {

        List<Payment> payments = getAllPayments();

        try (BufferedWriter writer =
                     new BufferedWriter(new FileWriter(FILE_PATH))) {

            for (Payment payment : payments) {

                if (!payment.getPaymentId().equals(paymentId)) {

                    writer.write(payment.toFileString());
                    writer.newLine();
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
