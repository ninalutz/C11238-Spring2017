//edges divided into different arraylists
ArrayList<Edge> people = new ArrayList<Edge>();

//Nodes are people nodes generated, Network is active nodes (ones with edges)
ArrayList<Node> Nodes = new ArrayList<Node>();
ArrayList<Node> Network = new ArrayList<Node>();

void generate_nodes(){
     for(int i = 0; i<numnodes; i++){
        PVector location = new PVector(random(50, width-250), random(50, height-300));
        Node node = new Node(location, i, 0);
        Nodes.add(node);
    }
}

//generates a random network of nodes and edges
void generate(){
    
    //generates arrays of edges
    for(int i = 0; i<numedges; i++){
        int j = int(random(0, Nodes.size()));
        int h = int(random(0, Nodes.size()));
        int amount = int(random(5, 20));
        //int type = k;
        Edge edge = new Edge(Nodes.get(j).location, Nodes.get(h).location, increment, amount, #66b3ff, 1, j, h, i);

        //adds to Network (active nodes) and people edges 
        Network.add(Nodes.get(j));
        Network.add(Nodes.get(h));
        people.add(edge);
    }
}
