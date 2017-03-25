/*
Based off code by Daniel Shiffman in the Nature of Code 
Modified by Nina Lutz for MIT HSSP 
*/

Network network;

void setup(){
  size(800, 800); 
  smooth();
 
  // Create the Network object
  network = new Network(width/2, height/2);
  ArrayList<Neuron>neurons = new ArrayList<Neuron>();
  
  //Create Neurons
  for(int i = 0; i<10; i++){
    Neuron neuron = new Neuron(random(-200, 200), random(-200, 200));
    neurons.add(neuron);
  }
  
  //Connect them3
  for(int i = 0; i < neurons.size() - 1; i++){
    network.connect(neurons.get(i), neurons.get(i+1), 1);
  }
  
  //Add to network
  for(int i = 0; i<neurons.size(); i++){
    network.addNeuron(neurons.get(i));
  }

}

void draw(){
  background(255);
  network.update();
  network.display();
  
  if (frameCount % 30 == 0){
     network.feedforward(random(1));
 }
}

class Neuron{
  //Making the list of what the neuron might need
  PVector location;
  ArrayList<Connection>connections;
  float sum = 0;
  float r = 32;
  
  Neuron(float x, float y){
    location = new PVector(x,y);
    connections = new ArrayList<Connection>();
  }
  
  void addConnection(Connection c){
    //ArrayList.add(thing);
    connections.add(c);
  }
 
  void feedforward(float input){
    sum+=input;
    if (sum > 1){
      fire();
      sum = 0;
    }
  }
  
  void fire(){
    r = 64; 
    for (Connection c : connections){
      c.feedforward(sum);
    }
  }
  
  void display(){
    stroke(0); //black outline
    strokeWeight(1); //weight is 1
    float b = map(sum, 0, 1, 255, 0); 
    fill(b);
    ellipse(location.x, location.y, r, r);
    r = lerp(r, 32, 0.1);
  }
  
}

class Connection {
  // Connection is from Neuron A to B
  Neuron a;
  Neuron b;
  
  // Connection has a weight
  float weight;

  // Variables to track the animation
  boolean sending = false;
  PVector sender;
  
  // Need to store the output for when its time to pass along
  float output = 0;

  Connection(Neuron from, Neuron to, float w) {
    weight = w;
    a = from;
    b = to;
  }
  
  
  // The Connection is active
  void feedforward(float val) {
    output = val*weight;        // Compute output
    sender = a.location.get();  // Start animation at Neuron A
    sending = true;             // Turn on sending
  }
  
  // Update traveling sender
  void update() {
    if (sending) {
      // Use a simple interpolation
      sender.x = lerp(sender.x, b.location.x, 0.1);
      sender.y = lerp(sender.y, b.location.y, 0.1);
      float d = PVector.dist(sender, b.location);
      // If we've reached the end
      if (d < 1) {
        // Pass along the output!
        b.feedforward(output);
        sending = false;
      }
    }
  }
  
  // Draw line and traveling circle
  void display() {
    stroke(0);
    strokeWeight(1+weight*4);
    line(a.location.x, a.location.y, b.location.x, b.location.y);

    if (sending) {
      fill(0);
      strokeWeight(1);
      ellipse(sender.x, sender.y, 16, 16);
    }
  }
}



class Network {
  // The Network has a list of neurons
  ArrayList<Neuron> neurons;
  
  // The Network now keeps a duplicate list of all Connection objects.
  // This makes it easier to draw everything in this class
  ArrayList<Connection> connections;
  PVector location;

  Network(float x, float y) {
    location = new PVector(x, y);
    neurons = new ArrayList<Neuron>();
    connections = new ArrayList<Connection>();
  }

  // We can add a Neuron
  void addNeuron(Neuron n) {
    neurons.add(n);
  }

  // We can connection two Neurons
  void connect(Neuron a, Neuron b, float weight) {
    Connection c = new Connection(a, b, weight);
    a.addConnection(c);
    // Also add the Connection here
    connections.add(c);
  } 
  
  // Sending an input to the first Neuron
  // We should do something better to track multiple inputs
  void feedforward(float input) {
    Neuron start = neurons.get(0);
    start.feedforward(input);
  }
  
  // Update the animation
  void update() {
    for (Connection c : connections) {
      c.update();
    }
  }
  
  // Draw everything
  void display() {
    pushMatrix();
    translate(location.x, location.y);
    for (Neuron n : neurons) {
      n.display();
    }

    for (Connection c : connections) {
      c.display();
    }
    popMatrix();
  }
}

