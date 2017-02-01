/*NODE Class

The node class has attributes for the nodes

Grey nodes are not connected, yellow nodes are part of the Network

The brighter the yellow, the higher the total in and out flow of that node

Every node knows what edge it belongs to (as an origin or destination), as well as the total amounts flowing in and out of it, seperated by type
*/

public class Node{
  PVector location; 
  int id, total, totalin, frenchin, frenchout, spanishin, spanishout, otherin, otherout;
  ArrayList<Edge> edgeout = new ArrayList<Edge>();
  ArrayList<Edge> edgein = new ArrayList<Edge>();
  
  Node(PVector _location, int _id, int _total){
        location = _location;
        id = _id;
        total = _total;
            }
    
  void drawNetworkNodes(){
        noStroke();
        fill(#ffff00, 50*(total/5));
        ellipse(location.x, location.y, 30, 30);
      }
      
 void drawNodes(){
        noStroke();
        if(total == 0){
          fill(100, 100);
          ellipse(location.x, location.y, 30, 30);
        }
        textSize(18);
        fill(#ff0000);
        text(str(id), location.x+15, location.y-5);
     }   

  void analyze(){
    for(int i = 0; i<people.size(); i++){
            if(id == people.get(i).origin_id){
                //println("I am origin", id, location, "for edge ", i, "with amount ", people.get(i).amount, "and type ", people.get(i).type);
                edgeout.add(people.get(i));
                total+=people.get(i).amount;
                    if(people.get(i).type == 0){ //spansih
                        spanishout+=people.get(i).amount;
                    }
                    else if(people.get(i).type == 1){ //other
                        otherout+=people.get(i).amount;
                    }
                    else{
                        frenchout+=people.get(i).amount;
                    }
            }
            if(id == people.get(i).destination_id){
                //println("I am destination", id, location, "for edge ", i, "with amount ", people.get(i).amount, "and type ", people.get(i).type);
                edgein.add(people.get(i));
                total+=people.get(i).amount;
                totalin+=people.get(i).amount;
                 if(people.get(i).type == 0){ //spansih
                        spanishin+=people.get(i).amount;
                    }
                    else if(people.get(i).type == 1){ //other
                        otherin+=people.get(i).amount;
                    }
                    else{
                        frenchin+=people.get(i).amount;
                    }
            }
        }
  }
  
}