# DesktopDeployR_UO-Score
An application based on [UO Score](https://github.com/YuzuRanger/UO_Score), a set of R scripts originally developed by Jeremy Piger.
Leverages the DesktopDeployR framework for deploying self-contained R-based applications to the desktop with a graphical user interface. 

## About the App
### How do I get started?
The compressed folder includes the R script, deployment framework, and all necesssary libraries. 

Download it, extract/unzip the folder, then open the extracted folder. To launch the application, double click on *UOScoreApp.bat*.

The application will check for the requisite libraries, then launch in a new tab on your default browser. You'll see a sidebar with space to upload files into the application and set parameters.

> [!NOTE]
> The application has been tested in Chrome, Firefox, and Edge on Windows.  

### What do I need to enter?
1. A single PDF of the front page of all the UO Score Answer Forms that you wish to process. *Each page of this ﬁle should be a separate form (one sided, not including the back page).* You can use the default scanner DPI.
	- The application will identify:
		- First Name
		- Last Name
		- UO ID Number
		- Form Version Number
		- Answers to multiple choice questions from question 1 to a maximum of 120
	- The application **cannot**:
 		- Read middle names at this time. Middle names (item 3 on the score form) will cause failure to process.
   		- Process the back page (questions 121-300) at this time.
     	- If you are proficient in R and would like to assist with adding these feature, let me know!
2. The number of questions on the exam (1-120).
3. The number of test versions (default is 1).
4. The answer key as a CSV.
   	- Headers should be included. 
	- The first column should contain the question numbers, and subsequent columns contain answers corresponding in order to the form numbers.
	- For example, if you have 10 questions, your 'A' column header would be "Question" and 'A2' through 'A11' would be the numbers 1 to 10 sequentially. Your 'B' column would have the header "Form 1" and 'B2' through 'B11' would contain the corresponding correct letter response (A, B, C, D, or E) for each question. On subsequent columns, you can include additional answer key form versions in order. 

### What will the application produce?
Upon clicking "Process Data," the script will begin processing each page of the PDF to generate a list of answers for each student. Then, it will match answers to the answer key.
The script will update you as it progresses and warn of any bubble forms which could not be read on the log to the right of the upload pane. Upon sucessful completion, you will have the option to download the following files:
1. A CSV file of all successfully processed forms' answers.
2. A CSV file of the resulting grades from comparing the answers to the answer key.
3. A CSV file containing alerts and warnings about potential mistakes. Examples: If a student left an answer blank. If a student possibly entered the wrong form number as evidenced by a score disparity between form versions.

## Troubleshooting
### I'm getting an error like "There is no file extension" 
Depending on your Windows enviroment, you may or may not need to specify an absolute file path to the UOScore App directory. 
The absolute path is included by default as follows:
```
wscript %~dp0dist\script\wsf\run.wsf
```
If you are saving the application in OneDrive and encounter an error, right click on *UOScoreApp.bat* and select "Edit in Notepad," then update the content as follows:
```
wscript dist\script\wsf\run.wsf
```
