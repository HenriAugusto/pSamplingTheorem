float setFrequency(float newF) {
  setMaxFrequency();
  //TOO HIGH
  if ( newF > maxFrequency) {
    javax.swing.JOptionPane.showMessageDialog(null, "Final frequency: "+newF+" is beyond the application's max frequency ("+maxFrequency+")", "Error", javax.swing.JOptionPane.ERROR_MESSAGE);
    //newF = maxFrequency;
    return sineWave.frequency;
  }
  //TOO LOW
  float minFrequency = -maxFrequency;
  if ( newF < minFrequency) {
    javax.swing.JOptionPane.showMessageDialog(null, "Final frequency: "+newF+" is beyond the application's min frequency ("+minFrequency+")", "Error", javax.swing.JOptionPane.ERROR_MESSAGE);
    //newF = minFrequency;
    return sineWave.frequency;
  }
  //CAN'T BE ZERO! (since we are "erroneously" using phase as distance)
  float closestToZero = 0.0001;
  if(abs(newF) < closestToZero){
    newF = closestToZero;
    //return sineWave.frequency;
  }
  sineWave.frequency = newF;
  return newF; //returns final frequency
}

void setMaxFrequency(){
  float pixelDuration = 1/(float)width;
    float deltaPeriod = pixelDuration*1; //delta 1 for situation of max sampling
    maxFrequency = 1/deltaPeriod; //sampling rate of the drawing!
      maxFrequency /= 2; //drawing's nyquist
      maxFrequency *= 0.8; //some safe range
}

float addFrequency(float delta) {
  return setFrequency( sineWave.frequency+delta );
}

float multFrequency(float scalar) {
  return setFrequency( sineWave.frequency*scalar );
}

void mirror() {
  float nyquist = samplingRate/2;
  if(nyquist+nyquist-sineWave.frequency > maxFrequency){
    javax.swing.JOptionPane.showMessageDialog(null, "Final frequency: "+(nyquist+nyquist-sineWave.frequency)+" is beyond the application's max frequency ("+maxFrequency+")", "Error", javax.swing.JOptionPane.ERROR_MESSAGE);
  } else {
    setFrequency( nyquist+nyquist-sineWave.frequency );
  }
}

void frequencyFromUserInput(String s) {
  try {
    Float f = Float.parseFloat(s);
    println("float = "+f);
    setFrequency(f);
  } 
  catch (NumberFormatException nfe) {
    javax.swing.JOptionPane.showMessageDialog(null, "Wrong frequency: "+s, "Error", javax.swing.JOptionPane.ERROR_MESSAGE);
  }
}