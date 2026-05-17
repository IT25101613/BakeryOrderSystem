package com.bakery.service;

import com.bakery.model.Payment;
import java.io.*;
import java.util.*;

public class PaymentService {

    private static final String FILE_PATH = "data/payments.txt";

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

                String[] data = line.split(",");

                if (data.length == 5) {

                    payments.add(new Payment(
                            data[0],
                            data[1],
                            Double.parseDouble(data[2]),
                            data[3],
                            data[4]
                    ));
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
