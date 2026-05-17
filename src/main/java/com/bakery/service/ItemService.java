package com.bakery.service;

import com.bakery.model.BakeryItem;
import java.io.*;
import java.util.*;

public class ItemService {

    private static final String FILE_PATH = "C:/Users/akash/Documents/BakeryOrderSystem/data/items.txt";

    public void addItem(BakeryItem item) {

        try (BufferedWriter writer =
                     new BufferedWriter(new FileWriter(FILE_PATH, true))) {

            writer.write(item.toFileString());
            writer.newLine();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<BakeryItem> getAllItems() {

        List<BakeryItem> items = new ArrayList<>();

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
                        items.add(new BakeryItem(
                                data[0].trim(),
                                data[1].trim(),
                                data[2].trim(),
                                Double.parseDouble(data[3].trim()),
                                Integer.parseInt(data[4].trim())
                        ));
                    } catch (NumberFormatException ignored) {
                        // Skip malformed numeric rows.
                    }
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return items;
    }

    public void deleteItem(String itemId) {

        List<BakeryItem> items = getAllItems();

        try (BufferedWriter writer =
                     new BufferedWriter(new FileWriter(FILE_PATH))) {

            for (BakeryItem item : items) {

                if (!item.getItemId().equals(itemId)) {

                    writer.write(item.toFileString());
                    writer.newLine();
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public BakeryItem getItemById(String itemId) {

        for (BakeryItem item : getAllItems()) {

            if (item.getItemId().equals(itemId)) {
                return item;
            }
        }

        return null;
    }

    public void updateItem(BakeryItem updatedItem) {

        List<BakeryItem> items = getAllItems();

        try (BufferedWriter writer =
                     new BufferedWriter(new FileWriter(FILE_PATH))) {

            for (BakeryItem item : items) {

                if (item.getItemId().equals(updatedItem.getItemId())) {

                    writer.write(updatedItem.toFileString());

                } else {

                    writer.write(item.toFileString());
                }

                writer.newLine();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<BakeryItem> searchItems(String keyword) {
        List<BakeryItem> result = new ArrayList<>();

        for (BakeryItem item : getAllItems()) {
            if (item.getItemId().toLowerCase().contains(keyword.toLowerCase()) ||
                item.getName().toLowerCase().contains(keyword.toLowerCase()) ||
                item.getCategory().toLowerCase().contains(keyword.toLowerCase())) {

                result.add(item);
            }
        }

        return result;
    }
}
