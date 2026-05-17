package com.bakery.service;

import com.bakery.model.Order;
import java.io.*;
import java.util.*;

public class OrderService {

    private static final String FILE_PATH =  "C:/Users/akash/Documents/BakeryOrderSystem/data/orders.txt";

    public void addOrder(Order order) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(order.toFileString());
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;

            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) {
                    continue;
                }

                String[] data = line.split(",");

                if (data.length == 5) {
                    try {
                        orders.add(new Order(
                                data[0].trim(),
                                data[1].trim(),
                                data[2].trim(),
                                Integer.parseInt(data[3].trim()),
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

        return orders;
    }

    public Order getOrderById(String orderId) {
        for (Order order : getAllOrders()) {
            if (order.getOrderId().equals(orderId)) {
                return order;
            }
        }
        return null;
    }

    public void updateOrder(Order updatedOrder) {
        List<Order> orders = getAllOrders();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Order order : orders) {
                if (order.getOrderId().equals(updatedOrder.getOrderId())) {
                    writer.write(updatedOrder.toFileString());
                } else {
                    writer.write(order.toFileString());
                }
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void deleteOrder(String orderId) {
        List<Order> orders = getAllOrders();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Order order : orders) {
                if (!order.getOrderId().equals(orderId)) {
                    writer.write(order.toFileString());
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<Order> searchOrders(String keyword) {
        List<Order> result = new ArrayList<>();

        for (Order order : getAllOrders()) {
            if (order.getOrderId().toLowerCase().contains(keyword.toLowerCase()) ||
                order.getCustomerId().toLowerCase().contains(keyword.toLowerCase()) ||
                order.getItemId().toLowerCase().contains(keyword.toLowerCase()) ||
                order.getStatus().toLowerCase().contains(keyword.toLowerCase())) {

                result.add(order);
            }
        }

        return result;
    }
}
