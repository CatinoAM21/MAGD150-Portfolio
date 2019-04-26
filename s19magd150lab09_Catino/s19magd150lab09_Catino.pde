//Used example code as base
//Stock image from https://www.pexels.com/photo/ocean-water-wave-photo-1295138/

// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 16-4: Display QuickTime movie
import processing.sound.*;
import processing.video.*;



//Declare sound.
SoundFile song;

FFT fft;
int bands = 512;

// Declare Movie object.
Movie movie; 
//Declare pimage
PImage img;

void setup() {
  size(360,634);



  // Step 2. Initialize Movie object.
  // Movie file should be in data folder
  img = loadImage("ocean.jpg");
  movie = new Movie(this, "typing.mp4"); 
song = new SoundFile(this, "Documentary.wav");

  // Step 3. Start movie playing
  movie.loop();
  
   song.loop();
   //analyzer
     fft = new FFT(this, bands);
  fft.input(song);
}

// Step 4. Read new frames from movie.
void movieEvent(Movie movie) {
  movie.read();
}

void draw() {
  

  
  // Step 5. Display movie.
  image(movie, 0, 0);
     
     image(img,150,65);
       fft.analyze();

  for (int i = 0; i < bands; i++) {
    stroke(0);
    // The FFT range is between 0 and 1, we map it to pixels
    float y = map(fft.spectrum[i], 0, 1, height * 0.75, 0);
    line(i, height * 0.75, i, y);
  }
     
}
