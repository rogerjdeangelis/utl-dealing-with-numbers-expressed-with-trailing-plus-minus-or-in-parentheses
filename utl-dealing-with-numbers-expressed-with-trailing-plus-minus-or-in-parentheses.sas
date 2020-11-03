Dealing with numbers expressed with trailing plus minus or IN parentheses                                                                     
                                                                                                                                              
OBSERVATIONS                                                                                                                                  
============                                                                                                                                  
                                                                                                                                              
     SAS provides a TRAILSIGN INFORMAT                                                                                                        
     SAS does NOT provide a TRAILSIGN FORMAT                                                                                                  
                                                                                                                                              
     SAS providea a NRGPAREN FORMA                                                                                                            
     SAS does NOT provide a MEGPAREN INFORMAT                                                                                                 
                                                                                                                                              
                                                                                                                                              
github                                                                                                                                        
https://cutt.ly/rgSRykq                                                                                                                       
https://github.com/rogerjdeangelis/utl-dealing-with-numbers-expressed-with-trailing-plus-minus-or-in-parentheses                              
                                                                                                                                              
                                                                                                                                              
The trailsgn informat can handle both decimals and commas and can be up to 32 characters long.                                                
However, there is no trailsgn format.                                                                                                         
                                                                                                                                              
You can create a trailing sign format using picture formats.                                                                                  
                                                                                                                                              
SAS  provides only a negparen format.                                                                                                         
                                                                                                                                              
SAS Forum                                                                                                                                     
https://cutt.ly/NgSE8rB                                                                                                                       
https://communities.sas.com/t5/SAS-Programming/IMPORT-EXCEL-file-with-minus-sign-in-numeric-value/m-p/694791                                  
                                                                                                                                              
EXAMPLE                                                                                                                                       
=======                                                                                                                                       
                                                                                                                                              
* SUBSTITUTE FOR MISSING TRAILSIGN FORMAT;                                                                                                    
proc format;                                                                                                                                  
picture endsign                                                                                                                               
low-<0 ="0000000000.00-"                                                                                                                      
0-high ="0000000000.00+";                                                                                                                     
run;                                                                                                                                          
                                                                                                                                              
data have;                                                                                                                                    
                                                                                                                                              
 retain number_string;                                                                                                                        
                                                                                                                                              
 input informat_trailsgn_cards TRAILSGN. number_string$;                                                                                      
                                                                                                                                              
 informat_trailsgn_input_statemnt=input(number_string,trailsgn.);                                                                             
 format_using_picture=put(informat_trailsgn_cards,endsign.);                                                                                  
                                                                                                                                              
 format_negparen12=put(informat_trailsgn_cards,negparen12.2);                                                                                 
                                                                                                                                              
cards4;                                                                                                                                       
1.11+ 1.11+                                                                                                                                   
22222- 222-                                                                                                                                   
378.9- 378.9-                                                                                                                                 
5,679- 5,679-                                                                                                                                 
4875+ 4875+                                                                                                                                   
;;;;                                                                                                                                          
run;quit;                                                                                                                                     
                                                                                                                                              
                                                                                                                                              
HAVE total obs=5                                                                                                                              
                                                                                                                                              
             INFORMAT_       INFORMAT_       FORMAT_                                                                                          
  NUMBER_    TRAILSGN_       TRAILSGN_       USING_        FORMAT_                                                                            
  STRING       CARDS      INPUT_STATEMNT     PICTURE     NEGPAREN12                                                                           
                                                                                                                                              
  1.11+           1.11           1.11           1.11+          1.11                                                                           
  222-       -22222.00        -222.00       22222.00-    (22,222.00)                                                                          
  378.9-       -378.90        -378.90         378.90-       (378.90)                                                                          
  5,679-      -5679.00       -5679.00        5679.00-     (5,679.00)                                                                          
  4875+        4875.00        4875.00        4875.00+      4,875.00                                                                           
                                                                                                                                              
                                                                                                                                              
                                                                                                                                              
                                                                                                                                              
