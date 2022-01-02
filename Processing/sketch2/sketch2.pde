import processing.sound.*;

SinOsc[] sineWaves;
float[] sineFreq;
int numSines = 5;

void setup() {
    size(640, 480);
    background(255);


sineWaves = new SinOsc[numSines];
sineFreq = new float[numSines];


for (int i = 0; i < numSines; i++) {
    float sineVol = (1.0 / numSines) / (i + 1);
    sineWaves[i] = new SinOsc(this);
    sineWaves[i].play();
    sineWaves[i].amp(sineVol);
    }
}

void draw() {
    float yoffset = map(mouseY, 0, height, 0, 1);
    float frequency = pow(1000, yoffset) + 150;
    float detune = map(mouseX, 0, width, -0.5, 0.5);

    for (int i = 0; i < numSines; ++i) {
        sineFreq[i] = frequency * (i + 1 * detune);
        sineWaves[i].freq(sineFreq[i]);
    }
}