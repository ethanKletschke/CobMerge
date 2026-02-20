       IDENTIFICATION DIVISION.
       PROGRAM-ID. CobMerge.

      /File definitions
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT 1st-Input-File ASSIGN TO "Input1.csv"
           ORGANISATION LINE SEQUENTIAL
           ACCESS MODE SEQUENTIAL.

           SELECT 2nd-Input-File ASSIGN TO "Input2.csv"
           ORGANISATION LINE SEQUENTIAL
           ACCESS MODE SEQUENTIAL.

           SELECT 3rd-Input-File ASSIGN TO "Input3.csv"
           ORGANISATION LINE SEQUENTIAL
           ACCESS MODE SEQUENTIAL.

      *    Merge and Sort work files
           SELECT Merge-File ASSIGN TO "Merge.csv".
           SELECT Sort-File ASSIGN TO "Sort.csv".

           SELECT Output-File ASSIGN TO "Output.csv"
           ORGANISATION LINE SEQUENTIAL
           ACCESS MODE SEQUENTIAL.

      /File record definitions
       DATA DIVISION.
       FILE SECTION.
      *    First Input file's record description
       FD  1st-Input-File.
           01 1st-Input-Rec.
              05 1IF-User-Num PIC 999.
              05 FILLER PIC X VALUE ",".
              05 1IF-User-ID PIC X(6).
              05 FILLER PIC X VALUE ",".
              05 1IF-User-Name PIC X(25).

      *    Second input file's record description
       FD  2nd-Input-File.
           01 2nd-Input-Rec.
              05 2IF-User-Num PIC 999.
              05 FILLER PIC X VALUE ",".
              05 2IF-User-ID PIC X(6).
              05 FILLER PIC X VALUE ",".
              05 2IF-User-Name PIC X(25).

      *    Third input file's record description
       FD  3rd-Input-File.
           01 3rd-Input-Rec.
              05 3IF-User-Num PIC 999.
              05 FILLER PIC X VALUE ",".
              05 3IF-User-ID PIC X(6).
              05 FILLER PIC X VALUE ",".
              05 3IF-User-Name PIC X(25).

      *    Temporary sort work file
       SD  Sort-File.
           01 Sort-Rec.
              05 SRT-User-Num PIC 999.
              05 FILLER PIC X VALUE ",".
              05 SRT-User-ID PIC X(6).
              05 FILLER PIC X VALUE ",".
              05 SRT-User-Name PIC X(25).

      *    Temporary merge work file
       SD  Merge-File.
           01 Merge-Rec.
              05 MRG-User-Num PIC 999.
              05 FILLER PIC X VALUE ",".
              05 MRG-User-ID PIC X(6).
              05 FILLER PIC X VALUE ",".
              05 MRG-User-Name PIC X(25).

      *    Output file description
       FD  Output-File.
           01 Output-Rec.
              05 OUT-User-Num PIC 999.
              05 FILLER PIC X VALUE ",".
              05 OUT-User-ID PIC X(6).
              05 FILLER PIC X VALUE ",".
              05 OUT-User-Name PIC X(25).

      /Main Program Logic
       PROCEDURE DIVISION.
           DISPLAY "Sorting 1st Input File. This will overwrite the file
      -    "'s contents. Press enter to continue." WITH NO ADVANCING.
           ACCEPT OMITTED.

           SORT Sort-File
              ON ASCENDING KEY SRT-User-Num
              USING 1st-Input-File
              GIVING 1st-Input-File.

           DISPLAY "Sorting 2nd Input File. Press enter to continue."
               WITH NO ADVANCING.
           ACCEPT OMITTED.

           SORT Sort-File
              ON ASCENDING KEY SRT-User-Num
              USING 2nd-Input-File
              GIVING 2nd-Input-File.

           DISPLAY "Sorting 3rd Input File. Press enter to continue."
              WITH NO ADVANCING.
           ACCEPT OMITTED.

      *    Sort the third input file
           SORT Sort-File
              ON ASCENDING KEY SRT-User-Num
              USING 3rd-Input-File
              GIVING 3rd-Input-File.

      *    Prompt the user to confirm the file merging
           DISPLAY "Press enter to merge the 3 files' contents."
              WITH NO ADVANCING.
           ACCEPT OMITTED.

      *    Merge the 3 sorted input files
           MERGE Merge-File
              ON ASCENDING KEY MRG-User-Num
              USING 1st-Input-File 2nd-Input-File 3rd-Input-File
              GIVING Output-File.

      *    Press Enter to Exit prompt
           DISPLAY "Files merged. Press Enter to Exit." 
              WITH NO ADVANCING.

      *    Close the app
           STOP RUN.

       END PROGRAM CobMerge.
