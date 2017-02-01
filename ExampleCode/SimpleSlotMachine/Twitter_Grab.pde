ResponseList<Status> statuses;
String readouttemp = "    ";
void query_twitter(){
  ConfigurationBuilder cb = new ConfigurationBuilder();
cb.setOAuthConsumerKey("xgRlTOqCFvOTXcLkXDJ9grY1c");
cb.setOAuthConsumerSecret("ElUdi1DaolQ733rpqIgnh3NB0yDwQjao9j3LDdxbh6X2Uw7etL");
cb.setOAuthAccessToken("3105596274-fKf8s7acUB5OOmamOmssDoHbsJ0DHASmgCVUH0d");
cb.setOAuthAccessTokenSecret("vdtakNa7zgZE59GA3VXfAWrvUy1nWoWtRtAOQDo68YRuB");
  Twitter twitter = new TwitterFactory(cb.build()).getInstance();

 try { 
    Paging paging = new Paging(1, 50); 
    statuses = twitter.getHomeTimeline(paging); 
    String[] input;
    input = "hello there".split(" ");
    for (Status status : statuses) { 
      println(status.getUser().getName() + ":" + status.getText());
       readouttemp = status.getUser().getName() + ":" + status.getText();
       input = status.getText().split(" ");
       merp Merp = new merp(input);
       Network.add(Merp);
    }
  } 
  catch(TwitterException te) { 
    println("Couldn''t connect: " + te);
  }
  analyzing = false;
}