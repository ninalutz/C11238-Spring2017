// An animated drawing of a Neural Network
// Daniel Shiffman <http://www.shiffman.net>
// Nature of Code
//Code modified by Nina Lutz

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
  
  //Connect them
  for(int i = 0; i < neurons.size() - 1; i++){
    network.connect(neurons.get(i), neurons.get(i+1), 1);
  }
  
  //Add to network
  for(int i = 0; i<neurons.size(); i++){
    network.addNeuron(neurons.get(i));
  }
 

}

void draw() {
  background(255);
  // Update and display the Network
  network.update();
  network.display();
  
  // Every 30 frames feed in an input
  if (frameCount % 30 == 0) {
    network.feedforward(random(1));
  }
}

