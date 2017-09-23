WavePlotter wavePlotter;

class WavePlotter{
    float yScaling = height/3;

    void plot(WaveFunction func){
        yScaling = height/3;
        for (int i = 0; i < width; ++i) {
            float x = map(i, 0, width, 0, windowSize);
            float y = -1*func.f(x)*yScaling+height/2; //-1 because the coordinates of processing are reversed
            stroke(0);
            fill(0);
            strokeWeight(2);
            //ellipse(i, y, 2, 2);
            //point2
            float x2 = map(i+1, 0, width, 0, windowSize);
            float y2 = -1*func.f(x2)*yScaling+height/2;
            stroke(0);
            fill(0);
            //ellipse(i, y2, 2, 2);

            //line
            line(i, y, i+1, y2);
        }
    }
}