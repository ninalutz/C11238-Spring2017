ArrayList<merp> Network = new ArrayList<merp>();
int emotion_joy, emotion_anger, emotion_anticipation, emotion_fear, emotion_trust, emotion_surprise, emotion_sadness, emotion_disgust;

processing.data.JSONObject json;

int tweet_to_ret;

public class merp {
  public String [] words;
  public int _joy, _anger, _anticipation, _fear, _trust, _surprise, _sadness, _disgust;

  public int [] feelings = {_anger, _disgust, _sadness, _trust, _fear, _surprise, _anticipation, _joy};
  merp(String[] _words){
  words = _words;
  }
}

public IntList networkfeels;
public IntDict hm, h2;
String thing = "  ";

public String[] test;


void analyze_Network(){
  json = loadJSONObject("data/words.json");
      hm = new IntDict();
      h2 = new IntDict();
      networkfeels = new IntList();
  for(int i = 0; i<Network.size(); i++){
     for (int j = 0; j<Network.get(i).words.length; j++){
       try{
         json.getJSONObject(Network.get(i).words[j]);
         
         Network.get(i)._joy+=json.getJSONObject(Network.get(i).words[j]).getInt("joy");
         Network.get(i).feelings[7] += json.getJSONObject(Network.get(i).words[j]).getInt("joy");
         emotion_joy += json.getJSONObject(Network.get(i).words[j]).getInt("joy");
         
         Network.get(i)._anger+=json.getJSONObject(Network.get(i).words[j]).getInt("anger");
         Network.get(i).feelings[0] += json.getJSONObject(Network.get(i).words[j]).getInt("anger");
         emotion_anger += json.getJSONObject(Network.get(i).words[j]).getInt("anger");
         
         Network.get(i)._anticipation+=json.getJSONObject(Network.get(i).words[j]).getInt("anticipation");
         Network.get(i).feelings[6] += json.getJSONObject(Network.get(i).words[j]).getInt("anticipation");
         emotion_anticipation += json.getJSONObject(Network.get(i).words[j]).getInt("anticipation");
         
         Network.get(i)._sadness+=json.getJSONObject(Network.get(i).words[j]).getInt("sadness");
         Network.get(i).feelings[2] += json.getJSONObject(Network.get(i).words[j]).getInt("sadness");
         emotion_sadness += json.getJSONObject(Network.get(i).words[j]).getInt("sadness");
         
         Network.get(i)._fear+=json.getJSONObject(Network.get(i).words[j]).getInt("fear");
         Network.get(i).feelings[4] += json.getJSONObject(Network.get(i).words[j]).getInt("fear");
         emotion_fear += json.getJSONObject(Network.get(i).words[j]).getInt("fear");
         
         Network.get(i)._trust+=json.getJSONObject(Network.get(i).words[j]).getInt("trust");
         Network.get(i).feelings[3] += json.getJSONObject(Network.get(i).words[j]).getInt("trust");
         emotion_trust += json.getJSONObject(Network.get(i).words[j]).getInt("trust");
         
         Network.get(i)._disgust+=json.getJSONObject(Network.get(i).words[j]).getInt("disgust");
         Network.get(i).feelings[1] += json.getJSONObject(Network.get(i).words[j]).getInt("disgust");
         emotion_disgust += json.getJSONObject(Network.get(i).words[j]).getInt("disgust");
        
         Network.get(i)._surprise+=json.getJSONObject(Network.get(i).words[j]).getInt("surprise");
         Network.get(i).feelings[5] += json.getJSONObject(Network.get(i).words[j]).getInt("surprise");
         emotion_surprise += json.getJSONObject(Network.get(i).words[j]).getInt("surprise");
         
       }
       catch(Exception e){}

     }
  }

    hm.set("anger", emotion_anger);
    hm.set("joy", emotion_joy);
    hm.set("sadness", emotion_sadness);
    hm.set("disgust", emotion_disgust);
    hm.set("surprise", emotion_surprise);
    hm.set("anticipation", emotion_anticipation);
    hm.set("anger", emotion_anger);
    hm.set("fear", emotion_fear);
    
    h2.set("anger", 0);
    h2.set("disgust", 1);
    h2.set("sadness", 2);
    h2.set("trust", 3);
    h2.set("fear", 4);
    h2.set("surprise", 5);
    h2.set("anticipation", 6);
    h2.set("joy", 7);
    
    hm.sortValuesReverse();
    test = hm.keyArray();
    
    println(hm, test[0], test[1], test[2]);
    
    c1 = colarray[h2.get(test[0])];
    r1 = colarray[h2.get(test[1])];
    l1 = colarray[h2.get(test[2])];
    
    int max = Network.get(0).feelings[h2.get(test[0])];
        for (int k = 0; k<Network.size(); k++){
       int current = Network.get(k).feelings[h2.get(test[0])];
       if (current > max){
         max = current;
         tweet_to_ret = k;
       }
    }
 
    for(int i = 0; i<Network.get(tweet_to_ret).words.length; i++){
       thing += " " + Network.get(tweet_to_ret).words[i];
    }
}