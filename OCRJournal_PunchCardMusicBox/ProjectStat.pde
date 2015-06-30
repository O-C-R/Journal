class ProjectStat {
  ArrayList<WeekStat> activity;
  String project;

  ProjectStat(String projectName) {
    project = projectName;
    activity = new ArrayList();
    loadGithubHistory(project);
  }

  void loadGithubHistory(String filename) {
    //load json files for each repo of year-long commit activity
    JSONArray githubStats = loadJSONArray(filename + ".json");

    for (int i = 0; i < githubStats.size (); i++) {
      JSONObject week = githubStats.getJSONObject(i);
      WeekStat w = new WeekStat(week);
      activity.add(w);
    }
  }

  void drawGithubActivity() {
    //these values have been tuned to work with this music box: 
    int xMargin = 15;
    int yMargin = 53;
    float horzSpacer = 11.6;
    float vertSpacer = 11.95;
    println(activity.size());
    for (int j = 0; j < activity.size (); j++) {
      WeekStat w = activity.get(j);
      println(w.days);
      int[] dayArray = w.days.getIntArray();
      for (int x = 0; x < 7; x++) {
        if (dayArray[x] > 0) {
          fill(0);
        } else {
          stroke(0);
          noFill();
        }
        ellipse(xMargin + x*horzSpacer, yMargin + j * vertSpacer, 4, 4);
      }
    }
  }
} //end class ProjectStat

