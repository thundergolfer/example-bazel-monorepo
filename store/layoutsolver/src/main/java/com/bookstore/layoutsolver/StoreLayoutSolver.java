package com.bookstore.layoutsolver;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * StoreLayoutSolver currently attempts to optimise the placement of different
 * kinds of book in storefront trays according to the expected revenue per-item
 * of each book type.
 * <p>
 * Our hypothetical book-store can then make more money 😊.
 */
public class StoreLayoutSolver {
    static PrintStream out = System.out;

    private static List<StockTray> solve(
            Map<String, Integer> stockCounts,
            Map<String, Float> expectedRevenuePerBookCategory,
            List<StockTray> stockTrays
    ) {
        // TODO(Jonathon): Implement this
        return null;
    }

    public static void main(String... args) {
        // TODO(Jonathon): Hook in the #solve function to something that can read in data from .json
        out.println("Hello World");
    }

    /**
     * In this simplified scenario, trays can hold the same number of items regardless of
     * the size of the items. eg. If it can hold X crime books it can hold X textbooks, even
     * though textbooks are at usually 2-4 times the volume of a crime novel.
     */
    private class StockTray {
        private int size;
        private Map<String, Integer> contents;

        public StockTray(int size) {
            this.size = size;
            this.contents = new HashMap<>();
        }

        public int getSize() {
            return this.size;
        }
    }
}