class WeekStat {
  JSONArray days;
  int total;
  long week;
  boolean isValid;

  WeekStat(JSONObject weekstat) {
    if (weekstat.hasKey("days")) {
      try {
        days = weekstat.getJSONArray("days");
      } 
      catch (Exception e) {
        isValid = false;
      }
    }
    if (weekstat.hasKey("total")) {
      try {
        total = weekstat.getInt("total");
      } 
      catch (Exception e) {
        isValid = false;
      }
    }
    if (weekstat.hasKey("week")) {
      try {
        week = weekstat.getLong("week");
      } catch (Exception e) {
        isValid = false;
      }
    }
  }
}

