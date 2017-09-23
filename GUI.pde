void showGUI(){
  pushStyle();
    stroke(0);
    fill(0);
    float spaceBetweenTexts = 75;
    float fontScalar = 1.3; // Different for each font
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
      
      fill(255, 235);
      rect(0, 0, width, height);
      fill(0);
      String helpStr = "--Interface\n\n"+
      "[F2] to hide/show x axis\n"+
      "[F3] to switch between zero order hold and lollipop representation\n"+
      "[F5] to type the wave frequency\n"+
      "\n--Wave Motion\n\n"+
      "Press [Shift] to pause/unpause movement\n"+
      "[shift] to pause/resume wave motion\n"+
        "[A] and [S] to adjust wave speed\n"+
        "[Z] to reset wave position\n"+
        "\n--Wave frequency\n\n"+
        "[F] and [G] makes the wave's frequency higher and lower\n"+
        "[H] and [J] to double and halve wave's frequency\n"+
        "\n--Sampling Rate\n\n"+
        "[V] and [B] raises and lowers the sampling rate\n"+
        "[R] and [T] to add the sampling rate to the wave's frequency\n"+
        "[Q] and [W] to add the nyquist frequency to the waves's frequency\n"+
        "[M] to mirror the frequency arround nyquist\n"+
        "Hold [Ctrl] and move your mouse to use mouse coordinates to set frequency and sampling rate\n"+
        "\n                                                               created by Henri Augusto";
      //String[] lines = helpStr.split("\r\n|\r|\n");
      String[] lines = helpStr.split("\n");
      println("===============lines============");
      for(int i=0;i<lines.length;++i){
        //println("line["+i+"] = "+lines[i]);
      }
      
      int numberOfLines = lines.length; 
      textSize(18);
      float textHeight = textAscent()+textDescent();
        //textHeight *= 0.7;
        textHeight *= fontScalar*(numberOfLines-1);
      
      text( helpStr, width-textWidth(helpStr)-50, height-textHeight);
        
    }
    popStyle();
}