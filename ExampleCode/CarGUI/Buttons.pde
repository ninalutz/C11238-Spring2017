import de.bezier.guido.*;
import controlP5.*;

int offset = 80;
int offset1 = 100;
ControlP5 cp5;
SimpleButton AM, PM, CarButton, CarPoolButton, Distributed, AutoPlay, Congestion, ODButton, Dynamic, Carpool;
boolean am, pm, income1, income2, distribute, autoplay, congestion, steadystate, carpool, dynamic;

void initButtons(){

    Interactive.make( this );
    AM = new SimpleButton(300 + offset1, 47, 35, 25, "AM", am);
    PM = new SimpleButton(350 + offset1, 47, 35, 25, "PM", pm);
    CarButton = new SimpleButton(450 + offset1, 15, 125, 25, "Show Cars", cars);
    CarPoolButton = new SimpleButton(590 + offset1, 15, 125, 25, "Carpool", carpool);
    Distributed = new SimpleButton(730 + offset1, 15, 125, 25, "Distribute", distribute);
    Dynamic = new SimpleButton(870 + offset1, 31, 125, 25, "Dynamic", dynamic);
    Congestion = new SimpleButton(590 + offset1, 47, 125, 25, "Congestion", congestion);
    ODButton = new SimpleButton(730 + offset1, 47, 125, 25, "Show OD", steadystate);
    AutoPlay = new SimpleButton(450 + offset1, 47, 125, 25, "Play/Pause", autoplay);
    AM.on = true;
}

void initSliders(){
  textSize(20);
    if(AM.on == true){
    cp5.addSlider("t")
     .setPosition(30 + offset,50)
     .setSize(200,20)
     .setValue(9)
     .setColorBackground(0) 
     .setColorActive(accentred)
     .setColorLabel(background)
     .setColorValue(background)
     .setColorValueLabel(background)
     .setRange(6,11)
     .setDecimalPrecision(0)
     .setNumberOfTickMarks(4)
     .snapToTickMarks(true)
     .showTickMarks(false) 
     ;
    }
    
   if(AM.on == false){
    cp5.addSlider("t")
     .setPosition(30 + offset,50)
     .setSize(200,20)
     .setValue(5)
     .setColorBackground(0) 
     .setColorActive(accentred)
     .setColorLabel(background)
     .setColorValue(background)
     .setColorValueLabel(background)
     .setRange(4,11)
     .setDecimalPrecision(0)
     .setNumberOfTickMarks(8)
     .snapToTickMarks(true)
     .showTickMarks(false) 
     ;
    }
   
    
 cp5.getController("t").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
     
}



public class SimpleButton
{
    float x, y, width, height;
    String label;
    boolean on, control;
    
    SimpleButton ( float xx, float yy, float w, float h, String _label, boolean thing)
    {
        x = xx; y = yy; width = w; height = h;
        label = _label;
        control = thing;
        
        
        Interactive.add( this ); // register it with the manager
    }

    // called by manager
    
    void mousePressed () 
    {
        on = !on;
        //initSliders();
        
        sw.start();
        
        if(control == distribute){
            sw2.start();
        }
        
        if(control == am || control == pm){
          initSliders();
        }

        
    }

    void draw () 
    {
 
//        on = control;
        control = on;
      
        if ( on ) fill( accentred );
        else fill( medblue );
        

        rect(x, y, width, height, 2);
        fill(accentwhite);
        textAlign(CENTER);
        textSize(16);
        text(label, x + width/2, y + (height*.8));
    }
}
