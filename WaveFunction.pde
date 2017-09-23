abstract class WaveFunction{
  float frequency;
  
  void setFrequency(float freq){ frequency=freq; }
  
  abstract float f(float x);
  
}