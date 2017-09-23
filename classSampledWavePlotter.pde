SampledWavePlotter sampledWavePlotter;

class SampledWavePlotter{
    int delta = 10;
    float yScaling = height/3;
    SampledWavePlotterMode mode = SampledWavePlotterMode.ZERO_ORDER_HOLD;

    void plotWave(WaveFunction func){
      yScaling = height/3;
      pushStyle();
        for (int i = 0; i < width; i+=delta) {
            float x = map(i, 0, width, 0, windowSize);
            float y = -1*func.f(x)*yScaling+height/2;
            fill(32,64,256);
            stroke(0);
            strokeWeight(2);
            
            
            //line
            

            float x2 = map(i+delta, 0, width, 0, windowSize);
            float y2 = -1*func.f(x2)*yScaling+height/2;
            int ellipseRadius = 7;
            if(mode == SampledWavePlotterMode.ZERO_ORDER_HOLD){
              stroke(255,0,0);
              line(i, y, i+delta, y); //horizontal part, or the "hold"
              line(i+delta, y, i+delta, y2); //vertical part, or the sample value
            } else if(mode == SampledWavePlotterMode.LOLLIPOP){
              fill(32,32,255);
              color colour = color(112, 250, 20);
              fill(colour);
              stroke(colour);
              
              strokeWeight(5);
              line(i+delta, height/2, i+delta, y2); //vertical part, or the sample value
              ellipseRadius = 12;
              strokeWeight(2);
              stroke(0);
              
              
            }
            ellipse(i+delta, y2, ellipseRadius, ellipseRadius);
            
        }
      popStyle();
    }

    void setDelta(int i){
        delta=i;
    }
    
    void nextMode(){
      if(mode == SampledWavePlotterMode.ZERO_ORDER_HOLD){
        mode = SampledWavePlotterMode.LOLLIPOP;
      } else {
        mode = SampledWavePlotterMode.ZERO_ORDER_HOLD;
      }
    }
    
}

enum SampledWavePlotterMode{
  ZERO_ORDER_HOLD,
  LOLLIPOP;
}