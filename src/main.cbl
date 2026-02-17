       IDENTIFICATION DIVISION.
       PROGRAM-ID. CobMerge.

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

           SELECT Merge-File ASSIGN TO "Merge.csv".

           SELECT Out-File ASSIGN TO "Output.csv
           ORGANISATION LINE SEQUENTIAL
           ACCESS MODE SEQUENTIAL.

       PROCEDURE DIVISION.
           DISPLAY "CobMerge v0.0.1".
           STOP RUN.

       END PROGRAM CobMerge.
