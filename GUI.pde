void showGUI(){
  pushStyle();
    stroke(0);
    fill(0);
    textSize(18);
    float spaceBetweenTexts = 75;
    //text("distance = "+distance, 25, 25);
    String holdF1 = "Hold [F1] for help"; 
    text(holdF1, 25, 25);
    ///text("speed = "+-1*speed/60, 25, 50);
    
    text("wave frequency = "+sineWave.frequency+" Hz", 25+textWidth(holdF1)+spaceBetweenTexts, 25);
        
    float pixelDuration = 1/(float)width;
    float deltaPeriod = pixelDuration*sampledWavePlotter.delta;
    samplingRate = 1/deltaPeriod;
    String samplingStr ="Sampling Rate = "+samplingRate+" Hz\nNyquist frequency "+samplingRate/2+" Hz";
    text(samplingStr, 650, 25);

    if(help){
      int numberOfLines = 15; //count bellow
      float textHeight = textAscent()+textDescent();
        //textHeight *= 0.7;
        textHeight *= numberOfLines;
      fill(255, 235);
      rect(0, 0, width, height);
      fill(0);
      String helpStr = "[F2] to hide/show x axis\n"+
      "[F3] to switch between zero order hold and lollipop representation\n"+
      "[F5] to type the wave frequency\n"+
      "Press [Shift] to pause/unpause movement\n"+
      "[shift] to pause/resume wave motion\n"+
        "[A] and [S] to adjust wave speed\n"+
        "[Z] to reset wave position\n"+
        "[F] and [G] makes the wave's frequency higher and lower\n"+
        "[H] and [J] to double and halve wave's frequency\n"+
        "[V] and [B] raises and lowers the sampling rate\n"+
        "Hold [Ctrl] and move your mouse to use mouse coordinates to set frequency and sampling rate\n"+
        "[R] and [T] to add the sampling rate to the wave's frequency\n"+
        "[Q] and [W] to add the nyquist frequency to the waves's frequency\n"+
        "[M] to mirror the frequency arround nyquist\n"+
        "\n                                                               created by Henri Augusto";
      
      text( helpStr, width-textWidth(helpStr)-50, height-textHeight-100);
        
    }
    popStyle();
}