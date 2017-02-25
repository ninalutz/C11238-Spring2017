//edges divided into different arraylists
ArrayList<Edge> all = new ArrayList<Edge>();
ArrayList<Edge> french = new ArrayList<Edge>();
ArrayList<Edge> spanish = new ArrayList<Edge>();
ArrayList<Edge> other = new ArrayList<Edge>();

//Nodes are all nodes generated, Network is active nodes (ones with edges)
ArrayList<Node> Nodes = new ArrayList<Node>();
ArrayList<Node> Network = new ArrayList<Node>();

//colors assigned by language
color[] colarray = new color[3];
String[] language = {
    "spanish", "other", "french"
};

//generates a random network of nodes and edges
void generate(){
    //sets colors
    colarray[0] = color(255,140,0); //orange; spanish
    colarray[1] = color(239, 205, 255); //purple; other
    colarray[2] = color(0, 102, 200); //blue; french
    
   for(int i = 0; i<numnodes; i++){
        PVector location = new PVector(random(50, width-250), random(50, height-300));
        Node node = new Node(location, i, 0);
        Nodes.add(node);
    }
    
    //generates arrays of edges
    for(int i = 0; i<numedges; i++){
        int k = int(random(0, 3));
        int j = int(random(0, Nodes.size()));
        int h = int(random(0, Nodes.size()));
        int amount = int(random(5, 20));
        int type = k;
        Edge edge = new Edge(Nodes.get(j).location, Nodes.get(h).location, increment, amount, colarray[k], type, j, h, i);

        //adds to Network (active nodes) and all edges 
        Network.add(Nodes.get(j));
        Network.add(Nodes.get(h));
        all.add(edge);
        
        //println("Edge", i, "comes from tower ", j, "and goes to ", h, "with ", amount, "people of type ", type);
        
        //adds nationalities to their appropriate arrays, by type
        if(type == 2){
          french.add(edge);
        }
        if(type == 0){
          spanish.add(edge);
        }
        if(type == 1){
          other.add(edge);
        }
    }
}
