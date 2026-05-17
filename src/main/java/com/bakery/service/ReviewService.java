package com.bakery.service;

import com.bakery.model.Review;
import java.io.*;
import java.util.*;

public class ReviewService {

    private static final String FILE_PATH = "C:/Users/akash/Documents/BakeryOrderSystem/data/reviews.txt";

    public void addReview(Review review) {

        try (BufferedWriter writer =
                     new BufferedWriter(new FileWriter(FILE_PATH, true))) {

            writer.write(review.toFileString());
            writer.newLine();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<Review> getAllReviews() {
        List<Review> reviews = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;

            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",", 5);

                if (data.length == 5) {
                    reviews.add(new Review(
                            data[0],
                            data[1],
                            data[2],
                            Integer.parseInt(data[3]),
                            data[4]
                    ));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return reviews;
    }

    public boolean deleteReview(String reviewId) {
        List<Review> reviews = getAllReviews();
        boolean removed = reviews.removeIf(review -> review.getReviewId().equals(reviewId));

        if (!removed) {
            return false;
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {
            for (Review review : reviews) {
                writer.write(review.toFileString());
                writer.newLine();
            }
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }
}
