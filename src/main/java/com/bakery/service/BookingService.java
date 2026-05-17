package com.bakery.service;

import com.bakery.model.CustomCakeBooking;
import java.io.*;
import java.util.*;

public class BookingService {

    private static final String FILE_PATH = "C:/Users/akash/Documents/BakeryOrderSystem/data/bookings.txt";

    public void addBooking(CustomCakeBooking booking) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(booking.toFileString());
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<CustomCakeBooking> getAllBookings() {
        List<CustomCakeBooking> bookings = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;

            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) {
                    continue;
                }

                String[] data = line.split(",");

                if (data.length == 7) {
                    bookings.add(new CustomCakeBooking(
                            data[0].trim(),
                            data[1].trim(),
                            data[2].trim(),
                            data[3].trim(),
                            data[4].trim(),
                            data[5].trim(),
                            data[6].trim()
                    ));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return bookings;
    }

    public CustomCakeBooking getBookingById(String bookingId) {
        for (CustomCakeBooking booking : getAllBookings()) {
            if (booking.getBookingId().equals(bookingId)) {
                return booking;
            }
        }
        return null;
    }

    public void updateBooking(CustomCakeBooking updatedBooking) {
        List<CustomCakeBooking> bookings = getAllBookings();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (CustomCakeBooking booking : bookings) {
                if (booking.getBookingId().equals(updatedBooking.getBookingId())) {
                    writer.write(updatedBooking.toFileString());
                } else {
                    writer.write(booking.toFileString());
                }
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void deleteBooking(String bookingId) {
        List<CustomCakeBooking> bookings = getAllBookings();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (CustomCakeBooking booking : bookings) {
                if (!booking.getBookingId().equals(bookingId)) {
                    writer.write(booking.toFileString());
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
