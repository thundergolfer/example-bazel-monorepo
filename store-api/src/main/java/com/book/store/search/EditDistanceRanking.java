package com.book.store.search;

import com.book.store.api.models.Book;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class EditDistanceRanking {
    int MAX_EDIT_DISTANCE = 10; // Hacky way to filter out results

    public List<Book> rankByTitle(String query,  List<Book> candidates, int k) {
        TreeMap<Integer, Book> rankedCandidates = new TreeMap<>();
        int candidateEditDist;

        for (Book c : candidates) {
            candidateEditDist = minDistance(
                    query.toLowerCase(),
                    c.getName().toLowerCase()
            );
            if (candidateEditDist <= MAX_EDIT_DISTANCE) rankedCandidates.put(candidateEditDist, c);
        }

        int i = 1;
        List<Book> results = new ArrayList<>();
        for(Map.Entry<Integer,Book> entry : rankedCandidates.entrySet()) {
            results.add(entry.getValue());
            if (i == k) break;
            else i += 1;
        }
        return results;
    }

    private static int minDistance(String a, String b) {
        int[][] dp = new int[a.length() + 1][b.length() + 1];

        for (int i = 0; i <= a.length(); i++) dp[i][0] = i;

        for (int j = 0; j <= b.length(); j++) dp[0][j] = j;

        for (int i = 0; i < a.length(); i++) {
            char c1 = a.charAt(i);
            for (int j = 0; j < b.length(); j++) {
                char c2 = b.charAt(j);

                if (c1 == c2) {
                    dp[i + 1][j + 1] = dp[i][j];
                } else {
                    int replace = dp[i][j] + 1;
                    int insert = dp[i][j + 1] + 1;
                    int delete = dp[i + 1][j] + 1;

                    int min = Math.min(replace, insert);
                    min = Math.min(delete, min);
                    dp[i + 1][j + 1] = min;
                }
            }
        }
        return dp[a.length()][b.length()];
    }
}
