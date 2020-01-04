package com.bookstore.layoutsolver;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.nio.charset.StandardCharsets;

/**
 * Tests different numbers of arguments to main().
 *
 * <p>With an empty args array, {@link Greeter} should print "Hello world". If there are one or more
 * args, {@link Greeter} should print "Hello &lt;arg[0]&gt;".</p>
 */
public class TestStoreLayoutSolver {

    @Test
    public void testNoArgument() throws Exception {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        StoreLayoutSolver.out = new PrintStream(out);
        StoreLayoutSolver.main();
        assertEquals("Hello World", new String(out.toByteArray(), StandardCharsets.UTF_8).trim());
    }
}