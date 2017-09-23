import static javax.swing.JOptionPane.*;
import static java.awt.Dimension.*;
import static java.awt.Toolkit.*;

float w, h;
float distance=0;
double speed = -0.01;
boolean distanceRunning = false;
float windowSize = 1;

boolean ctrlPressed, help, showAxis=true;
float maxFrequency;
float samplingRate = 0;

void settings(){
  //final String id = showInputDialog("new Frequency");
  Object[] options = { "Fullscreen", "windowed" };
  int choose = javax.swing.JOptionPane.showOptionDialog(null, "Fullscreen or windowed?", "pSamplingTheorem",
    javax.swing.JOptionPane.DEFAULT_OPTION, javax.swing.JOptionPane.WARNING_MESSAGE,  null, options, options[0]);
  if(choose==1){
    //size(1200, 768);
    java.awt.Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
    double w = screenSize.getWidth();
    double h = screenSize.getHeight();
    size(floor((float)w-50),floor((float)h)-100);
    println("windowed");
  } else {
    fullScreen();
    println("fullScren");
  }
 
}

void setup() {
    //size(1800, 768);
    
    //size(1800, 768);
    //fullScreen();
    surface.setResizable(true);
    surface.setLocation(0,0);
    print(surface);
    w = width;
    h = height;
    
    wavePlotter = new WavePlotter();
    sineWave = new SineWave(2);
    sampledWavePlotter = new SampledWavePlotter();
    smooth(0);
    setMaxFrequency();
    
    print(maxFrequency);
}

void draw() {
    background(255);
    wavePlotter.plot(sineWave);
    sampledWavePlotter.plotWave(sineWave);
    if( distanceRunning){
      distance += speed;
    }
    showGUI();
    
    if(showAxis){    drawAxis();  }
}

void mouseMoved(){
  if( ctrlPressed ){
    float newF = map(mouseY, 0, height, 0.1, 20);
    sineWave.setFrequency(newF);
    float newDelta = map(mouseX, 0, width, 1, width/10);
    sampledWavePlotter.setDelta((int)newDelta);
  }
}

void keyPressed(){
  println("keyCode"+keyCode);
  switch (key) {
    case 'a' :
      speed += 0.01;
      break;  
    case 's':
      speed -= 0.01;
      break;
    case 'f' :
        addFrequency(0.05);
      break;
    case 'g' :
        addFrequency(-0.05);
      break;
    case 'h':
        multFrequency(2);
        break;
    case 'j':
        multFrequency(0.5);
        break;
    case 'v' :
        sampledWavePlotter.delta -= 1;
        sampledWavePlotter.delta = max(1, sampledWavePlotter.delta);
      break;
      case 'm':
        mirror();
        break;
     case 'r':
       addFrequency(samplingRate);
       break;
     case 't':
       addFrequency(-samplingRate);
       break;
     case 'q':
       addFrequency(samplingRate/2);
       break;
     case 'w':
       addFrequency(-samplingRate/2);
       break;
    case 'b' :
        sampledWavePlotter.delta += 1;
        sampledWavePlotter.delta = min(sampledWavePlotter.delta, width/5);
      break;
    case 'z':
      distance = 0;
      break;
  }
  //sineWave.frequency = sineWave.frequency > maxFrequency ? maxFrequency : sineWave.frequency; 
  switch(keyCode){
    case 16: //shift
      distanceRunning = !distanceRunning;
      break;
    case 17 : //ctrl
      ctrlPressed=true;
      break;
    case 112 : //f1
      help = true;
      break;  
    case 113 : //f2
      showAxis = !showAxis;
      break;
    case 114 : //f3
      sampledWavePlotter.nextMode();
      break;
    case 116: //f5
      final String id = showInputDialog("new Frequency");
      frequencyFromUserInput(id);
      break;
  }
}

void keyReleased(){
  switch(keyCode){
    case 17 : //ctrl
      ctrlPressed=false;
      break;  
    case 112 : //f1
      help = false;
      break;

  }

}