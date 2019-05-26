package com.fruitstore.layoutsolver;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * StoreLayoutSolver currently attempts to optimise the placement of different
 * kinds of fruit in storefront trays according to the expected revenue per-item
 * of each fruit type.
 * <p>
 * Our hypothetical fruit-store can then make more money 😊.
 */
public class StoreLayoutSolver {
    static PrintStream out = System.out;

    private static List<StockTray> solve(
            Map<String, Integer> stockCounts,
            Map<String, Float> expectedRevenuePerFruit,
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
     * the size of the items. eg. If it can hold X watermelons it can hold X apples, even
     * though watermelons are at least 15-20 times the volume on an apple.
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