package com.cjburkey.frontlang;

import java.io.PrintStream;
import java.io.StringReader;

public class FrontLang {
    
    private static final PrintStream OUT = System.out;
    private static final PrintStream ERR = System.err;
    private static FrontLangParser parser;
    
    public static void main(String[] args) {
        try {
            OUT.println("Parsing...");
            OUT.println();
            
            parser = new FrontLangParser(new StringReader("(((5+((3*343)/2))+(34*22))+(383*2)/((2**5)//3))+(-5)"));   // TODO: SWITCH "StringReader" WITH SOMETHING MORE EXPANDABLE
            parser.parse();
            
            OUT.println();
            OUT.println("Parsed.");
        } catch (Exception e) {
            ERR.println("A fatal error occurred while trying to run the FrontLang interpreter");
            e.printStackTrace(ERR);
        }
    }
    
}