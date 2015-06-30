import ocrUtils.maths.*;
import ocrUtils.*;
/****************************
 In order to generate the JSON files with your github activity,
 use the terminal and the github API to return the statistics.
 Using this call: https://developer.github.com/v3/repos/statistics/#commit-activity
 Get the data by typing your own version of it into the terminal: 
 GET /repos/:owner/:repo/stats/commit_activity
 
 For example:
 - If the repo is public
 curl https://api.github.com/veev/empire/stats/commit_activity
 
 - If the repo is private
 curl --user "veev" https://api.github.com/O-C-R/einstein/stats/commit_activity
 (you will be prompted for your password)
 
Once you have the results returned, save them into a JSON file. 
Repeat for as  many repos as you'd like to include in your punch card paper player
 
One the PDF file is output, take it into Illustrator, and change stroke weight to 0.001 pt. 
Make sure the stroke is (255,0,0) or whatever color is mapped to cut on a lasercutter
 
 *******************************/

import ocrUtils.ocr3D.*;
import processing.pdf.*;

//ArrayList<WeekStat> empireActivity = new ArrayList();
ArrayList<ProjectStat> allRepos = new ArrayList();

void setup() {
  size (117, 684);
  background(255);

  //saving to pdf setup
  noLoop();
  String timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  beginRecord(PDF, timestamp + ".pdf");

  OCRUtils.begin(this);
  String filePath = "/Users/genevieve/Documents/Processing/OCRJournal_PunchCardMusicBox/data/"; ////change this filepath to work with your own Processing folder
  String[] allFiles = OCRUtils.getFileNames(filePath, false);

  //load json files for each repo of year-long commit activity
  for (String fileName : allFiles) {
    String name = splitTokens (fileName, "/")[splitTokens(fileName, "/").length-1];
    String repoName = splitTokens(name, ".")[0];
    println(repoName);
    ProjectStat ps = new ProjectStat(repoName);
    allRepos.add(ps);
  }

  //  JSONArray empire = loadJSONArray("empire.json");
  //
  //  for (int i = 0; i < empire.size (); i++) {
  //    JSONObject week = empire.getJSONObject(i);
  //    WeekStat w = new WeekStat(week);
  //
  //    empireActivity.add(w);
  //  }
}

void draw() {

  for (ProjectStat proj : allRepos) {
    proj.drawGithubActivity();
  }

  //  for (int j = 0; j < empireActivity.size (); j++) {
  //    WeekStat w = empireActivity.get(j);
  //    println(w.days);
  //    int[] dayArray = w.days.getIntArray();
  //    for (int x = 0; x < 7; x++) {
  //      if (dayArray[x] > 0) {
  //        fill(255);
  //      } else {
  //        stroke(255);
  //        noFill();
  //      }
  //      ellipse(xMargin + x*horzSpacer, yMargin + j * vertSpacer, 4, 4);
  //    }
  //  }

  endRecord();
}

