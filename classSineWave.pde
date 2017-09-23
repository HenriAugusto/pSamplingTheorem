SineWave sineWave;


class SineWave extends WaveFunction{

    SineWave(float freq){
        setFrequency(freq);
    }
    
    @Override
    float f(float x){
        float output = sin(TWO_PI*frequency*x+distance);
        return output;
    };
}